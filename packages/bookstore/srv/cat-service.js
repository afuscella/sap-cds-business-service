/**
 * Implementation for CatalogService defined in ./cat-service.cds
 */
module.exports = (srv) => {

    const {Books} = cds.entities;

    srv.after('READ', 'Books', (each) => {
        if (each.stock > 15) {
            each.title += ' -- 11% discount!';
        }
    })

    srv.before('CREATE', 'Orders', async (req) =>{
        const tx = cds.transaction(req), order = req.data;
        order.Total = 0;

        if (order.Items) {
            const affectedRows = await updateStock(tx, order.Items);

            if (affectedRows.some(row => row)) {
                for (item of order.Items) {
                    order.Total += await calculateTotal(tx, item);
                }

            } else {
                req.error(409, 'Sold out, sorry') 
            } 
        }
    })

    /**
     * 
     * @param {*} tx 
     * @param {*} items 
     */
    async function updateStock(tx, items) {
        return await tx.run(items.map(item =>
            UPDATE(Books) 
                .where({ID: item.book_ID})
                .and(`stock >=`, item.amount)
                .set(`stock -=`, item.amount)
            )
        )
    }

    /**
     * 
     * @param {*} tx 
     * @param {*} item 
     */
    async function calculateTotal(tx, item) {
        return await 
            tx.run( 
                SELECT.from(Books).where({ID: item.book_ID})
            ).then(function (books) {
                let value = books.map(data => { return formatTotal(data.price, item.amount) });
                return parseFloat(value);
        })
    }

    /**
     * 
     * @param {*} price 
     * @param {*} amount 
     */
    function formatTotal(price, amount) {
        return price * amount;
    }
}
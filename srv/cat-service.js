module.exports = (srv) => {
    
    // mock data for Books entity
    srv.on ('READ', 'Books', () =>[
        { ID: 181, title: "Designing Great Beers", author_ID: 10000001, stock: 10 },
        { ID: 203, title: "The Homebrew Handbook", author_ID: 10000002, stock: 52 },
        { ID: 204, title: "The Pocket Homebrew Handbook", author_ID: 10000002, stock: 138 },
        { ID: 542, title: "Small Brewery Finance", author_ID: 10000004, stock: 5 }
    ])

        // mock data for Authors entity
    srv.on('READ', 'Authors', () =>[
        { ID: 10000001, name: "Ray Daniels" },
        { ID: 10000002, name: "Dave Law" },
        { ID: 10000004, name: "Maria Pearman" }
    ])
}
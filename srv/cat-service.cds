using { com.bookstore as bookstore } from '../db/data-model';

service CatalogService {
    @readonly entity Books as select from bookstore.Books{
        *,
        author.name 
    } excluding {
        createAt,
        createdBy,
        modifiedAt,
        modifiedBy  
    };

    @readonly   entity Authors as projection on bookstore.Authors;
    
    @requires_: 'authenticated-user'
    @insertOnly entity Orders  as projection on bookstore.Orders
}
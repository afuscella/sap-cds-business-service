using com.bookstore as bookstore from '../db/data-model';

service CatalogService {
    entity Books   @readonly   as projection on bookstore.Books;
    entity Authors @readonly   as projection on bookstore.Authors;
    entity Orders  @insertOnly as projection on bookstore.Orders
}
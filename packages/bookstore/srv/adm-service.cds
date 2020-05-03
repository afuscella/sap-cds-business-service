using { com.bookstore as bookstore } from '../db/data-model';

service AdminService @(_requires: 'admin' ) {
    entity Books   as projection on bookstore.Books;
    entity Movies  as projection on bookstore.Movies;
    entity Authors as projection on bookstore.Authors;
    entity Orders  as projection on bookstore.Orders
}
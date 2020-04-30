using { com.bookstore as bookstore } from '../db/data-model';

service AdminService @(_requires: 'admin' ) {
    @insert @update entity Books   as projection on bookstore.Books;
    @insert @update entity Authors as projection on bookstore.Authors;
    @insertOnly     entity Orders  as projection on bookstore.Orders
}
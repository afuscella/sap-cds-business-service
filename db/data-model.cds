namespace com.bookstore;
using { cuid, Currency, User, managed } from '@sap/cds/common';

entity Books : managed, additionalInfo {
    key ID     : Integer;
    title      : localized String;
    descr      : localized String;
    author     : Association to Authors;
    stock      : Integer;
    price      : Decimal(9,2);
    currency   : Currency;
}
    
entity Authors : managed {
    key ID  : Integer;
    name    : String;
    books   : Association to many Books on books.author = $self;
}

entity Orders : cuid, managed {
    OrderNo : String @title: 'OrderNo';
    Items   : Composition of many Items on Items.parent = $self;
    Total   : Decimal (9,2);
}

entity Items : cuid, managed {
    parent  : Association to Orders;
    book    : Association to Books;
    amount  : Integer;
}

entity Movies   : managed, additionalInfo {
    key ID      : Integer;
    name        : String;
    releaseDate : Integer;
}

type Genre : String enum {
    Mistery; Fiction; Drama; Action; Adventure; Tutorial;
}

aspect additionalInfo {
    genre: Genre;
    language: String(200);
}
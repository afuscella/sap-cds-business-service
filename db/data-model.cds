namespace com.bookstore;
using { Currency, User, managed } from '@sap/cds/common';

entity Books : managed, additionalInfo {
    key ID     : Integer;
    title      : localized String;
    descr      : localized String;
    author     : Association to Authors;
    stock      : Integer;
    price      : Decimal(9,2);
    currency   : Currency;
    createAt   : DateTime @cds.on.update: $now;
    createdBy  : User     @cds.on.insert: $user;
    modifiedAt : DateTime @cds.on.update: $now;
    modifiedBy : User     @cds.on.insert: $user;
}
    
entity Authors {
    key ID  : Integer;
    name    : String;
    books   : Association to many Books on books.author = $self;
}

entity Orders : managed {
    key ID  : UUID;
    OrderNo : String @title: 'OrderNo';
    Items   : Composition of many Items on Items.parent = $self;
    Total   : Decimal (9,2);
}

entity Items : managed {
    key ID  : UUID;
    parent  : Association to Orders;
    book    : Association to Books;
    amount  : Integer;
}

entity Movies   : additionalInfo {
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
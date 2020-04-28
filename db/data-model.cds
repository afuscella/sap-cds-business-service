namespace com.bookstore;
using { Country, Currency, User, managed } from '@sap/cds/common';

entity Books {
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
    orderNo : String @(
        title: 'OrderNo',
        description: 'Order Number'
    );
    items   : Composition of many Items on items.parent = $self;
    country : Country;
    total   : Decimal(9,2); 
}

entity Items : managed {
    key ID  : UUID;
    parent  : Association to Orders;
    book    : Association to Books;
    country : Country;
    amount  : Integer;
}
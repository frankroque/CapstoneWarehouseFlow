//
//  CrudOperations.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/5/21.
//

import Foundation

//Create Read Update Delete
//These variables are the ones that the database performs the CRUD opertations on
struct CrudOperations: Identifiable{
    var id: String
    var productName: String
    var productAmount: String
    var productType: String
    var productLocation: String
}

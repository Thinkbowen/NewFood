//
//  Order.swift
//  takeoutfood
//
//  Created by Jennifer Wu on 2018-01-04.
//  Copyright © 2018 fred. All rights reserved.
//

import Foundation
struct Order:Decodable {
    var user: User
    var chef: Chef
    var dishs: [Dish]?
    var discount: String?
    var note: String?
    var price: Float
    var status: String
    var accepted: Bool
    var deliveryLocation: Location?

    init(){
        self.user = User()
        self.chef = Chef()
        self.dishs = [Dish]()
        self.discount = ""
        self.note = ""
        self.price = 0.0
        self.status = ""
        self.accepted = false
        self.deliveryLocation = nil
    }
}

struct NewOrder: Encodable, Decodable {
    var userid: String
    var chefid: String
    var discountid: String?
    var dishs: [String]
    var price: Float
    var note: String?
    var location: Location
    
    init(userid: String, chefid:String, discountid: String?, dishs:[String], price:Float, note:String?, location:Location) {
        self.userid = userid
        self.chefid = chefid
        self.discountid = discountid!
        self.dishs = dishs
        self.price = price
        self.note = note
        self.location = location
    }
}

struct NewOrderDisplay {
    var chef: Chef
    var dishs: [Dish]
    
    init(chef: Chef, dishs: [Dish]) {
        self.chef = chef
        self.dishs = dishs
    }
    init() {
        self.chef = Chef()
        self.dishs = [Dish]()
    }
}

struct EditOrderStatus: Encodable {
    var accepted: Bool
    var status: String
}



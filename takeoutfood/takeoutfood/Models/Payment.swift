//
//  Payment.swift
//  takeoutfood
//
//  Created by Fred Chen on 2018-01-19.
//  Copyright © 2018 fred. All rights reserved.
//

import Foundation

struct Card:Encodable{
  var name:String
  var number:String
  var expiry_month:String
  var expiry_year:String
  var cvd:String
}

struct Payment:Encodable {
  var amount:Float
  var payment_method:String
  var card:Card
}

struct Receipt:Decodable{
  var id:String
  var authorizing_merchant_id:Int
  var approved:String
  var message_id:String
  var auth_code:String
  var created:String
  var order_number:String
  var type:String
  var payment_method:String
  var risk_score:Int
  var amount:Float
}

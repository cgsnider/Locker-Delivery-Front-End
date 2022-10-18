//
//  Orders.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/13/22.
//

import SwiftUI

struct Order: Identifiable {
    var id: Int
    var item : String
    var status : String
    var date : String
    var address: String
    var city: String
    var state: String
    var zipcode: Int
    var locker: String
    var sender: String
    var sender_number: String
    var sender_email: String
}

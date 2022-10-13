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
    var name : String
    var date : String
}

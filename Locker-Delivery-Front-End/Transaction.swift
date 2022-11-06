//
//  Transactions.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/13/22.
//

import SwiftUI

struct Transaction: Identifiable {
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
    var receiver: String
    var receiver_number: String
    var receiver_email: String
}

// This function will be replaced during firebase connection
func getTransactions() -> [Transaction] {
    let transaction = [
        Transaction(id: 0, item: "Sony Fx3 Camera", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "jimjoe@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 1, item: "random 2", status: "Awaiting Dropoff", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 2, item: "radom 3", status: "Transaction Complete", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 3, item: "random 4", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 4, item: "random 5", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 5, item: "Sony Fx3 Camera", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "jimjoe@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 1, item: "random 2", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 6, item: "radom 3", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 7, item: "random 4", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 8, item: "random 5", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 9, item: "random 4", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com"),
        Transaction(id: 10, item: "random 5", status: "Awaiting Pickup", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com", receiver: "Jim Joe", receiver_number: "321-321-3211", receiver_email: "jimjoe@gmail.com")
    ]
    return transaction
}

// Going to add another status for confirming a transaction
func getStatusColor(status: String) -> Color {
    if (status == "Awaiting Dropoff") {
        return Color.yellow
    } else if (status == "Awaiting Pickup") {
        return Color.red
    } else if (status == "Transaction Complete") {
        return Color.green
    }
    return Color.red
}

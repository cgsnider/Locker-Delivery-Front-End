//
//  PickUpHome.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/12/22.
//

import SwiftUI

// This function will be replaced during firebase connection
func getOrders() -> [Order] {
    let orders = [
        Order(id: 0, item: "Sony Fx3 Camera", status: "Order Request", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com"),
        Order(id: 1, item: "random 2", status: "Order Request", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com"),
        Order(id: 2, item: "radom 3", status: "Order Request", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com"),
        Order(id: 3, item: "random 4", status: "Order Request", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com"),
        Order(id: 4, item: "random 5", status: "Order Request", date: "10/12/22", address: "86 5th St NW", city: "Atlanta",
              state: "Georgia", zipcode: 30308, locker: "82W3X9", sender: "John Doe", sender_number: "100-200-3000", sender_email: "johnsmith@gmail.com")
    ]
    return orders
}


struct PickUpHomeView: View {
    @Binding var next: Int
    @Binding var currOrder: Order
    var body: some View {
        ScrollView {
            VStack {
                ForEach(getOrders()) {
                    order in ListOrders(next: $next, currOrder: $currOrder, order: order)
                }
                ExDivider()
                Spacer()
            }
        }
    }
}

struct ListOrders: View {
    @Binding var next: Int
    @Binding var currOrder: Order
    var order: Order
    var body: some View {
    ExDivider()
        VStack(spacing: 15) {
            Button (action: {
                next = Constants.Views.pickup
                currOrder = order
            }) {
                VStack {
                    HStack(spacing: 20) {
                        Text(order.item).font(Font.MenuBold)
                            .frame(width: 150, alignment: .leading)
                        Text(order.status).font(Font.MenuBold)
                            .frame(width: 150, alignment: .trailing)
                            .foregroundColor(Color.yellow)
                    }
                    HStack(spacing: 20) {
                        Text(order.sender).font(Font.MenuBold)
                            .frame(width: 150, alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                        Text(order.date).font(Font.MenuBold)
                            .frame(width: 150, alignment: .trailing)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }.navigationBarBackButtonHidden(false)
    }
}

struct Previews_PickUpHomeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

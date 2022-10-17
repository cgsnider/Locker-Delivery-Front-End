//
//  PickUpHome.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/12/22.
//

import SwiftUI

// This function will be replaced during backend connection
func getOrders() -> [Order] {
    let orders = [
        Order(id: 0, item: "Sony Fx3 Camera", status: "Order Request", name: "John Doe", date: "10/12/22"),
        Order(id: 1, item: "random 2", status: "Order Request", name: "John Doe", date: "10/12/22"),
        Order(id: 2, item: "radom 3", status: "Order Request", name: "John Doe", date: "10/12/22"),
        Order(id: 3, item: "random 4", status: "Order Request", name: "John Doe", date: "10/12/22"),
        Order(id: 4, item: "random 5", status: "Order Request", name: "John Doe", date: "10/12/22")
    ]
    return orders
}


struct PickUpHomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(getOrders()) {
                    order in ListOrders(order: order)
                }
                ExDivider()
                Spacer()
            }
        }
    }
}

struct ListOrders: View {
    var order: Order
    var body: some View {
    ExDivider()
        VStack(spacing: 15) {
            VStack {
                HStack(spacing: 20) {
                    Text(order.item).font(Font.MenuBold)
                        .frame(width: 150, alignment: .leading)
                    Text(order.status).font(Font.MenuBold)
                        .frame(width: 150, alignment: .trailing)
                        .foregroundColor(Color.yellow)
                }
                HStack(spacing: 20) {
                    Text(order.name).font(Font.MenuBold)
                        .frame(width: 150, alignment: .leading)
                        .foregroundColor(Color.gray)
                        
                    Text(order.date).font(Font.MenuBold)
                        .frame(width: 150, alignment: .trailing)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}


struct ExDivider: View {
    let color: Color = .black
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct Previews_PickUpHomeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

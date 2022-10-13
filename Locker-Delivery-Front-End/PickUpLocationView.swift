//
//  PickUpLocationView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/13/22.
//

import SwiftUI


struct PickUpLocationView: View {
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
        NavigationLink(destination: LoginView()) {
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
}

//
//  PickUpLocationView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/13/22.
//

import SwiftUI


struct PickUpLocationView: View {
    @Binding var next: Int
    @Binding var order: Order
    var body: some View {
        VStack (spacing: 25) {
            Spacer()
            Text(order.item).font(Font.CreateTitle)
                .frame(width: 300, alignment: .center)
            ExDivider()
            VStack {
                Text("Status:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(order.status).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.yellow)
            }
            VStack {
                Text("Pick Up Location:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(order.address).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(order.city + ", " + order.state).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(String(order.zipcode)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Sender:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(order.sender).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Contact Info:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(order.sender_number).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(order.sender_email).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Locker Code:").font(Font.CreateTitle)
                    .frame(width: 300, alignment: .center)
                Text(order.locker).font(Font.CreateTitle)
                    .frame(width: 300, alignment: .center)
            }
            Spacer()
            Button (action: {
                next = Constants.Views.main
            }) {
                Image("Back")
            }
        }
    }
}

//struct ListOrders: View {
//    var order: Order
//    var body: some View {
//        ExDivider()
//        NavigationLink(destination: LoginView()) {
//            VStack(spacing: 15) {
//                VStack {
//                    HStack(spacing: 20) {
//                        Text(order.item).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .leading)
//                        Text(order.status).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .trailing)
//                            .foregroundColor(Color.yellow)
//                    }
//                    HStack(spacing: 20) {
//                        Text(order.name).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .leading)
//                            .foregroundColor(Color.gray)
//
//                        Text(order.date).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .trailing)
//                            .foregroundColor(Color.gray)
//                    }
//                }
//            }
//        }
//    }
//}

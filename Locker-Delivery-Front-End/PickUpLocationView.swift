//
//  PickUpLocationView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/13/22.
//

import SwiftUI


struct PickUpLocationView: View {
    @Binding var next: Int
    @Binding var transaction: Transaction
    var body: some View {
        VStack (spacing: 25) {
            Spacer()
            Text(transaction.item).font(Font.CreateTitle)
                .frame(width: 300, alignment: .center)
            ExDivider()
            VStack {
                Text("Status:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.status).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(getStatusColor(status: transaction.status))
            }
            VStack {
                Text("Pick Up Location:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.address).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(transaction.city + ", " + transaction.state).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(String(transaction.zipcode)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Sender:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.sender).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Contact Info:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.sender_number).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(transaction.sender_email).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Locker Code:").font(Font.CreateTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.locker).font(Font.CreateTitle)
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

//struct ListTransactions: View {
//    var transaction: Transaction
//    var body: some View {
//        ExDivider()
//        NavigationLink(destination: LoginView()) {
//            VStack(spacing: 15) {
//                VStack {
//                    HStack(spacing: 20) {
//                        Text(transaction.item).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .leading)
//                        Text(transaction.status).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .trailing)
//                            .foregroundColor(Color.yellow)
//                    }
//                    HStack(spacing: 20) {
//                        Text(transaction.name).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .leading)
//                            .foregroundColor(Color.gray)
//
//                        Text(transaction.date).font(Font.MenuBold)
//                            .frame(width: 150, alignment: .trailing)
//                            .foregroundColor(Color.gray)
//                    }
//                }
//            }
//        }
//    }
//}

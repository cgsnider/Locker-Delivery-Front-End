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
    @State var errorMessage = ""
    @State var confirmFailed = false
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
                Text("Locker:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.locker).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center).foregroundColor(Color.gray)
            }
            VStack {
                Text("Pick Up Location:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(getLockerAddress(locker: transaction.locker)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(getLockerCity(locker: transaction.locker) + ", " + getLockerState(locker: transaction.locker)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(getLockerZip(locker: transaction.locker)).font(Font.SubTitle)
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
            Spacer()
            Group {
                if (transaction.status == "Awaiting Pickup") {
                    Button (action: {
                        Task {
                            let fail = await completeTransaction(transaction: transaction)
                            if fail == nil {
                                next = Constants.Views.pickup
                            } else {
                                if let fail = fail {
                                    confirmFailed = true;
                                    errorMessage = fail;
                                }
                            }
                        }
                        next = Constants.Views.pickuphome
                    }) {
                        Image("Confirm Pickup").alert("Confirmation Failed", isPresented: $confirmFailed, actions: {
                            Button("OK", role: .cancel) { }
                        }, message: {
                            Text(errorMessage)
                        })
                    }
                }
                Button (action: {
                    next = Constants.Views.pickuphome
                }) {
                    Image("Back")
                }
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

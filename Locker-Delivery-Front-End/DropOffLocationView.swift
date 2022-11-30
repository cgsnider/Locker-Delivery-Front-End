//
//  DropOffLocationView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/27/22.
//

import SwiftUI


struct DropOffLocationView: View {
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
                Text(transaction.locker_location).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center).foregroundColor(Color.gray)
            }
            VStack {
                Text("Pick Up Location:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(getLockerAddress(locker: transaction.locker_location)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(getLockerCity(locker: transaction.locker_location) + ", " + getLockerState(locker: transaction.locker_location)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(getLockerZip(locker: transaction.locker_location)).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Receiver:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.receiver).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("Contact Info:").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                Text(transaction.receiver_number).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                Text(transaction.sender_email).font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Group {
                if (transaction.status == "Awaiting Dropoff") {
                    Button (action: {
                        Task {
                            let fail = await completeDropOffTransaction(transaction: transaction)
                            if fail == nil {
                                let email = Email(toAddress: transaction.sender_email, subject: "Pickup Approved",
                                                  body: "Hello! I just dropped off your \(transaction.item) at the locker.")
                                
                                email.sendEmail()
                                next = Constants.Views.dropoffhome
                            } else {
                                if let fail = fail {
                                    confirmFailed = true;
                                    errorMessage = fail;
                                }
                            }
                        }
                        next = Constants.Views.dropoffhome
                    }) {
                        Image("Confirm Dropoff").alert("Confirmation Failed", isPresented: $confirmFailed, actions: {
                            Button("OK", role: .cancel) { }
                        }, message: {
                            Text(errorMessage)
                        })
                    }
                }
                Button (action: {
                    next = Constants.Views.dropoffhome
                }) {
                    Image("Back")
                }
            }
        }
    }
}

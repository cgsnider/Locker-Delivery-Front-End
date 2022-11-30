//
//  ConfirmView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/9/22.
//

import SwiftUI

struct ConfirmView: View {
    @Binding var next: Int
    @Binding var transaction: Transaction
    @State var errorMessage = ""
    @State var confirmFailed = false
    @State var text = ""
    var body: some View {
        VStack (spacing: 80) {
            Spacer()
            if (transaction.status == "Awaiting Confirmation") {
                Text(transaction.sender + " would like to start a transaction with you").font(Font.SubTitle2)
                    .frame(width: 300, alignment: .center)
            } else {
                Text("Would you like to complete the transaction with " + transaction.sender).font(Font.SubTitle2)
                    .frame(width: 300, alignment: .center)
            }
            VStack (spacing: 25) {
                Text("Item Name:").font(Font.SubTitle2)
                    .frame(width: 300, alignment: .center)
                Text(transaction.item).font(Font.SubTitle2)
                    .frame(width: 300, alignment: .center)
            }
            HStack {
                Button (action: {
                    if (transaction.status == "Awaiting Confirmation") {
                        Task {
                            let fail = await confirmTransaction(transaction: transaction)
                            if fail == nil {
                                
                                let email = Email(toAddress: transaction.sender_email, subject: "Pickup Approved",
                                                  body: "Hello! I'll pick up \(transaction.item) from the locker.")
                                
                                email.sendEmail()
                                
                                next = Constants.Views.pickuphome
                            } else {
                                if let fail = fail {
                                    confirmFailed = true;
                                    errorMessage = fail;
                                }
                            }
                        }
                        next = Constants.Views.pickuphome
                    } else {
                        Task {
                            let fail = await completeTransaction(transaction: transaction)
                            if fail == nil {
                                
                                let email = Email(toAddress: transaction.sender_email, subject: "Pickup Approved",
                                                  body: "Hello! I just picked up the \(transaction.item) from the locker at \(transaction.locker_location)")
                                
                                email.sendEmail()
                                
                                next = Constants.Views.pickuphome
                            } else {
                                if let fail = fail {
                                    confirmFailed = true;
                                    errorMessage = fail;
                                }
                            }
                        }
                        next = Constants.Views.pickuphome
                    }
                }) {
                    Image("ConfirmButton").alert("Confirmation Failed", isPresented: $confirmFailed, actions: {
                        Button("OK", role: .cancel) { }
                    }, message: {
                        Text(errorMessage)
                    })
                }
                Button (action: {
                    if (transaction.status == "Awaiting Confirmation") {
                        Task {
                            let fail = await declineTransaction(transaction: transaction)
                            if fail == nil {
                                
                                let email = Email(toAddress: transaction.sender_email, subject: "Pickup Declined: \(transaction.item)",
                                                  body: "Hi, I would not like to pick up that item.")
                                
                                email.sendEmail()
                                
                                next = Constants.Views.pickuphome
                            } else {
                                if let fail = fail {
                                    confirmFailed = true;
                                    errorMessage = fail;
                                }
                            }
                        }
                    } else {
                        let email = Email(toAddress: "cs4261tmcp@gmail.com", subject: "Pickup Support: \(transaction.item)",
                                          body: "I need support for my pickup")
                        
                        email.sendEmail()
                        
                        next = Constants.Views.pickuphome
                    }
                }) {
                    Image("DeclineButton").alert("Confirmation Failed", isPresented: $confirmFailed, actions: {
                        Button("OK", role: .cancel) { }
                    }, message: {
                        Text(errorMessage)
                    })
                }
            }
            Spacer()
            Button (action: {
                next = Constants.Views.pickuphome
            }) {
                Image("Back")
            }
        }
    }
}

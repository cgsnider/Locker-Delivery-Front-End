//
//  PaymentView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/30/22.
//

import SwiftUI

struct PaymentView: View {
    
    @Binding var next: Int
    @Binding var uid: String
    @Binding var currTransaction: Transaction

    @State var name = ""
    @State var address = ""
    @State var errorMessage = ""
    @State var createFailed = false
    @State var reserved = ""
    
    var body: some View {
        VStack(spacing: 80) {
            VStack(spacing: 30) {
                Text("Reserve for 3 Days: $9.99").font(Font.SubTitle)
                    .frame(width: 300, alignment: .leading)
                Button (action: {
                    reserved = "3 days"
                    Task {
                        let fail = await postTransaction(sender_id: uid, transaction: currTransaction, reserved: reserved)
                        if fail == nil {
                            next = Constants.Views.dropoffhome
                            
                            let email = Email(toAddress: currTransaction.receiver_email, subject: "New DeLocker Transaction: \(currTransaction.item)",
                                              body: "Hi! I have started an exchange for \(currTransaction.item) at the \(currTransaction.locker_location) locker. Please Confirm the item so I can drop it off.")
                            
                            email.sendEmail()
                            
                        } else {
                            if let fail = fail {
                                createFailed = true;
                                errorMessage = fail;
                            }
                        }
                    }
                }) {
                    Image("Purchase").alert("Transaction Creation Failed", isPresented: $createFailed, actions: {
                        Button("OK", role: .cancel) {}
                }, message: {
                    Text(errorMessage)
                })
                }
            }
            
            VStack(spacing: 30) {
                Text("Reserve for 7 Days: $14.99").font(Font.SubTitle)
                    .frame(width: 300, alignment: .leading)
                Button (action: {
                    reserved = "7 days"
                    Task {
                        let fail = await postTransaction(sender_id: uid, transaction: currTransaction, reserved: reserved)
                        if fail == nil {
                            next = Constants.Views.dropoffhome
                            
                            let email = Email(toAddress: currTransaction.receiver_email, subject: "New DeLocker Transaction: \(currTransaction.item)",
                                              body: "Hi! I have started an exchange for \(currTransaction.item) at the \(currTransaction.locker_location) locker. Please Confirm the item so I can drop it off.")
                            
                            email.sendEmail()
                            
                        } else {
                            if let fail = fail {
                                createFailed = true;
                                errorMessage = fail;
                            }
                        }
                    }
                }) {
                    Image("Purchase").alert("Transaction Creation Failed", isPresented: $createFailed, actions: {
                        Button("OK", role: .cancel) {}
                }, message: {
                    Text(errorMessage)
                })
                }
            }
            
            VStack(spacing: 30) {
                Text("Reserve for 14 Days: $24.99").font(Font.SubTitle)
                    .frame(width: 300, alignment: .leading)
                Button (action: {
                    reserved = "14 days"
                    Task {
                        let fail = await postTransaction(sender_id: uid, transaction: currTransaction, reserved: reserved)
                        if fail == nil {
                            next = Constants.Views.dropoffhome
                            
                            let email = Email(toAddress: currTransaction.receiver_email, subject: "New DeLocker Transaction: \(currTransaction.item)",
                                              body: "Hello! I have started an exchange for \(currTransaction.item) at the \(currTransaction.locker_location) locker. Please Confirm the item so I can drop it off.")
                            
                            email.sendEmail()
                            
                        } else {
                            if let fail = fail {
                                createFailed = true;
                                errorMessage = fail;
                            }
                        }
                    }
                }) {
                    Image("Purchase").alert("Transaction Creation Failed", isPresented: $createFailed, actions: {
                        Button("OK", role: .cancel) {}
                }, message: {
                    Text(errorMessage)
                })
                }
            }
            Button (action: {
                next = Constants.Views.createTransaction
            }) {
                Image("Back")
            }
        }
    }
}

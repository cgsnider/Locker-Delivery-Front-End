//
//  CreateOrderView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/5/22.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @Binding var next: Int
    @Binding var uid: String
    @Binding var currTransaction: Transaction
    
    @State private var item: String = ""
    @State private var receiver_email: String = ""
    @State private var locker: String = "Options"
    @State private var selection = 0
    @State var errorMessage = ""
    @State var createFailed = false
    
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            VStack {
                Text("New Transaction").font(Font.CreateTitle)
                    .frame(width: 300, alignment: .center)
                Text("Create a new Transaction").font(Font.SubTitle)
                    .frame(width: 300, alignment: .center)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            }
            
            VStack {
                Text("Item Name").font(Font.SubTitle2)
                    .frame(width: 300, alignment: .leading)
                ZStack {
                    Image("Textbox")
                    TextField("Item Name", text: $item).font(Font.TextField).frame(width: 300, alignment: .center)
                        .foregroundColor(.black)
                }
            }
            
            VStack {
                Text("Receiver Email").font(Font.SubTitle2)
                    .frame(width: 300, alignment: .leading)
                ZStack {
                    Image("Textbox")
                    TextField("Receiver Email", text: $receiver_email).font(Font.TextField).frame(width: 300, alignment: .center)
                        .foregroundColor(.black)
                }
            }
            
            VStack {
                Text("Select a Locker").font(Font.SubTitle2)
                    .frame(width: 300, alignment: .leading)
                Menu {
                    Button (action: {
                        locker = "Georgia Tech"
                    }) {
                        Text("Georgia Tech").font(Font.SubTitle2)
                            .frame(width: 300, alignment: .leading)
                    }
                    Button (action: {
                        locker = "Downtown ATL"
                    }) {
                        Text("Downtown ATL").font(Font.SubTitle2)
                            .frame(width: 300, alignment: .leading)
                    }
                    Button (action: {
                        locker = "Midtown ATL"
                    }) {
                        Text("Midtown ATL").font(Font.SubTitle2)
                            .frame(width: 300, alignment: .leading)
                    }
                } label: {
                    Image(systemName: "plus")
                    Text(locker).font(Font.SubTitle)
                        .frame(width: 300, alignment: .leading).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                }
            }
            
            VStack(spacing:40) {
                // Update this when Adding transaction to database
                Button (action: {
                    currTransaction.receiver_email = receiver_email
                    currTransaction.item = item
                    currTransaction.locker_location = locker
                    next = Constants.Views.payment
                }) {
                    Image("CreateTransaction")
                }
                
                Button (action: {
                    next = Constants.Views.dropoffhome
                }) {
                    Image("Back")
                }
            }
            Spacer()
        }
    }
    
}

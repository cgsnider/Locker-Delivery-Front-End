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
    
    @State private var item: String = ""
    @State private var receiver_email: String = ""
    
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
            
            VStack(spacing:40) {
                // Update this when Adding transaction to database
                Button (action: {
                    next = Constants.Views.main
                }) {
                    Image("CreateTransaction")
                }
                
                Button (action: {
                    next = Constants.Views.main
                }) {
                    Image("Back")
                }
            }
            Spacer()
        }
    }
    
}

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
    var body: some View {
        VStack (spacing: 80) {
            Spacer()
            Text(transaction.sender + " would like to start a transaction with you").font(Font.SubTitle2)
                .frame(width: 300, alignment: .center)
            VStack (spacing: 25) {
                Text("Item Name:").font(Font.SubTitle2)
                    .frame(width: 300, alignment: .center)
                Text(transaction.item).font(Font.SubTitle2)
                    .frame(width: 300, alignment: .center)
            }
            HStack {
                Button (action: {
                    next = Constants.Views.main
                }) {
                    Image("ConfirmButton")
                }
                Button (action: {
                    next = Constants.Views.main
                }) {
                    Image("DeclineButton")
                }
            }
            Spacer()
            
        }
    }
}

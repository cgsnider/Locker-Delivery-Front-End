//
//  DropOffsHomeView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/12/22.
//

import SwiftUI


struct DropOffsHomeView: View {
    @Binding var next: Int
    @Binding var currTransaction: Transaction
    var body: some View {
        VStack(spacing: 50) {
            Text("Drop Offs").font(Font.Title)
                .frame(width: 300, alignment: .center)
            ScrollView {
                VStack {
                    ForEach(getTransactions()) {
                        transaction in DropOffsListTransactions(next: $next, currTransaction: $currTransaction, transaction: transaction)
                    }
                    ExDivider()
                    Spacer()
                }
            }
            VStack {
                Text("New Transaction").font(Font.CreateTitle)
                    .frame(width: 280, alignment: .leading)
                Button (action: {
                    next = Constants.Views.createTransaction
                }) {
                    Image("NewTransaction")
                }
            }
            Spacer()
        }
    }
}

struct DropOffsListTransactions: View {
    @Binding var next: Int
    @Binding var currTransaction: Transaction
    var transaction: Transaction
    var body: some View {
    ExDivider()
        VStack(spacing: 15) {
            Button (action: {
                next = Constants.Views.pickup
                currTransaction = transaction
            }) {
                VStack {
                    HStack(spacing: 20) {
                        Text(transaction.item).font(Font.MenuBold)
                            .frame(width: 150, alignment: .leading)
                        Text(transaction.status).font(Font.MenuBold)
                            .frame(width: 150, alignment: .trailing)
                            .foregroundColor(getStatusColor(status: transaction.status))
                    }
                    HStack(spacing: 20) {
                        Text(transaction.receiver).font(Font.MenuBold)
                            .frame(width: 150, alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                        Text(transaction.date).font(Font.MenuBold)
                            .frame(width: 150, alignment: .trailing)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }.navigationBarBackButtonHidden(false)
    }
}

//
//  PickUpHome.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/12/22.
//

import SwiftUI


struct PickUpHomeView: View {
    @Binding var next: Int
    @Binding var currTransaction: Transaction
    let uid: String
    
    @ObservedObject var model = TransactionModel()
    
    init(next: Binding<Int>, currTransaction: Binding<Transaction>, uid: String, model: TransactionModel = TransactionModel()) {
        self.uid = uid
        self._next = next
        self._currTransaction = currTransaction
        self.model = model
        model.getData(isReceiver: true, uid: uid)
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Pick Ups").font(Font.Title)
                .frame(width: 300, alignment: .center)
            ScrollView {
                VStack {
                    ForEach (model.list) { tran in
                        PickUpListTransactions(next: $next, currTransaction: $currTransaction, transaction: tran)
                    }
                    ExDivider()
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct PickUpListTransactions: View {
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
                            .frame(width: 170, alignment: .trailing)
                            .foregroundColor(getStatusColor(status: transaction.status))
                    }
                    HStack(spacing: 20) {
                        Text(transaction.sender).font(Font.MenuBold)
                            .frame(width: 150, alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                        Text(transaction.date).font(Font.MenuBold)
                            .frame(width: 170, alignment: .trailing)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }.navigationBarBackButtonHidden(false)
    }
}

struct Previews_PickUpHomeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    
   
    @Binding var uid: String
    @State var curr = Constants.Views.login
    @State var currTransaction = blankTransaction()
    
    
    var body: some View {
        
        if (curr == Constants.Views.login) {
            LoginView(next: $curr, uid: $uid)
        } else if curr == Constants.Views.signup {
            SignUpView(next: $curr)
        } else if curr == Constants.Views.main {
            MainView(next: $curr, uid: $uid)
        } else if curr == Constants.Views.pickup {
            PickUpLocationView(next: $curr, transaction: $currTransaction)
        } else if curr == Constants.Views.pickuphome {
            PickUpHomeView(next: $curr, currTransaction: $currTransaction, uid:uid)
        } else if curr == Constants.Views.dropoffhome {
            DropOffsHomeView(next: $curr, currTransaction: $currTransaction, uid:uid)
        } else if curr == Constants.Views.print {
            PrintView(data:uid)
        } else if curr == Constants.Views.createTransaction {
            CreateTransactionView(next: $curr, uid: $uid, currTransaction: $currTransaction)
        } else if curr == Constants.Views.confirm {
            ConfirmView(next: $curr, transaction: $currTransaction)
        } else if curr == Constants.Views.dropoff {
            DropOffLocationView(next: $curr, transaction: $currTransaction)
        } else if curr == Constants.Views.settings {
            SettingsView(next: $curr, uid: $uid)
        } else if curr == Constants.Views.payment {
            PaymentView(next: $curr, uid: $uid, currTransaction: $currTransaction)
        }
            
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uid: .constant("NejvBVP9T0RNMI0ME6uQjAd5fQ12"))
    }
}

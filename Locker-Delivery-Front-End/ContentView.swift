//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    
   
    @State var uid = ""
    @State var curr = Constants.Views.login
    
    
    var body: some View {
        
        if (curr == Constants.Views.login) {
            LoginView(next: $curr, uid: $uid)
        } else if curr == Constants.Views.signup {
            SignUpView(next: $curr)
        } else if curr == Constants.Views.main {
            MainView(next: $curr, uid: uid)
        } else if curr == Constants.Views.print {
            PrintView(data:uid)
        }
            
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

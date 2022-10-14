//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var view = SignUpView();
    
    
    
    var body: some View {
        VStack {
            view
        }

    }
    
//    func to(nextView: any View) {
//        view = nextView
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

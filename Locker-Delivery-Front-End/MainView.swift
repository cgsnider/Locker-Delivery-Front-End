//
//  MainView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/12/22.
//

import SwiftUI

struct MainView: View {
    
    @Binding var next: Int
    @Binding var uid: String
    @Binding var currOrder: Order
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            PickUpHomeView(next: $next, currOrder: $currOrder)
                .tabItem {
                    selection == 0 ? Image("Pick-ups-black") : Image("Pick-ups-white")
                }.tag(0)
            DropOffsHomeView()
                .tabItem {
                    selection == 1 ? Image("Drop-offs-black") : Image("Drop-offs-white")
                }.tag(1)
        }.frame(alignment: .bottom)
    }

}


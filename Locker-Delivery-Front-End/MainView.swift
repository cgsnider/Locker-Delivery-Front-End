//
//  MainView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/12/22.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    @Binding var next: Int
    @Binding var uid: String
    
    @State private var selection = 1
    @State var name = ""
    
    var body: some View {
        VStack(spacing: 80) {
            Text("Welcome Home, " + name).font(Font.CreateTitle)
                .frame(width: 300, alignment: .center)
            Button(action: {
                next = Constants.Views.pickuphome
            }) {
                Image("Pick-ups-black")
            }
            Button(action: {
                next = Constants.Views.dropoffhome
            }) {
                Image("Dropoffs-black")
            }
            Button(action: {
                next = Constants.Views.settings
            }) {
                Image("Settings")
            }
            Button(action: {
                uid = ""
                next = Constants.Views.login
            }) {
                Image("Log Out")
            }
        }.onAppear {
            getName(uid: uid) {
                (resultName) in
                    name = resultName!
            }
        }
        //TabView(selection: $selection) {
            //PickUpHomeView(next: $next, currTransaction: $currTransaction, uid:uid)
                //.tabItem {
                   // selection == 0 ? Image("Pick-ups-black") : Image("Pick-ups-white")
               // }.tag(0)
            //DropOffsHomeView(next: $next, currTransaction: $currTransaction, uid:uid)
                //.tabItem {
                    //selection == 1 ? Image("Drop-offs-black") : Image("Drop-offs-white")
                //}.tag(1)
        //}.frame(alignment: .bottom)
    }

}


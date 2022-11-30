//
//  Settings.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/29/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var next: Int
    @Binding var uid: String

    @State var name = ""
    @State var address = ""
    @State var errorMessage = ""
    @State var confirmFailed = false
    
    var body: some View {
        VStack(spacing: 80) {
            Text("Settings" ).font(Font.Title)
                .frame(width: 300, alignment: .center)
            ZStack {
                Image("Textbox")
                TextField("", text: $name).font(Font.TextField).frame(width: 300, alignment: .center)
                    .foregroundColor(.black)
            }.onAppear {
                getName(uid: uid) {
                    (resultName) in
                        name = resultName!
                }
            }
            
            ZStack {
                Image("Textbox")
                TextField("", text: $address).font(Font.TextField).frame(width: 300, alignment: .center)
                    .foregroundColor(.black)
            }.onAppear {
                getAddress(uid: uid) {
                    (resultAddress) in
                        address = resultAddress!
                }
            }
            
            Button(action: {

            }) {
                Image("Change Password")
            }
            Button(action: {
                let email = Email(toAddress: "cs4261tmcp@gmail.com" , subject: "Support Ticket:", body: "")
                
                email.sendEmail()
            }) {
                Image("Contact Support")
            }
            
            Button(action: {
                Task {
                    print(name)
                    let fail = await SaveUser(uid: uid, name: name, address: address)
                    if fail == nil {
                        next = Constants.Views.main
                    } else {
                        if let fail = fail {
                            confirmFailed = true;
                            errorMessage = fail;
                        }
                    }
                }
                next = Constants.Views.main
            }) {
                Image("Save")
            }
        }
    }
}

//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/6/22.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State var signInSuccess = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Login").font(Font.Title)
                    .frame(width: 300, alignment: .leading)
                Text("Please sign in to continue").font(Font.SubTitle)
                    .frame(width: 300, alignment: .leading)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                ZStack {
                    Image("Textbox")
                    TextField("Username", text: $username).font(Font.TextField).frame(width: 300, alignment: .center)
                        .foregroundColor(.black)
                }
                
                ZStack {
                    Image("Textbox")
                    TextField("Password", text: $password).font(Font.TextField).frame(width: 300, alignment: .center)
                        .foregroundColor(.black)
                }
                Button(action: {
                    print("button pressed")
                }) {
                    Text("Forgot Password?").font(Font.ForgetPasswordText)
                        .frame(width: 300, alignment: .center)
                }
                
                NavigationLink(destination: MainView()) {
                    Image("SignIn")
                }
                Spacer()
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an Account? Sign up").font(Font.SubTitle)
                        .frame(width: 350, alignment: .center)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

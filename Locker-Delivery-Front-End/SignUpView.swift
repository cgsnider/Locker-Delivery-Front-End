//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/6/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Create Account").font(Font.CreateTitle)
                .frame(width: 300, alignment: .leading)
            Text("Create a new account").font(Font.SubTitle)
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
            
            NavigationLink(destination: LoginView()) {
                Image("SignUp")
            }
            Spacer()
            NavigationLink(destination: LoginView()) {
                Text("Already have an Account? Sign in").font(Font.SubTitle)
                    .frame(width: 350, alignment: .center)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

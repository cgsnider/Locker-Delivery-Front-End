//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/6/22.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @Binding var next: Int
    @Binding var uid: String
    
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
                    TextField("Email", text: $username).font(Font.TextField).frame(width: 300, alignment: .center)
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
                
                Button (action: {
                    Login()
                }) { Image("SignIn") }
                Spacer()
                Button (action: {
                    next = Constants.Views.signup
                }) {
                    Text("Don't have an Account? Sign up").font(Font.SubTitle)
                        .frame(width: 350, alignment: .center)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func validateLoginFields() -> String? {
        
        if (password == "") {
            return "Please Enter a Password"
        } else if (username == "") {
            return "Please enter an Email"
        }
        
        return nil
    }
    
    func Login() {
        
        //Validate Text Fields
        
        let error = validateLoginFields()
        
        if error != nil {
            // TODO: Add Error Message
            return
        }
        
        // Signing in User
        
        let email = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let psswd = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: psswd) { (result, error) in
            
            if error != nil {
                // TODO: Add Log in failure message
            } else {
                uid = result!.user.uid
                next = Constants.Views.main
            }
            
        }
        
    }
    
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

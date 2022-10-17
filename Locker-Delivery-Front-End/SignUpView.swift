//
//  ContentView.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/6/22.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SignUpView: View {
    
    @Binding var next: Int
    
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
                signUp()
            }) {
                Image("SignUp")
            }
            Spacer()
            
            Button (action: {
                next = Constants.Views.login
            }) {
                Text("Already have an Account? Sign in").font(Font.SubTitle)
                    .frame(width: 350, alignment: .center)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    // Checks if fields are correct, if everything is correct, return nil,
    // otherwise returns an error message
    func validateSignUpFields() -> String? {
        // Check if fields are filled in
        let email_pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        if username == "" {
            return "Please Enter a Email";
        }
        
        if password == "" {
            return "Please Enter a Password";
        }
        
        if !NSPredicate(format:"SELF MATCHES %@", email_pattern).evaluate(with: username) {
            return "Please enter valid email"
        }
        

        
//        if !NSPredicate(format:"SELF MATCHES %@", email_pattern).evaluate(with: username) {
//            return "Please enter valid email"
//        }
        // Add a check for valid password?
                
        return nil
    }

    func signUp() {
        
        // Validate the fields
        let error = validateSignUpFields()
        
        let email = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let psswd = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if error != nil {
            //Show error message because improper input to fields
            print("Error Input")

        } else {
            // Create the user
            Auth.auth().createUser(withEmail: email, password: psswd) { (result, error) in
                
                if error != nil {
                    // Show error message
                    print("Error Creating")
                }else {
                    // User successfully created, now store relevant data in db
                    let db = Firestore.firestore()
                    db.collection("users").document(result!.user.uid).setData([
                        "email": email,
                        "uid": result!.user.uid
                    ]) { (error) in
                        
                        if error != nil {
                            // Error if data could not be logged
                            print("Error Logging")
                        }
                        
                    }
                    
                }
                // Transition to the home screen
                next = Constants.Views.login
                print("SUCCESS")
                
            }
            
        }
        
    }
}

































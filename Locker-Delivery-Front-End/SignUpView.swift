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
    
    // Checks if fields are correct, if everything is correct, return nil,
    // otherwise returns an error message
    func validateFields() -> String? {
        // Check if fields are filled in
        let email_pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        if username == "" {
            return "Please Enter a Email";
        }
        
        if !NSPredicate(format:"SELF MATCHES %@", email_pattern).evaluate(with: username) {
            return "Please enter valid email"
        }
        
        if password == "" {
            return "Please Enter a Password";
        }
        // Add a check for valid password?
                
        return nil
    }

    func signUp(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        let email = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let psswd = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if error != nil {
            //Show error message because improper input to fields

        } else {
            // Create the user
            Auth.auth().createUser(withEmail: email, password: psswd) { (result, error) in
                
                if error != nil {
                    // Show error message
                }else {
                    // User successfully created, now store relevant data in db
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["email": email, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            // Error if data could not be logged
                            
                        }
                        
                    }
                    
                }
                // Transition to the home screen
                
                
            }
            
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
    func fakeTo(nextView: String) {
    }
}
































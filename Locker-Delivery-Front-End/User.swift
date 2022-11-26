//
//  User.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/24/22.
//

import Foundation
import Firebase

func getName(uid: String, completion: @escaping (String?) -> Void) {
    let db = Firestore.firestore()
    var name = ""
    
    db.collection("users").document(uid).getDocument() { document, error in
        if error != nil {
            print("error")
            return
        }
        if let document = document {
            print("here")
            name = document["name"] as? String ?? "Missing"
            completion(name)
            
        }
    }
}

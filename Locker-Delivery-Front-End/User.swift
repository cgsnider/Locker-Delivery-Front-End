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
            name = document["name"] as? String ?? ""
            completion(name)
            
        }
    }
}

func getAddress(uid: String, completion: @escaping (String?) -> Void) {
    let db = Firestore.firestore()
    var address = ""
    
    db.collection("users").document(uid).getDocument() { document, error in
        if error != nil {
            print("error")
            return
        }
        if let document = document {
            address = document["address"] as? String ?? ""
            completion(address)
            
        }
    }
}

func SaveUser(uid: String, name: String, address: String) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("users").document(uid).setData([
            "name": name,
            "address": address
        ], merge: true)        
        return nil
    } catch {
        return "An error has occured"
    }
}

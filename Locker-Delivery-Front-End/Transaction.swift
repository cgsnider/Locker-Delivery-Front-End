//
//  Transactions.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/13/22.
//

import SwiftUI
import Firebase

struct Transaction: Identifiable {
    var id: String
    var item : String
    var status : String
    var date : String
    var address: String
    var city: String
    var state: String
    var zipcode: String
    var locker: String
    var sender: String
    var sender_number: String
    var sender_email: String
    var receiver: String
    var receiver_number: String
    var receiver_email: String
}


func blankTransaction() -> Transaction{
    return Transaction(id: "", item: "", status: "", date: "", address: "", city: "", state: "", zipcode: "", locker: "", sender: "", sender_number: "", sender_email: "", receiver: "", receiver_number: "", receiver_email: "")
}


// This function will be replaced during firebase connection
class TransactionModel: ObservableObject {
    
    @Published var list = [Transaction]()
    
    func getData(isReceiver: Bool, uid: String) {
        
        let db = Firestore.firestore()
        
        db.collection("transaction").whereField(isReceiver ? "receiver_id" : "sender_id", isEqualTo: uid).getDocuments { snapshot, error in
            if error != nil {
                print("error")
                return
            }
            
            if let snapshot = snapshot {
                
                self.list = snapshot.documents.map { d in
                    return Transaction(id: d.documentID,
                        item: d["item"] as? String ?? "",
                        status: d["status"] as? String ?? "",
                        date: d["date"] as? String ?? "",
                        address: d["address"] as? String ?? "",
                        city: d["city"] as? String ?? "",
                        state: d["state"] as? String ?? "",
                        zipcode: d["zipcode"] as? String ?? "",
                        locker: d["locker"] as? String ?? "",
                        sender: d["sender_name"] as? String ?? "",
                        sender_number: d["sender_number"] as? String ?? "",
                        sender_email: d["sender_email"] as? String ?? "",
                        receiver: d["receiver_name"] as? String ?? "",
                        receiver_number: d["receiver_number"] as? String ?? "",
                        receiver_email: d["receiver_email"] as? String ?? "")
                }
                
            }
            
        }
                    
                
                
            
    }
        
    
    
}

// Going to add another status for confirming a transaction
func getStatusColor(status: String) -> Color {
    if (status == "Awaiting Dropoff") {
        return Color.yellow
    } else if (status == "Awaiting Pickup") {
        return Color.red
    } else if (status == "Transaction Complete") {
        return Color.green
    }
    return Color.red
}


//db.collection("transaction").getDocuments { snapshot, error in
//
//            if error != nil {
//                // Handle Error
//                print("Transactions Failed to fetch!")
//                return
//            }
//
//            if let snapshot = snapshot {
//
//                DispatchQueue.main.async {
//
//                    self.list = snapshot.documents.map({ d in
//
//                        let senderID = d["sender_id"] as? String ?? ""
//                        let receiverID = d["receiver_id"] as? String ?? ""
//
////                        db.collection("users").document(senderID).getDocument { sender, sender_err in
////
////                            db.collection("users").document(receiverID).getDocument { receiver, receiver_err in
//
////                        var sender: Dictionary = ["name":""]
////                        var receiver: Dictionary = ["name": ""]
////                        Task {
////                            let sender_data = try await db.collection("users").document(senderID).getDocument()
////                            sender["name"] = sender_data["name"] as? String ?? ""
////                            sender["number"] = sender_data["number"] as? String ?? ""
////                            sender["email"] = sender_data["email"] as? String ?? ""
////                            let receiver_data = try await db.collection("users").document(receiverID).getDocument()
////                            receiver["name"] = receiver_data["name"] as? String ?? ""
////                            receiver["number"] = receiver_data["number"] as? String ?? ""
////                            receiver["email"] = receiver_data["email"] as? String ?? ""
////
////                        }
//
//
//                        db.collection("users").document(senderID).getDocument { sender, sender_err in
//
//                            if let sender = sender {
//
//                                return Transaction(id: d.documentID,
//                                                   item: d["item"] as? String ?? "",
//                                                   status: d["status"] as? String ?? "",
//                                                   date: d["date"] as? String ?? "",
//                                                   address: d["address"] as? String ?? "",
//                                                   city: d["city"] as? String ?? "",
//                                                   state: d["state"] as? String ?? "",
//                                                   zipcode: d["zipcode"] as? String ?? "",
//                                                   locker: d["locker"] as? String ?? "",
//                                                   sender: sender["name"] as? String ?? "",
//                                                   sender_number: "Not Provided",
//                                                   sender_email: "Not Provided",
//                                                   receiver: "No Reciever",
//                                                   receiver_number: "Not Provided",
//                                                   receiver_email: "Not Provided")
//                            }
//
//                        }
//
//
//
//
//                        return Transaction(id: d.documentID,
//                                           item: d["item"] as? String ?? "",
//                                           status: d["status"] as? String ?? "",
//                                           date: d["date"] as? String ?? "",
//                                           address: d["address"] as? String ?? "",
//                                           city: d["city"] as? String ?? "",
//                                           state: d["state"] as? String ?? "",
//                                           zipcode: d["zipcode"] as? String ?? "",
//                                           locker: d["locker"] as? String ?? "",
//                                           sender: "No Sender",
//                                           sender_number: "Not Provided",
//                                           sender_email: "Not Provided",
//                                           receiver: "No Reciever",
//                                           receiver_number: "Not Provided",
//                                           receiver_email: "Not Provided")
//
////                            }
////                        }
//
//                    })

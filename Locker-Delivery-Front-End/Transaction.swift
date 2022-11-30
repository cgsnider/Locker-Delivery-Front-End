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
    var locker_location: String
    var locker_id: String
    var sender: String
    var sender_number: String
    var sender_email: String
    var receiver: String
    var receiver_number: String
    var receiver_email: String
    var reserved: String
}


func blankTransaction() -> Transaction{
    return Transaction(id: "", item: "", status: "", date: "", address: "", city: "", state: "", zipcode: "", locker_location: "", locker_id: "", sender: "", sender_number: "", sender_email: "", receiver: "", receiver_number: "", receiver_email: "", reserved: "")
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
                        locker_location: d["locker_location"] as? String ?? "",
                        locker_id: d["locker_id"] as? String ?? "",
                        sender: d["sender_name"] as? String ?? "",
                        sender_number: d["sender_number"] as? String ?? "",
                        sender_email: d["sender_email"] as? String ?? "",
                        receiver: d["receiver_name"] as? String ?? "",
                        receiver_number: d["receiver_number"] as? String ?? "",
                        receiver_email: d["receiver_email"] as? String ?? "",
                        reserved: d["receiver_number"] as? String ?? "")
                }
                
            }
            
        }
    }
}

func postTransaction(sender_id: String, transaction: Transaction, reserved: String) async -> String? {
    let db = Firestore.firestore()
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    if (transaction.item == "") {
        return "Please enter item name"
    }
    if (transaction.receiver_email == "") {
        return "Please enter a receiver email"
    }
    if (transaction.locker_location == "Options") {
        return "Please enter a locker location"
    }
    
    do {
        
        let sender = try await db.collection("users").document(sender_id).getDocument()
        
        let receiver_documents = try await db.collection("users").whereField("email", isEqualTo: transaction.receiver_email.lowercased()).getDocuments().documents
        
        if receiver_documents.count != 1 {
            return "Receiver Email does not exist"
        }
        
        let receiver = receiver_documents[0]
        
        let locker_id = await findAvailableLocker(locker_location: transaction.locker_location)
        
        if locker_id == nil {
            return "No Available lockers at this location. Please select a different locker"
        } else if locker_id == "-1" {
            return "An Error Occured"
        }
        

        try await db.collection("transaction").document().setData([
            "item" : transaction.item,
            "locker_location": transaction.locker_location,
            "locker_id": locker_id!,
            "receiver_email": receiver["email"] as? String ?? "Missing Email",
            "receiver_name": receiver["name"] as? String ?? "Missing Name",
            "receiver_id": receiver.documentID,
            "receiver_number": receiver["number"] as? String ?? "Missing Number",
            "sender_email": sender["email"] as? String ?? "Missing Email",
            "sender_name": sender["name"] as? String ?? "Missing Name",
            "sender_id": sender_id,
            "status": "Awaiting Confirmation",
            "reserved": reserved,
            "date": dateFormatter.string(from: date)
        ])
        
        let fail = await reserveLocker(locker_id: locker_id!, locker_location: transaction.locker_location)
        if fail == nil {
            return nil
        } else {
            return "An Error Occured"
        }
        
    } catch {
        return "Incorrect Email"
    }
}

func confirmTransaction(transaction: Transaction) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("transaction").document(transaction.id).setData([
            "status": "Awaiting Dropoff",
        ], merge: true)
        
        return nil
    } catch {
        return "An error has occured"
    }
}

func declineTransaction(transaction: Transaction) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("transaction").document(transaction.id).delete()
        
        let fail = await unreserveLocker(locker_id: transaction.locker_id, locker_location: transaction.locker_location)
        
        if fail == nil {
            return nil
        } else {
            return "An Error Occured"
        }
        
    } catch {
        return "An error has occured"
    }
}

func completeDropOffTransaction(transaction: Transaction) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("transaction").document(transaction.id).setData([
            "status": "Awaiting Pickup",
        ], merge: true)
        
        let fail = await lockReservedLocker(locker_id: transaction.locker_id, locker_location: transaction.locker_location)
        
        if fail == nil {
            return nil
        } else {
            return "An Error Occured"
        }
        
    } catch {
        return "An error has occured"
    }
}

func completePickUpTransaction(transaction: Transaction) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("transaction").document(transaction.id).setData([
            "status": "Awaiting Transaction Completion",
        ], merge: true)
        
        let fail = await unlockReservedLocker(locker_id: transaction.locker_id, locker_location: transaction.locker_location)
        
        if fail == nil {
            return nil
        } else {
            return "An Error Occured"
        }
        
    } catch {
        return "An error has occured"
    }
}



func completeTransaction(transaction: Transaction) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("transaction").document(transaction.id).setData([
            "status": "Transaction Complete",
        ], merge: true)
        
        let fail = await unreserveLocker(locker_id: transaction.locker_id, locker_location: transaction.locker_location)
        
        if fail == nil {
            return nil
        } else {
            return "An Error Occured"
        }

    } catch {
        return "An error has occured"
    }
}


// Going to add another status for confirming a transaction
func getStatusColor(status: String) -> Color {
    if (status == "Awaiting Confirmation") {
        return Color.red
    } else if (status == "Awaiting Dropoff") {
        return Color.blue
    } else if (status == "Awaiting Pickup") {
        return Color.yellow
    } else if (status == "Awaiting Transaction Completion") {
        return Color.orange
    } else if (status == "Transaction Complete") {
        return Color.green
    }
    return Color.red
}

//


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

//
//  FetchExample.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 11/6/22.
// https://www.youtube.com/watch?v=xkxGoNfpLXs

import SwiftUI
import Firebase

struct FetchExampleUI: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        List (model.list) { item in
            Text(item.name + " | " + item.notes)
        }
    }
    
    init() {
        model.getData()
    }
}

struct FetchExampleUI_Previews: PreviewProvider {
    
    static var previews: some View {
        FetchExampleUI()
    }
}


class ViewModel: ObservableObject {
    @Published var list = [Example]()
    
    func getData() {
        // Get a reference ot the database
        let db = Firestore.firestore()
        
        
        //Read the documents at a specific path
        db.collection("example").getDocuments { snapshot, error in
            // Check if there are errors
            if error == nil {
                // No Errors
                
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        // Get all data and create Todos
                        self.list = snapshot.documents.map { d in
                            // Create an example item for each document returned
                            return Example(id: d.documentID, name: d["name"] as? String ?? "", notes: d["notes"] as? String ?? "")
                        }
                        
                    }
                    
                }
                
            } else {
                // Handle error
            }
        }
    }
    
}

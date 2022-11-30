//
//  Locker.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 11/28/22.
//

import Foundation
import Firebase

func findAvailableLocker(locker_location: String) async -> String? {
    let db = Firestore.firestore()
    
    do {
        // Check if locker 0 is free at the location
        let locker_document = try await db.collection("location").document(locker_location).getDocument()
        
        if (locker_document.get("locker_0") as? String) == "Available" {
            return "locker_0"
        }
        
        // Check if locker 1 is free at the location
        if (locker_document.get("locker_1") as? String) == "Available" {
            return "locker_1"
        }
        
        // Check if locker 2 is free at the location
        if (locker_document.get("locker_2") as? String) == "Available" {
            return "locker_2"
        }
    } catch {
        return "-1"
    }
    return nil
}

func reserveLocker(locker_id: String, locker_location: String) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("location").document(locker_location).setData([
            locker_id: "Reserved Open",
        ], merge: true)
        
        return nil
    } catch {
        return "An error has occured"
    }
}

func unreserveLocker(locker_id: String, locker_location: String) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("location").document(locker_location).setData([
            locker_id: "Available",
        ], merge: true)
        
        return nil
    } catch {
        return "An error has occured"
    }
}

func lockReservedLocker(locker_id: String, locker_location: String) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("location").document(locker_location).setData([
            locker_id: "Reserved Closed",
        ], merge: true)
        
        return nil
    } catch {
        return "An error has occured"
    }
}

func unlockReservedLocker(locker_id: String, locker_location: String) async -> String? {
    let db = Firestore.firestore()
    do {
        try await db.collection("location").document(locker_location).setData([
            locker_id: "Reserved Open",
        ], merge: true)
        
        return nil
    } catch {
        return "An error has occured"
    }
}

func getLockerAddress(locker: String) -> String {
    if (locker == "GaTech") {
        return "North Ave NW"
    } else if (locker == "Downtown ATL") {
        return "Peachtree St NE"
    } else if (locker == "Midtown ATL") {
        return "2300 Peachtree Road"
    }
    return "None"
}

func getLockerCity(locker: String) -> String {
    return "Atlanta"
}

func getLockerState(locker: String) -> String {
    return "GA"
}

func getLockerZip(locker: String) -> String {
    if (locker == "Georgia Tech") {
        return "30332"
    } else if (locker == "Downtown ATL") {
        return "30303"
    } else if (locker == "Midtown ATL") {
        return "30309"
    }
    return "None"
}

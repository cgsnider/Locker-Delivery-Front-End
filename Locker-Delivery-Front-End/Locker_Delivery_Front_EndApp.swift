//
//  Locker_Delivery_Front_EndApp.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/6/22.
//

import SwiftUI
import FirebaseCore

@main
struct Locker_Delivery_Front_EndApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
    }
}


//
//  Locker_Delivery_Front_EndApp.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/6/22.
//

import SwiftUI
import FirebaseCore
import UserNotifications
import UIKit
import Firebase


@main
struct Locker_Delivery_Front_EndApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var uid = "NejvBVP9T0RNMI0ME6uQjAd5fQ12"
    
    var body: some Scene {
        WindowGroup {
            ContentView(uid:$uid)
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate  {
    
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
//        Messaging.messaging().delegate = self
//        UNUserNotificationCenter.current().delegate = self
//
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { sucess, _ in
//            guard sucess else {
//                return
//            }
//
//            print("Success in APNS registry")
//        }
//
//        application.registerForRemoteNotifications()
        
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else {
                return
            }
            
            print ("Token: \(token)")
        }
    }
}


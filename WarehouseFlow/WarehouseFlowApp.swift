//
//  WarehouseFlowApp.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/5/21.
//

import SwiftUI
import Firebase

@main
struct WarehouseFlowApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = ViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool{
        FirebaseApp.configure()
        
        return true
    }
}

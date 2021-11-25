//
//  ContentView.swift
//  WarehouseFlow
//  The login screen
//  Created by Franky Roq on 10/5/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var model: ViewModel
        var body: some View{
        NavigationView{
            if model.loggedIn{
                MainMenu()
            }else{
                SplashScreenView()
            }
        }
        .onAppear{
            model.loggedIn = model.isLoggedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


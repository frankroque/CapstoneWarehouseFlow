//
//  SplashScreenView.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/3/21.
//  This is the splash screen, which is the first screen the user sees upon opening the application.

import SwiftUI
import Firebase

struct SplashScreenView: View {
    @State var isActive:Bool = false
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
            VStack{
                if self.isActive{
                    LoginView()
                }else{
                    Text("WarehouseFlow")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.myBlue)
                        .padding()
                        .font(.largeTitle)
                        
                    Image(systemName: "shippingbox.fill")//The image is grabbed from Apple's SF Symbols
                        .resizable(resizingMode: .stretch)
                        .frame(width: 200, height: 200)
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

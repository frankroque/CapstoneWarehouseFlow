//
//  AddTypeMenu.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/10/21.
//

import SwiftUI
import Firebase

struct AddTypeMenu: View {
    var arrayOfOptions = ["Add Food Product", "Add Furniture Product", "Add Electronic Product"]
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomLeading)
            VStack{
                Text("Select Type").font(.largeTitle)
                    .bold()
                    .padding()
                NavigationLink(destination: FoodView()){
                    selectOption(options: arrayOfOptions[0])
                }.padding()
                
                NavigationLink(destination: FurnitureView()){
                    selectOption(options: arrayOfOptions[1])
                }.padding()
                
                NavigationLink(destination: ElectronicView()){
                    selectOption(options: arrayOfOptions[2])
                }.padding()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct AddTypeMenu_Previews: PreviewProvider {
    static var previews: some View {
        AddTypeMenu()
    }
}

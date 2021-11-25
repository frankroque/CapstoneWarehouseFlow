//
//  ShowTheData.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/10/21.
//

import SwiftUI
import Firebase

struct ShowTheData: View {
    var arrayOfOptions = ["Show Food Product", "Show Furniture Product", "Show Electronic Product"]
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomLeading)
            VStack{
                Text("Select Type").font(.largeTitle)
                    .bold()
                    .padding()
                NavigationLink(destination: ShowFoodData()){
                    selectOption(options: arrayOfOptions[0])
                }.padding()
                
                NavigationLink(destination: ShowFurnitureData()){
                    selectOption(options: arrayOfOptions[1])
                }.padding()
                
                NavigationLink(destination: ShowElectronicData()){
                    selectOption(options: arrayOfOptions[2])
                }.padding()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ShowTheData_Previews: PreviewProvider {
    static var previews: some View {
        ShowTheData()
    }
}

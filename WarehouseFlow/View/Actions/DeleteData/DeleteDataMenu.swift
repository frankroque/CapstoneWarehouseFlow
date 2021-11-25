//
//  DeleteDataMenu.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/11/21.
//

import SwiftUI

struct DeleteDataMenu: View {
    var arrayOfOptions = ["Delete Food Product", "Delete Furniture Product", "Delete Electronic Product"]
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomLeading)
            VStack{
                Text("Select Product To Delete").font(.largeTitle)
                    .bold()
                    .padding()
                NavigationLink(destination: DeleteScreenView()){
                    selectOption(options: arrayOfOptions[0])
                }.padding()
                
                NavigationLink(destination: DeleteFurnitureData()){
                    selectOption(options: arrayOfOptions[1])
                }.padding()
                
                NavigationLink(destination: DeleteElectronicsData()){
                    selectOption(options: arrayOfOptions[2])
                }.padding()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DeleteDataMenu_Previews: PreviewProvider {
    static var previews: some View {
        DeleteDataMenu()
    }
}

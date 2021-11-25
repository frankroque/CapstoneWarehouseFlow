//
//  ShowFurnitureData.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/10/21.
//

import SwiftUI
import Firebase

struct ShowFurnitureData: View {
    @ObservedObject var model = ViewModel()
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Displaying Furniture Data").font(.largeTitle).multilineTextAlignment(.center).padding()
                Spacer()
                HStack{
                    Text("Product Name")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 100)
                    Text("Product Amount")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 100)
                    Text("Product Type")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 100)
                }
                
                List(model.actions){item in
                    
                    VStack{
                        HStack{
                            Text("\(item.productName)").font(.footnote)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(width: 130, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                            Text("\(item.productAmount)").font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 80, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                            Text("\(item.productType)").font(.footnote)
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .frame(width: 130, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                        }
                    }
                    
                }
                
            }
        }
    }
    init(){
        model.getFurnitureData()
    }
}

struct ShowFurnitureData_Previews: PreviewProvider {
    static var previews: some View {
        ShowFurnitureData()
    }
}

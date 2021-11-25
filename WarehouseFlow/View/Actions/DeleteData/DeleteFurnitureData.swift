//
//  DeleteFurnitureData.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/11/21.
//

import SwiftUI

struct DeleteFurnitureData: View {
    @ObservedObject var modelDelete = ViewModel()
    
    //@EnvironmentObject var modelDelete: ViewModel
    @State var collectionName = ""
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    
    @State private var showAlert = false
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomLeading)
            VStack{
                Divider()
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("Click Red Circle to delete Item")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                HStack{
                  
                    Text("Product Name").bold()
                        .padding()
                        .frame(width:100, height: 100)
                    Text("Product Amount").bold()
                        .padding()
                        .frame(width: 100, height: 100)
                    Text("Product Type").bold()
                        .padding()
                        .frame(width: 100, height: 100)
                }
                
                List(modelDelete.actions){item in
                    HStack{
                        Text(item.productName).font(.footnote)
                            .padding()
                            .frame(width:120, height: 100)
                        Text(item.productAmount).font(.footnote)
                            .padding()
                            .frame(width: 80, height: 100)
                        Text(item.productType).font(.footnote)
                            .padding()
                            .frame(width: 120, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                        
                        Spacer()
                        
                        Button(action: {
                            modelDelete.deleteFurnitureData(deleteItem: item)
                            showAlert = true
                        }, label: {
                            Image(systemName: "minus.circle")
                                .padding(.trailing)
                                .accentColor(.red)
                                
                        })
                        .buttonStyle(BorderlessButtonStyle())
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Item Deleted!"))
                        }
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    init(){
        modelDelete.getFurnitureData()
    }
}

struct DeleteFurnitureData_Previews: PreviewProvider {
    static var previews: some View {
        DeleteFurnitureData()
    }
}

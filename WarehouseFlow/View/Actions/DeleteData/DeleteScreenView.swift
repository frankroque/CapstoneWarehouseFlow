//
//  DeleteScreenView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//  This is to delete product from the food items

import SwiftUI
import Firebase

struct DeleteScreenView: View{
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
                .ignoresSafeArea()
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
                            modelDelete.deleteFoodData(deleteItem: item)
                            showAlert = true
                        }, label: {
                            Image(systemName: "minus.circle")//Image grabbed from Apple's SF Symbols
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
        }
    }
    //this initializer displays the data while being able to delete data using the function from 
    init(){
        modelDelete.getFoodData()
    }

}

struct DeleteScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteScreenView()
    }
}

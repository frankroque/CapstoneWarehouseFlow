//
//  ModifyScreenView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase

struct ModifyScreenView: View {
    @ObservedObject var model = ViewModel()
    //@EnvironmentObject var model: ViewModel
    
    @State var collectionName = ""
    @State var documentName = ""
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    @State var showingAlert = false
   
    
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.myWhite, Color.myBlack]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            VStack{
                Text("Enter the Product Category and Product Identifier").bold()
                    .multilineTextAlignment(.center)
                
                Divider()
                
                TextField("Product Category", text: $collectionName)
                    .padding()
                    .background(Color.white)
                    .frame(width: 410.0)
                TextField("Product Identifier", text: $documentName)
                    .padding()
                    .background(Color.white)
                    .frame(width: 410.0)
                Divider()
                Text("Enter the information in the field you wish to change, but all field must be filled out, even if not all fields will not be changed. ").bold()
                    .multilineTextAlignment(.center)
                TextField("Product Name", text: $productName)
                    .padding()
                    .background(Color.white)
                    .frame(width: 410.0)
                TextField("Product Amount", text: $productAmount)
                    .padding()
                    .background(Color.white)
                    .frame(width: 410.0)
                TextField("Product Type", text: $productType)
                    .padding()
                    .background(Color.white)
                    .frame(width: 410.0)
                
                Button(action: {
                    model.updateTheData(collectionName: collectionName, documentName: documentName, productName: productName, productAmount: productAmount)
                    collectionName = ""
                    documentName = ""
                    productName = ""
                    productAmount = ""
                    productType = ""
                    showingAlert = true
                    
                }, label: {
                    Text("Modify")
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(
                            LinearGradient(colors: [Color.myBlue, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
                        )
                }).alert(isPresented: $showingAlert){
                    Alert(title: Text("Product has been modified!"))
                }
                
            }
        }
        .frame(width: .infinity, height: .infinity)
        .edgesIgnoringSafeArea(.all)
        
        
    }
    
    
    init(){
        model.getElectronicData()
    }
    
}

struct ModifyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyScreenView()
    }
}

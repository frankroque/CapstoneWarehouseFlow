//
//  FurnitureView.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/10/21.
//

import SwiftUI
import Firebase

struct FurnitureView: View {
    @ObservedObject var modelAdd = ViewModel()
    
    @State var documentName = ""
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    @State var productLocation = ""
    
    @State private var showingAlert = false
    
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topTrailing, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack{
                Text("Add a new furniture item").font(.largeTitle).multilineTextAlignment(.center).padding()
                VStack(spacing: 5){
                    ScrollView{
                        TextField("Product Identifier", text: $documentName)
                            .padding()
                            .font(.largeTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Product Name", text: $productName)
                            .padding()
                            .font(.largeTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Product Amount(Units)", text: $productAmount)
                            .padding()
                            //.font(.largeTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                        TextField("Product Type", text: $productType)
                            .padding()
                            .font(.largeTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Product Location", text: $productLocation)
                            .padding()
                            .font(.largeTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Spacer()
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            modelAdd.addFurnitureData(documentName: documentName, productName: productName, productAmount: productAmount, productType: productType, productLocation: productLocation)
                            
                            documentName = ""
                            productName = ""
                            productAmount = ""
                            productType = ""
                            productLocation = ""
                            showingAlert = true
                        }, label: {
                            Text("Add Item")
                                .foregroundColor(Color.black)
                                .padding()
                                .frame(width: 200, height: 50)
                                .border(Color.black)
                                .background(teal)
                        }).alert(isPresented: $showingAlert){
                            Alert(title: Text("Item Added!"))
                        }
                        
                        Divider()
                        NavigationLink(destination: ShowFurnitureData()){
                            Text("Show Data")
                                .foregroundColor(Color.black)
                                .padding()
                                .frame(width: 200, height: 50)
                                .border(Color.black)
                                .background(teal)
                        }
                    }
                }.padding()
            }
            .padding()
        }
    }
}

struct FurnitureView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureView()
    }
}

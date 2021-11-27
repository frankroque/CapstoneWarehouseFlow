//
//  AddType.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/12/21.
//  WILL NOT USE THIS SCREEN FOR DEMO

import SwiftUI

struct AddType: View {
    //@EnvironmentObject var model: ViewModel
    @ObservedObject var model = ViewModel()
    @State var documentType = ""
    @State var showingAlert = false
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)

    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{
                TextField("Add Document Name", text:$documentType)
                    .padding()
                    .border(Color.white)
                    .font(.largeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    model.getElectronicData()
                    documentType = ""
                }, label: {
                    Text("Add Item")
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(teal)
                }).alert(isPresented: $showingAlert){
                    Alert(title: Text("Document Added!"))
                }
                
                NavigationLink(destination: SelectAction()){
                    Text("Action Menu")
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(teal)
                       
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
struct AddType_Previews: PreviewProvider {
    static var previews: some View {
        AddType().environmentObject(ViewModel())
    }
}

//
//  AddCollection.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/21/21.
//  WILL NOT USE THIS SCREEN FOR DEMO

import SwiftUI
import Firebase
import FirebaseAuth

struct AddCollection: View {
    @ObservedObject var model = ViewModel()
    //@EnvironmentObject var model: ViewModel
    
    @State var collectionName = ""
    @State var documentName = ""
    
    var body: some View {
        VStack{
            //Will have to rename the fields as they are only placeholders for testing
            TextField("Collection Name", text: $collectionName)
                .padding()
                .border(Color.white)
                .font(.largeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Document Name", text: $documentName)
                .padding()
                .border(Color.white)
                .font(.largeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                //model.addCollection(collection: collectionName, document: documentName)
                
                collectionName = ""
                documentName = ""
                
            }, label: {
                Text("Add Collection")
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: 200, height: 50)
                    .border(Color.black)
                    .background(Color.blue)
            })
        }
    }
}

struct AddCollection_Previews: PreviewProvider {
    static var previews: some View {
        AddCollection()
    }
}

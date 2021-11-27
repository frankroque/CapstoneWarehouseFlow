//
//  ViewModel.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import Foundation
import Firebase
import FirebaseAuth

class ViewModel: ObservableObject{
    @Published var actions = [CrudOperations]()//the Model Variables
    //@Published var loginActions = [LoginModel]() found easier way of implementing, did not need to use, got more difficult anyways;
    @Published var loggedIn = false
    
    let docData:[String: Any] = [
        "Product Name": String.self,
        "Product Amount": String.self
    ]
    
    /*
     Firebase does not support a way to extract mulltiple collections to show in the swift application, therefore we must create multiple funcitons to extract a single collection
     at a time. Here is the beginning of the functions that read data from firebase a collection at a time.*/
    
    
    func getElectronicData(){
        let db = Firestore.firestore()
        db.collection("Electronics").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot{
                    DispatchQueue.main.async{
                        self.actions = snapshot.documents.map{ docs in
                            return CrudOperations(id: docs.documentID,
                                                  productName: docs["Product Name"] as? String ?? "",
                                                  productAmount: docs["Product Amount"] as? String ?? "",
                                                  productType: docs["Product Type"] as? String ?? "",
                                                  productLocation: docs["Product Location"] as? String ?? "")
                            
                        }
                    }
                }
            }else{
                print("Could not read data...")//error read in debugger output
            }
        }
    }
    
    
    func getFoodData(){
        let db = Firestore.firestore()
        db.collection("Food").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot{
                    DispatchQueue.main.async{
                        self.actions = snapshot.documents.map{ docs in
                            return CrudOperations(id: docs.documentID,
                                                  productName: docs["Product Name"] as? String ?? "",
                                                  productAmount: docs["Product Amount"] as? String ?? "",
                                                  productType: docs["Product Type"] as? String ?? "",
                                                  productLocation: docs["Product Location"] as? String ?? "")
                            
                        }
                    }
                }
            }else{
                print("Could not read data...")
            }
        }
    }
    func getFurnitureData(){
        let db = Firestore.firestore()
        db.collection("Furniture").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot{
                    DispatchQueue.main.async{
                        self.actions = snapshot.documents.map{ docs in
                            return CrudOperations(id: docs.documentID,
                                                  productName: docs["Product Name"] as? String ?? "",
                                                  productAmount: docs["Product Amount"] as? String ?? "",
                                                  productType: docs["Product Type"] as? String ?? "",
                                                  productLocation: docs["Product Location"] as? String ?? "")
                            
                        }
                    }
                }
            }else{
                print("Could not read data...")
            }
        }
    }
    
    //the next three functions write to the database
    func addFoodData(documentName: String, productName: String, productAmount: String, productType: String, productLocation: String){
        let db = Firestore.firestore()
        let docRef = db.collection("Food").document(documentName)
        docRef.setData(["Product Name": productName, "Product Amount": productAmount, "Product Type": productType, "Product Location": productLocation]){error in
            if error == nil{
                print("Data was added")
            }else{
                print("There was a problem adding the data.")
            }
            
        }
    }
    func addFurnitureData(documentName: String, productName: String, productAmount: String, productType: String, productLocation: String){
        let db = Firestore.firestore()
        let docRef = db.collection("Furniture").document(documentName)
        docRef.setData(["Product Name": productName, "Product Amount": productAmount, "Product Type": productType, "Product Location": productLocation]){error in
            if error == nil{
                print("Data was added")
            }else{
                print("There was a problem adding the data.")
            }
            
        }
    }
    
    func addElectronicsData(documentName: String, productName: String, productAmount: String, productType: String, productLocation: String){
        let db = Firestore.firestore()
        let docRef = db.collection("Electronics").document(documentName)
        docRef.setData(["Product Name": productName, "Product Amount": productAmount, "Product Type": productType, "Product Location": productLocation]){error in
            if error == nil{
                print("Data was added")
            }else{
                print("There was a problem adding the data.")
            }
            
        }
    }
    
    //the next three functions delete data from the database
    func deleteFoodData(deleteItem: CrudOperations){
        let db = Firestore.firestore()
        
        db.collection("Food").document(deleteItem.id).delete { error in
            if error == nil{
                DispatchQueue.main.async{
                    self.actions.removeAll{todo in
                        return todo.id == deleteItem.id
                    }
                }
            }
        }
    }
    
    func deleteFurnitureData(deleteItem: CrudOperations){
        let db = Firestore.firestore()
        
        db.collection("Furniture").document(deleteItem.id).delete { error in
            if error == nil{
                DispatchQueue.main.async{
                    self.actions.removeAll{todo in
                        return todo.id == deleteItem.id
                    }
                }
            }
        }
    }
    
    func deleteElectronicData(deleteItem: CrudOperations){
        let db = Firestore.firestore()
        
        db.collection("Food").document(deleteItem.id).delete { error in
            if error == nil{
                DispatchQueue.main.async{
                    self.actions.removeAll{todo in
                        return todo.id == deleteItem.id
                    }
                }
            }
        }
    }
    
    //this functino is used in the modify data view to modify data the user needs to change in the database
    func updateTheData(collectionName:String, documentName: String,productName:String, productAmount:String){
        let db = Firestore.firestore()
        db.collection(collectionName).document(documentName).updateData(["Product Name": productName, "Product Amount": productAmount]) {error in
            if error == nil{
                print("Success updating data")
            }else{
                print("The item does not exist! Add it first before modifying.")
            }
            
        }
    }
    
    
    
    
    //these next functions are about user log in and signing up
    
    var isLoggedIn: Bool{
        return Auth.auth().currentUser != nil
    }
    
    func login(email:String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self](result, error) in
            guard result != nil , error == nil else{
                return
            }
            
            DispatchQueue.main.async{
                print("Success!")
                self?.loggedIn = true
            }
        }
    }
    
    func createAccount(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                print("Success")
                self?.loggedIn = true
            }
        }
    }
    
    func logout(){
        try? Auth.auth().signOut()
        
        self.loggedIn = false
    }
    
}

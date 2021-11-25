//
//  SignUpView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/20/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View { @EnvironmentObject var model: ViewModel
    
    @State var showingAlert = false
    
    @State var email = ""
    @State var password = ""
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)
    
    var body: some View {
        NavigationView{
            ScrollView{
                    VStack{
                        
                        Text("Sign up.Enter an email and a password")
                            .bold()
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer().padding()
                        TextField("Enter Username", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                        
                        TextField("Enter Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                        
                        Spacer()
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            
                            guard !email.isEmpty, !password.isEmpty else{
                                return
                            }
                            model.createAccount(email: email, password: password)
                            email = ""
                            password = ""
                            
                        }, label: {
                            Text("Create Account")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .cornerRadius(8)
                            
                        })
                        
                    }
            }
            
        }.navigationBarTitle("Create Account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

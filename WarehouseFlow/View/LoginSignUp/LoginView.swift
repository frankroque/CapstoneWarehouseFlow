//
//  LoginView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/20/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var model: ViewModel
   
    @State var showingAlert = false
    @State var isLogin = false
    @State var isSecure = true
    
    @State var email = ""
    @State var password = ""
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topTrailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            NavigationView{
                VStack(alignment: .center){
                    ScrollView{
                        Text("Enter Username and Password")
                            .bold().italic()
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                        TextField("Enter Username", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                        
                        HStack{
                            if isSecure{
                                SecureField("Enter Password", text: $password)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                            }else{
                                TextField("Enter Password", text: $password)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                            }
                            
                            Button(action: {
                                self.isSecure.toggle()
                            }) {
                                if isSecure{
                                    Image(systemName: "eye.slash").padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).accentColor(.black)
                                }else{
                                    Image(systemName: "eye").padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).accentColor(.red)
                                }
                            }
                            
                        }
                       
                        
                        Button(action: {
                            
                            guard !email.isEmpty, !password.isEmpty else{
                                return
                            }
                            model.login(email: email, password: password)
                            //showingAlert = true
                            email = ""
                            password = ""
                            
                        }, label: {
                            Text("Login")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .cornerRadius(8)
                            
                        }).alert(isPresented: $showingAlert){
                            if showingAlert == false{
                                return Alert(title: Text("Incorrect Email or Password"),
                                      message: Text("Try again or Sign up"))
                            }else{
                                return Alert(title: Text("Success"))
                            }
                        }
                        NavigationLink("Create Account", destination: SignUpView())
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }.padding()
                    
                }
                .navigationBarTitle("WarehouseFlow")
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


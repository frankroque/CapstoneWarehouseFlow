//
//  ShowSpecificData.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/2/21.
//  WILL NOT USE THIS SCREEN FOR THE DEMO

import SwiftUI
import Firebase

struct ShowSpecificData: View {
    @ObservedObject var model = ViewModel()
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomTrailing)
            VStack{
                Text("Displaying Data")
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
                    
                    HStack{
                        VStack{
                            Text("\(item.productName) - ")
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(width: 150, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                    HStack{
                        VStack{
                            Text("- \(item.productAmount) -")
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 90, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                    HStack{
                        VStack{
                            Text(" - \(item.productType)")
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .frame(width: 150, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                    
                }
                LinearGradient(colors: [Color.myWhite, Color.myBlue], startPoint: .topTrailing, endPoint: .bottomTrailing)
                Button {
                    model.getElectronicData()
                } label: {
                    Text("Show Data")
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(Color.green)
                }

                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ShowSpecificData_Previews: PreviewProvider {
    static var previews: some View {
        ShowSpecificData()
    }
}

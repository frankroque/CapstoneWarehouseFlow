//
//  ShowData.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase
struct ShowData: View {
    @ObservedObject var model = ViewModel()

    //@EnvironmentObject var model: ViewModel
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    @State var type = ["Electronics", "Food", "Furniture"]
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topTrailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Showing Product in Warehouse")
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                HStack{
                    Text("Product Name")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(width: 150, height: 100)

                    Text("Product Amount")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 100)

                    Text("Product Type")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150, height: 100)

                }
                List(model.actions){item in
                    VStack{
                        HStack{
                            Text("\(item.productName)").font(.footnote)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(width: 130, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                            Text("\(item.productAmount)").font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 90, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                            Text("\(item.productType)").font(.footnote)
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .frame(width: 130, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                        }
                    }
                }
                .padding(.vertical)
                .background(Color.blue, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Button(action: {
                        model.getElectronicData()
                    }, label: {
                        createButton(type: type[0])
                    })
                    Button(action: {
                        model.getFoodData()
                    }, label: {
                        createButton(type: type[1])
                    })
                    Button(action: {
                        model.getFurnitureData()
                    }, label: {
                        createButton(type: type[2])
                    })
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ShowData_Previews: PreviewProvider {
    static var previews: some View {
        ShowData()
    }
}

//
//  LocationView.swift
//  WarehouseFlow
//
//  Created by Francisco Roque on 11/14/21.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var model = ViewModel()
    @State var productName = ""
    @State var productType = ""
    @State var productLocation = ""
    @State var type = [ "Electronics", "Food", "Furniture"]
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topTrailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                    Text("Location Display")
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

                    Text("Product Type")
                        .bold()
                        .underline()
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 100)

                    Text("Product Location")
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
                            
                            Text("\(item.productType)").font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                            Text("\(item.productLocation)").font(.footnote)
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .frame(width: 130, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                        }
                    }
                    
                }.padding(.vertical)
                .background(Color.blue, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                // chose three categories that I beleived were the most vague. That way, we can add sub categories under those main categories and keep adding to the database without many repeats and be more specific when needed
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
                Spacer()
                Spacer()
            }
            
        }
    }
}

//struct for buttons that can be used in other views as well
struct createButton: View{
    @State var type = ""
    var body: some View{
        Text(type)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 120, height: 50)
            .border(Color.black)
            .background(
                LinearGradient(colors: [Color.myBlue, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
            )
            
    }
}
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

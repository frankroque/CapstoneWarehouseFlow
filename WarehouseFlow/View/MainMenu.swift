//
//  MainMenu.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/13/21.
//

import SwiftUI
import Firebase

//This extension is created here, but its variables could be used in other pages/views for the background color and for the buttons
extension Color{
    static var myBlue = (Color(red: 10 / 255, green: 100 / 255, blue: 200 / 255))
    static var myGreen = (Color(red:10 / 255, green: 200 / 255, blue: 100 / 255))
    static var myWhite = (Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
    static var myBlack = (Color(red: 10/255, green: 50 / 255, blue: 60 / 255))
}

struct MainMenu: View {
    //@State var model = ViewModel()
    @EnvironmentObject var model: ViewModel
    @State var arrayOfOptions = ["Display Available Product", "Action Menu", "Product Location"]
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
                VStack{
                    Text("Main Menu")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Text("Please click on the button to navigate to desired menu")
                        .italic()
                        .bold()
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: ShowData()){
                        selectOption(options: arrayOfOptions[0])
                    }.padding()
                    
                    NavigationLink(destination: SelectAction()){
                        selectOption(options: arrayOfOptions[1])
                    }.padding()
                    
                    NavigationLink(destination: LocationView()){
                        selectOption(options: arrayOfOptions[2])
                    }.padding()
                    
                    Button(action: {
                        model.logout()
                    }, label: {
                        Text("Log Out")
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            //.background(Color.red)
                            .cornerRadius(5)
                            .background(
                                LinearGradient(colors: [Color.red, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
                            )
                    })
                    
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}
//this struct works in other view as well if the selectOption for texts is used
struct selectOption: View{
    @State var options: String
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)

    var body: some View{
        Text(options)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 300, height: 50)
            //.background(Color.myGreen)
            .cornerRadius(5)
            .background(
                LinearGradient(colors: [Color.myBlue, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
            )
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

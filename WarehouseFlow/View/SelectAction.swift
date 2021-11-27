//
//  SelectAction.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI

struct SelectAction: View {
    @EnvironmentObject var model: ViewModel
    @State var delete = ""
    @State var actionArray = ["Add Product", "Delete Product", "Modify Product", "Show Data"]
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.myWhite, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
            VStack{
                Text("Select Action")
                    .bold()
                    .font(.largeTitle)
            //this NaviagationLinks use the struct below so add buttons easily, if more buttons are needed add a scroll view and more buttons
                NavigationLink(destination: AddTypeMenu()){
                    actionsSelection(action: actionArray[0])
                }
                NavigationLink(destination: DeleteDataMenu()){
                    actionsSelection(action: actionArray[1])
                }
                NavigationLink(destination: ModifyScreenView()){
                    actionsSelection(action: actionArray[2])
                }
                NavigationLink(destination: ShowTheData()){
                    actionsSelection(action: actionArray[3])
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//Use this struct to add more buttons for navigation
struct actionsSelection: View{
    @State var action: String
    var body: some View{
        VStack{
            Section{
                Text(action)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .border(Color.black)
                    .background(
                        LinearGradient(colors: [Color.myBlue, Color.myBlack], startPoint: .topLeading, endPoint: .bottomLeading)
                    )
                    .cornerRadius(5)
            }
        }
    }
}

struct SelectAction_Previews: PreviewProvider {
    static var previews: some View {
        SelectAction().environmentObject(ViewModel())
    }
}

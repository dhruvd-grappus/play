//
//  ContentView.swift
//  play
//
//  Created by Dhruv on 26/10/23.
//

import SwiftUI

struct LoginPage: View {
     func buttonTapped(withString text: String) {
           print("Button tapped with text: \(text)")
           // You can perform any actions you want here.
       }

    var body: some View {
       
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView() {
                
                
                LoginHeader()
                
                VStack{
                    
                    CurvedTextField(
                        hint: {
                        HStack {
                            Text("+91")
                            Color.black.opacity(0.5).frame(width: 1,height: 20)
                        }
                    },
                    onChanged: buttonTapped
                    )
                    Text("OR")
                        .font(Font.custom(Fonts.archivoMedium, size: 14))
                      .kerning(0.2)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53)).padding(.vertical,26)
                    
                    VStack(spacing:12){
                        CurvedButtonWithIcon(
                        icon: "LoginBg", text: "efjebf"
                        ){
                            
                          
                        }
                        CurvedButtonWithIcon(
                        icon: "LoginBg", text: "efjebf"
                        ){
                            
                            print("tap")
                            
                        }
                        CurvedButtonWithIcon(
                        icon: "LoginBg", text: "efjebf"
                        ){
                            
                            print("tap")
                            
                        }
                    }
                   
                    Spacer()
                    
                }.padding(.horizontal,15).padding(.vertical,34).background(.white)
               
               
                Spacer()
                
            }.frame(maxWidth: .infinity).ignoresSafeArea(.keyboard).edgesIgnoringSafeArea(.bottom)
            
        }.ignoresSafeArea(.keyboard)
       
           
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

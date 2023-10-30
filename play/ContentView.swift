//
//  ContentView.swift
//  play
//
//  Created by Dhruv on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                
                
                LoginHeader()
                
                VStack{
                    
                    CurvedTextField(
                    hint: {
                        HStack {
                            Text("+91")
                            Color.black.opacity(0.5).frame(width: 1,height: 20)
                        }
                    }
                    )
                    
                }.padding(.horizontal,15).padding(.vertical,34)
               
               
                Spacer()
                
            }.frame(maxWidth: .infinity)
            .background(.white)
        }
       
           
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

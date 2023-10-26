//
//  ContentView.swift
//  play
//
//  Created by Dhruv on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Spacer()
                .frame(minHeight: 10,maxHeight:10 )
                .fixedSize()
            
            LoginHeader()
           
            ZStack{
            
                Text("BigsSpoon")
                    .font(.custom("Archio-Bold",size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(Color.red).frame(height: 20)
                
            }.frame(height: 316).background(.orange)
            
            Spacer()
        }.frame(maxWidth: .infinity).background(.gray)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

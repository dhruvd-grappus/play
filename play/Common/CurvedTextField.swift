//
//  CurvedTextField.swift
//  play
//
//  Created by Dhruv on 27/10/23.
//

import SwiftUI

struct CurvedTextField<Content: View >: View {

    let hint: Content?
    init() {
        hint=nil;
       
    }
       init(@ViewBuilder hint: () -> Content?) {
           self.hint = hint()
       }

    var body: some View {
        HStack{
            hint
            
            
        }.padding(.vertical,17).padding([.leading,.trailing],22).background(Color("LightGrey")).cornerRadius(10)
    }
}

struct CurvedTextField_Previews: PreviewProvider {
    static var previews: some View {
        CurvedTextField(hint: {Text("ehbhfbheb")})
    }
}

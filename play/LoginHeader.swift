//
//  LoginHeader.swift
//  play
//
//  Created by Dhruv on 26/10/23.
//

import SwiftUI

struct LoginHeader: View {
    var body: some View {
        ZStack{
            VStack{
                
                Spacer()
                Text("Almost ther")
                    .font(.custom(Fonts.archivoBold,size: 24))
                    .foregroundColor(Color.white)
                
                Text("Signup Or Login To Continue")
                    .font(.custom(Fonts.archivoMedium,size: 16))
                    .fontWeight(.thin)
                    .foregroundColor(Color.white).padding(.top,1).padding(.bottom,36)
                
            }
           
            
        }.frame(
            maxWidth: .infinity
        ).frame(height: 356).background(.black  ).cornerRadius(21)
           

    }
}

struct LoginHeader_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeader()
    }
}

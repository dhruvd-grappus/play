//
//  CurvedButtonWithIcon.swift
//  play
//
//  Created by Dhruv on 30/10/23.
//

import SwiftUI

struct CurvedButtonWithIcon: View {
    let icon: String
    let text: String
    let onTap: () -> Void
    var body: some View {
        HStack {
            Image(icon).resizable().frame(width: 16, height: 20, alignment: .leading)
            Spacer()
            Text(text)
            Spacer()

            Color.white.frame(width: 16, height: 20, alignment: .leading)

        }.padding(.horizontal, 20).padding(.vertical, 15).frame(maxWidth: .infinity, alignment: .leading).cornerRadius(10) /// make the background rounded
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            ).onTapGesture {
                onTap()
            }
    }
}

struct CurvedButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurvedButtonWithIcon(
            icon: "LoginBg", text: "efjebf"
        ) {}
    }
}

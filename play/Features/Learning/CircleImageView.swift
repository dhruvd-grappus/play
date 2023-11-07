//
//  CircleImageView.swift
//  play
//
//  Created by Jai Nijhawan on 06/11/23.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
        Image("LoginBg")
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircleImageView()
}

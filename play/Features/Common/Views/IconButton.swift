//
//  IconButton.swift
//  play
//
//  Created by Dhruv on 03/11/23.
//

import SwiftUI

struct IconButton: View {
    let icon: AssetImages
    var color: Color? = nil

    var onTapAction: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.clear)
                .frame(width: 47, height: 47)
                .background(color ?? .white.opacity(0.08))
                .cornerRadius(24)

            icon.image()
        }.onTapGesture {
            onTapAction?()
        }
    }
}

extension IconButton {
    func label(text: String) -> some View {
        VStack {
            self
            Text(text).padding(.top, 7).foregroundColor(.white)
        }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            IconButton(
                icon: AssetImages.cancel,
                color: .white
            )
        }
    }
}

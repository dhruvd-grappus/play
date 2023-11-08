//
//  ProfileSuccessView.swift
//  play
//
//  Created by Dhruv on 07/11/23.
//

import SwiftUI

struct ProfileSuccessView: View {
    @State private var scale: Double = 0
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://i.postimg.cc/Mps0CZ8n/photo.png"
            )) { image in
                image
            } placeholder: {
                ProgressView()
            }
            .scaleEffect(scale).onAppear {
                withAnimation(Animation.easeOut(duration: 2)) {
                    scale = 1
                }
            }

            Spacer()

            ProfileWidgets()

            Spacer().frame(width: 100, height: 133)

        }.frame(maxHeight: .infinity)
    }
}

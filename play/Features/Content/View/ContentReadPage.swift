//
//  ContentReadPage.swift
//  play
//
//  Created by Dhruv on 08/11/23.
//

import SwiftUI

struct ContentReadPage: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Spacer().frame(height: 5)
                Text("Rejection is a part of life, but it doesn't have to bring you down! By equipping yourself with the right tools, you can become rejection-proof and bounce back stronger than ever. Here are 10 awesome tips to help you conquer rejection and embrace success! \n\n     1.Embrace a Positive Mindset: Believe in yourself and maintain a positive attitude. Remember that rejection is not a reflection of your worth, but an opportunity to learn and grow. \n\n    2. Learn from Feedback: Instead of taking rejection personally, seek feedback and use it to improve. Embracing constructive criticism will help you develop new skills and enhance your performance.\n\n     1.Embrace a Positive Mindset: Believe in yourself and maintain a positive attitude. Remember that rejection is not a reflection of your worth, but an opportunity to learn and grow. \n\n    2. Learn from Feedback: Instead of taking rejection personally, seek feedback and use it to improve. Embracing constructive criticism will help you develop new skills and enhance your performance.\n\n     1.Embrace a Positive Mindset: Believe in yourself and maintain a positive attitude. Remember that rejection is not a reflection of your worth, but an opportunity to learn and grow. \n\n    2. Learn from Feedback: Instead of taking rejection personally, seek feedback and use it to improve. Embracing constructive criticism will help you develop new skills and enhance your performance.")
                    .font(Font.custom("Inter", size: 16))
                    .kerning(0.1)
                    .foregroundColor(.white)
                    .frame(width: 341, alignment: .leading)

                Spacer().frame(height: 70)
                Spacer()
            }.padding(.vertical, 20).padding(.horizontal, 20)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ContentReadPage()
    }
}

//
//  ContentTitle.swift
//  play
//
//  Created by Dhruv on 08/11/23.
//

import SwiftUI

struct ContentTitle: View {
    @State var optionsEnabled = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading) {
                    ZStack{
                        AssetImages.circleContainer.image()
                        Text("DEPRESSION")
                          .font(
                            Font.custom("Inter", size: 17)
                              .weight(.medium)
                          )
                          .foregroundColor(.black)
                        
                    }
                    .padding(.bottom,10)
                   
                    Text("These are the 10 ways to rejection proof yourself!")
                        .font(
                            Font.custom("Inter-SemiBold", size: 28)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .frame(width: 320, alignment: .topLeading)
                    Spacer().frame(height: 13)
                    Text("Gear up to be Rejection-Proof! Check out the super cool article \"Crush Rejection with These 10 Awesome Tips!\" Learn how to bounce back like a champ, embrace feedback, and stay positive. With these epic techniques, you'll become a rejection-fighting superstar, ready to conquer any challenge! Let's rock it!")
                        .font(Font.custom("Inter-SemiBold", size: 16))
                        .kerning(0.1)
                        .foregroundColor(.white.opacity(0.6))
                        .frame(width: 329, alignment: .topLeading).padding(.trailing, 40)
                    VStack(alignment: .leading) {
                        Text("28 Jul ‘23 • 5 min read")
                            .foregroundColor(.white)
                            .font(.system(size: 14))

                            .padding(.top, 24)
                            .padding(.bottom, 26)

                        Text("Scroll to deep dive")
                            .font(Font.custom("Inter-SemiBold", size: 14))
                            .kerning(0.1)
                            .foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                    }
                    .blur(radius: optionsEnabled ? 3 : 0)

                }.padding(.vertical, 20).padding(.horizontal, 20)
            }
            VStack {
                Spacer()
                Spacer().frame(height: 120)
                ZStack(alignment: .top) {
                    if optionsEnabled {
                        Color.black.opacity(0.6).blur(radius: 10)
                    } else {
                        Color.clear
                    }
                    HStack(alignment: .top) {
                        if optionsEnabled {
                            Spacer().frame(width: 10)
                            HStack(spacing: 39) {
                                IconButton(icon: .handHeart).label(text: "Like")
                                IconButton(icon: .handHeart).label(text: "Bookmark")
                                IconButton(icon: .handHeart).label(text: "Share")
                            }.transition(.move(edge: .bottom))

                            Spacer().frame(width: 28)
                        }

                        Spacer()
                        IconButton(icon: optionsEnabled ? .cancelBlack : .threeDotsBlack, color: .white) {
                            withAnimation(.easeIn(duration: 0.3)) {
                                optionsEnabled.toggle()
                            }
                        }
                    }.padding(.top, 20).padding(.horizontal, 20)
                }.frame(maxHeight: 109.responsiveHeight()).padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ContentTitle()
    }
}

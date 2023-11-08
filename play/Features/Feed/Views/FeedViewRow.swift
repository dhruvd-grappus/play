//
//  FeedViewRow.swift
//  play
//
//  Created by Jai Nijhawan on 07/11/23.
//

import SwiftUI

struct FeedViewRow: View {
    @EnvironmentObject var router: Router
    let content: Content? = nil
    let bgColor = Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.1))
    var body: some View {
        VStack {
            Image("LoginBg")
                .resizable()
                .frame(height: 150)
                .aspectRatio(contentMode: .fit)

            HStack {
                Text("Jai")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.black)
                    .background(Color(uiColor: UIColor(red: 1.00,
                                                       green: 0.73,
                                                       blue: 0.96,
                                                       alpha: 1.00)))
                    .font(.custom("Brule-Bold", size: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 3)
                    )
                    .cornerRadius(20)
                    .padding(.leading, 30)
                Spacer()
            }.offset(y: -30)
                .padding(.bottom, -30)

            HStack {
                Text("These are the 10 ways to rejection proof yourself!")
                    .font(.system(size: 18))
                    .bold()
                    .padding(.leading, 10)
                    .foregroundColor(.white)
                Spacer()
            }

            HStack {
                Text("28 Jul ‘23 • 5 min read")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .padding(.leading, 10)
                    .padding(.top, 3)
                    .padding(.bottom, 5)
                Spacer()

                Image("threeDots")
                    .resizable()
                    .frame(width: 21, height: 5)
                    .padding(.all, 15)
            }
        }
        .background(bgColor)
        .cornerRadius(8)
        .padding(.vertical, 10)
        .padding(.horizontal, 10).onTapGesture {
            router.navigate(to: .detail)
        }
    }
}

#Preview {
    FeedViewRow()
}

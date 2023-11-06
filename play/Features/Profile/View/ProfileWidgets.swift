//
//  ProfileWidgets.swift
//  play
//
//  Created by Dhruv on 03/11/23.
//

import SwiftUI

struct ProfileWidget: View {
    var text: String? = nil
    let icon: AssetImages

    func height() -> CGFloat {
        return text == nil ? 77.0 : 144.0
    }

    var body: some View {
        ZStack {
            Color.white.opacity(0.1)

            if text == nil {
                Image(icon.rawValue).resizable().scaledToFit().padding(.horizontal, 30).padding(.vertical, 30)
            } else {
                HStack {
                    VStack(alignment: .leading) {
                        IconButton(icon: icon)

                        Spacer()

                        Text(text ?? "").font(.custom(Fonts.archivoMedium, size: 16)).foregroundColor(.white)
                            .fontWeight(.medium)
                    }

                    Spacer()
                }
                .padding(.horizontal, 20).padding(.vertical, 21).frame(width: 175)
            }
        }
        .frame(height: height())
        .cornerRadius(5)
    }
}

struct ProfileWidgets: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack {
                ProfileWidget(text: "App Settings", icon: AssetImages.cancel)
                ProfileWidget(text: "Terms & Conditions", icon: AssetImages.cancel)
            }
            VStack(alignment: .leading) {
                HStack {
                    ProfileWidget(icon: AssetImages.cancel).frame(maxWidth: .infinity)
                    ProfileWidget(icon: AssetImages.cancel).frame(maxWidth: .infinity)
                }
                ProfileWidget(text: "Terms & Conditions", icon: AssetImages.cancel)
            }
        }
    }
}

struct ProfileWidgets_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ProfileWidgets()
        }
    }
}

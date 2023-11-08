//
//  ContentDetail.swift
//  play
//
//  Created by Dhruv on 08/11/23.
//

import SwiftUI

struct ContentDetail: View {
    @EnvironmentObject var router: Router
    func gradient() -> some View {
        Rectangle()
            .foregroundColor(.clear)

            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .black.opacity(selectedItem == 2 ? 1 : 0), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.04, green: 0.04, blue: 0.03), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: -0.13),
                    endPoint: UnitPoint(x: 0.5, y: 0.69)
                )
            )
    }

    @State private var selectedItem = 1

    var body: some View {
        ZStack {
            VStack {
                Image("LoginBg").resizable().frame(height: 0.7.fractionOfHeight())
                Spacer()
            }.ignoresSafeArea()

            gradient()
            VStack {
                HStack {
                    IconButton(icon: AssetImages.cancel) {
                        router.navigateBack()
                    }

                    Spacer()
                }.padding(.horizontal, 20)
                GeometryReader { proxy in
                    TabView(selection: $selectedItem) {
                        ContentTitle().rotateForPageView(proxy: proxy).tag(1)
                        ContentReadPage().rotateForPageView(proxy: proxy).tag(2)
                    }.verticalPageView(proxy: proxy)
                        .onChange(of: selectedItem) { value in print("selected tab = \(value)") }
                }
            }
        }
    }
}

#Preview {
    ContentDetail().environmentObject(Router())
}

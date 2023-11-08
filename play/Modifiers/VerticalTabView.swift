//
//  VerticalTabView.swift
//  play
//
//  Created by Dhruv on 08/11/23.
//

import Foundation
import SwiftUI

extension View {
    func rotateForPageView(proxy: GeometryProxy) -> some View {
        rotationEffect(.degrees(-90)) // Rotate content
            .frame(
                width: proxy.size.width,
                height: proxy.size.height
            )
    }
}

extension TabView {
    func verticalPageView(proxy: GeometryProxy) -> some View {
        frame(
            width: proxy.size.height, // Height & width swap
            height: proxy.size.width
        ).rotationEffect(.degrees(90), anchor: .topLeading) // Rotate TabView
            .offset(x: proxy.size.width) // Offset back into screens bounds
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            ).tabViewStyle(PageTabViewStyle())
    }
}

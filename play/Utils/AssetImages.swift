//
//  AssetImages.swift
//  play
//
//  Created by Dhruv on 03/11/23.
//

import Foundation

import SwiftUI

enum AssetImages: String {
    case cancel = "Cancel"
    case cancelBlack = "CancelBlack"

    case circleContainer = "CircleContainer"
    case threeDots
    case threeDotsBlack = "threeDots-Black"
    case handHeart = "HandHeart"
    case bell = "Bell"
    case user = "User"
}

extension AssetImages {
    func image() -> Image {
        Image(rawValue)
    }
}

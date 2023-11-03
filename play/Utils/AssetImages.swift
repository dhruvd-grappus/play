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
}

extension AssetImages {
    func image() -> Image {
        Image(rawValue)
    }
}

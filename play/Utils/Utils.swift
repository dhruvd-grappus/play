import SwiftUI

let ipadWidth = 390.0
let ipadHeight = 844.0

extension Double{
    func responsiveWidth() -> Double {
        (self / ipadWidth) * UIScreen.main.bounds.width
    }

    func responsiveHeight() -> Double {
        (self / ipadHeight) * UIScreen.main.bounds.height
    }

   
}

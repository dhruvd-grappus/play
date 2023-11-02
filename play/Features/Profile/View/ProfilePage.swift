//
//  ProfilePage.swift
//  play
//
//  Created by Dhruv on 02/11/23.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var verifyVM: VerifyPhoneViewModel
    var body: some View {
        switch verifyVM.status {
        case .success:
            Color.green
        case .loading:
            Color.yellow
        case let .error(message):

            Text(message ?? "")

        default:
            HStack {}
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}

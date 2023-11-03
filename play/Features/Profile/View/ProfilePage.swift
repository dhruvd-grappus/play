//
//  ProfilePage.swift
//  play
//
//  Created by Dhruv on 02/11/23.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var verifyVM: VerifyPhoneViewModel

    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Color(AppColors.black.rawValue)

            VStack {
                HStack {
                    if verifyVM.status == StateStatus.success {
                        VStack(alignment: .leading) {
                            Text("User").font(.custom(Fonts.archivoBold, size: 16)).foregroundColor(.white).padding(.bottom, 7)

                            Text(verifyVM.id).font(.custom(Fonts.archivoBold, size: 14)).fontWeight(.thin).foregroundColor(.white.opacity(0.5))
                        }
                    }

                    Spacer()
                    IconButton(icon: AssetImages.cancel) {
                        router.navigateBack()
                    }
                }
                Spacer()
                switch verifyVM.status {
                case .success:
                    VStack {}

                case .loading:
                    ProgressView().controlSize(.large).scaleEffect(1.74).progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                case let .error(message):
                    Text(message ?? "").foregroundColor(.white)
                default:
                    HStack {}
                }

                Spacer()

            }.padding(.horizontal, 16).padding(.vertical, 10)

        }.background(Color(AppColors.black.rawValue))
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ProfilePage()
        }.environmentObject(VerifyPhoneViewModel(phoneService: PhoneService(networkManager: NetworkManager.shared)))
            .environmentObject(Router())
    }
}

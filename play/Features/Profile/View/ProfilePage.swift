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

    func profileView() -> some View {
        return VStack(alignment: .leading) {
            Text("User").font(.custom(Fonts.archivoBold, size: 16)).foregroundColor(.white).padding(.bottom, 7)

            Text(verifyVM.id).font(.custom(Fonts.archivoBold, size: 14)).fontWeight(.thin).foregroundColor(.white.opacity(0.5))
        }
    }

    var body: some View {
        ZStack {
            Color(AppColors.black.rawValue)

            VStack {
                HStack(alignment: .top) {
                    if verifyVM.status == StateStatus.success {
                        profileView()
                    }

                    Spacer()
                    IconButton(icon: AssetImages.cancel) {
                        router.navigateBack()
                    }
                }.padding(.bottom, 40)

                switch verifyVM.status {
                case .success:
                    VStack {
                        AsyncImage(url: URL(string: "https://i.postimg.cc/Mps0CZ8n/photo.png"))

                        Spacer()

                        ProfileWidgets()

                        Spacer().frame(width: 100, height: 133)

                    }.frame(maxHeight: .infinity)

                case .loading:
                    ProgressView().controlSize(.large).scaleEffect(1.74).progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                case let .error(message):
                    Text(message ?? "").foregroundColor(.white)
                default:
                    HStack {}
                }

            }.padding(.horizontal, 16).padding(.vertical, 12).frame(maxHeight: .infinity)

        }.background(Color(AppColors.black.rawValue)).edgesIgnoringSafeArea(.bottom)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static let verifyVM: VerifyPhoneViewModel = .init(phoneService: PhoneService(networkManager: NetworkManager.shared))

    static var previews: some View {
        ZStack {
            ProfilePage()
        }.environmentObject(verifyVM)
            .environmentObject(Router())
    }
}

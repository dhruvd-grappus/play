//
//  playApp.swift
//  play
//
//  Created by Dhruv on 26/10/23.
//

import SwiftUI

@main
struct playApp: App {
    @ObservedObject var router = Router()

    let networkManager = NetworkManager()

    let verifyPhoneViewModel: VerifyPhoneViewModel

    init() {
        verifyPhoneViewModel = VerifyPhoneViewModel(phoneService: PhoneService(networkManager: networkManager))
        router.navigate(to: .login)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                Home()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .login:
                            LoginPage().navigationBarBackButtonHidden(true)
                        }
                    }
            }
            .environmentObject(verifyPhoneViewModel)
            .environmentObject(router).navigationBarBackButtonHidden(true)
        }
    }
}

struct Previews_playApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

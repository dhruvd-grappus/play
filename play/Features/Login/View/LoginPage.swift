//
//  LoginPage.swift
//  play
//
//  Created by Dhruv on 26/10/23.
//

import SwiftUI

struct LoginPage: View {
    @EnvironmentObject var verifyVM: VerifyPhoneViewModel
    @State var phone: String = ""
    func onChanged(withString text: String) {
        phone = text
    }

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView {
                LoginHeader()

                VStack {
                    CurvedTextField(
                        hint: {
                            HStack {
                                Text("+91")
                                Color.black.opacity(0.5).frame(width: 1, height: 20)
                            }
                        },
                        onChanged: onChanged
                    )
                    Text("OR")
                        .font(Font.custom(Fonts.archivoMedium, size: 14))
                        .kerning(0.2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53)).padding(.vertical, 26)

                    VStack(spacing: 12) {
                        CurvedButtonWithIcon(
                            icon: "LoginBg", text: "Verify Phone(POST)"
                        ) {
                            Task {
                                await verifyVM.verifyPhone(phone: phone)
                            }
                        }
                        CurvedButtonWithIcon(
                            icon: "LoginBg", text: "GET Call "
                        ) {
                            print("tap")
                        }
                        CurvedButtonWithIcon(
                            icon: "LoginBg", text: "Animation"
                        ) {
                            print("tap")
                        }
                    }

                    Spacer()

                }.padding(.horizontal, 15).padding(.vertical, 34).background(.white)

                Spacer()

            }.frame(maxWidth: .infinity).ignoresSafeArea(.keyboard).edgesIgnoringSafeArea(.bottom)

        }.ignoresSafeArea(.keyboard)
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

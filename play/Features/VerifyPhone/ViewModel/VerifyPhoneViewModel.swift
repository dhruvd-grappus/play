//
//  VerifyPhoneViewModel.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Combine
import Foundation
import SwiftUI

class VerifyPhoneViewModel: ViewModel {
    // @Published var userData: UserData?

    let phoneService: PhoneService

    init(phoneService: PhoneService) {
        self.phoneService = phoneService
    }

    func verifyPhone(phone: String) async {
        DispatchQueue.main.async {
            self.status = .loading
        }
        let result = await phoneService.generateOTP(params: GenerateOTPParams(phone: phone))
        print(status)
        switch result {
        case let .success(response):
            print(response)
        case let .failure(error):
            print(error)
        }
    }
}

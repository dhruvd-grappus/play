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
        case .success:
            DispatchQueue.main.async {
                self.status = .success
            }
        case let .failure(error):
            DispatchQueue.main.async {
                self.status = .error(APIError.commonErrorDescription)

                if case let APIError.serverError(_, response) = error {
                    self.status = .error(response.error)
                }
            }
        }
    }
}

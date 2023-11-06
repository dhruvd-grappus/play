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

    @Published var id: String = ""

    init(phoneService: PhoneService) {
        self.phoneService = phoneService
        super.init()
    }

    func verifyPhone(phone: String) async {
        DispatchQueue.main.async {
            self.status = .loading
        }
        let result = await phoneService.generateOTP(params: GenerateOTPParams(phone: phone))
        switch result {
        case let .success(response):
            DispatchQueue.main.async {
                self.status = .success
                self.id = response.data.requestID
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

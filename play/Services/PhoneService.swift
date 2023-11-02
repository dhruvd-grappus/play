//
//  PhoneService.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation

class PhoneService {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func generateOTP(params: GenerateOTPParams) async -> Result<GenerateOTPResponse, Error> {
        do {
            return try await networkManager.post(path: EndPoints.sendOTP, body: params, for: GenerateOTPResponse.self)
        }

        catch {
            return .failure(error)
        }
    }
}

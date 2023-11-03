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

    func generateOTP(params: GenerateOTPParams) async -> Result<GenerateOTPResponse, APIError> {
        do {
            let response = try await networkManager.post(path: EndPoints.sendOTP, body: params)

            switch response {
            case let .success(success):
                let data = success

                return try .success(JSONDecoder().decode(GenerateOTPResponse.self, from: data))

            case let .failure(failure):
                return .failure(failure)
            }
        }

        catch {
            return .failure(APIError.resultError())
        }
    }
}

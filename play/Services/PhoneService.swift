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
            return try await networkManager.post(baseUrl: EndPoints.baseUrl + EndPoints.sendOTP, parameters: params, for: GenerateOTPResponse.self)
        }

        catch {
            return .failure(ServerError.parseError)
        }
    }
//    func verifyPhone(params: VerifyOTPParams) -> Result<UserData, Error>{
//
//        return try networkManager.post(baseUrl: EndPoints.baseUrl, parameters: <#T##Decodable & Encodable#>)
//
//
//
//    }
}

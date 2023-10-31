//
//  GenerateOTP.swift
//  play
//
//  Created by Dhruv on 01/11/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let generateOTPResponse = try? JSONDecoder().decode(GenerateOTPResponse.self, from: jsonData)

struct GenerateOTPParams: Codable {
    let phone: String
}

// MARK: - GenerateOTPResponse

struct GenerateOTPResponse: Codable {
    let data: GenerateOTPData
}

// MARK: - DataClass

struct GenerateOTPData: Codable {
    let requestID, type: String

    enum CodingKeys: String, CodingKey {
        case requestID = "request_id"
        case type
    }
}

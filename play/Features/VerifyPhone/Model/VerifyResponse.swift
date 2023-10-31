//
//  VerifyResponse.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation

struct VerifyOTPParams: Codable {
    let phone: String
    let otp: String
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let validateOTPResponse = try? JSONDecoder().decode(ValidateOTPResponse.self, from: jsonData)

import Foundation

// MARK: - ValidateOTPResponse

struct VerifyResponse: Codable {
    let data: VerifyData
}

// MARK: - DataClass

struct VerifyData: Codable {
    let message, type: String
}

//
//  APIError.swift
//  play
//
//  Created by Dhruv on 02/11/23.
//

import Foundation

enum APIError: Error {
    static let commonErrorDescription = "Something went wrong. Please try again later."

    case cancelled
    case invalidURL
    case noResponse

    case jsonDecodingError(error: Error, data: Data)
    case networkError(error: Error)
    case resultError(message: String = "")
    case jsonEncodeError(error: Error, data: Codable)

    case serverError(code: Int)
}

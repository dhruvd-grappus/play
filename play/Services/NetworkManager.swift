//
//  NetworkManager.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation

enum ServerError: Error {
    case parseError
    case invalidResponse(code: Int)
}

struct NetworkManager {
    func post<P: Codable, T: Codable>(baseUrl: String, parameters: P, for _: T.Type) async throws -> Result<T, Error> {
        let apiUrl = URL(string: baseUrl)!

        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"

        do {
            let jsonData = try JSONEncoder().encode(parameters)
            request.httpBody = jsonData
        } catch {
            throw ServerError.parseError
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw ServerError.parseError
        }
        print(baseUrl + ":" + String(response.statusCode))

        let json = try JSONSerialization.jsonObject(with: data)
        print(json)

        if response.statusCode != 200 {
            throw ServerError.invalidResponse(code: response.statusCode)
        }

        do {
            let data = try JSONDecoder().decode(T.self, from: data)

            return .success(data)
        } catch {
            throw ServerError.parseError
        }
    }
}

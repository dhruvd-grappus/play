//
//  NetworkManager.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()

    init() {}

    private func logRequest(request: URLRequest) {
        print("Request:" + (request.url?.description ?? ""))
        do {
            let json = try JSONSerialization.jsonObject(with: request.httpBody!)
            print("Body:")
            print(json)
        } catch {}

        print("---------")
    }

    private func logResponse(response: HTTPURLResponse, data: Data) {
        print("---------")
        print("Response | " + (response.url?.description ?? "") + " : " + String(response.statusCode))

        do {
            let json = try JSONSerialization.jsonObject(with: data)
            print("Body:")
            print(json)
        } catch {}

        print("---------")
    }

    private func executeRequest(request: inout URLRequest) async throws -> Result<Data, APIError> {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        logRequest(request: request)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            return .failure(APIError.resultError())
        }
        logResponse(response: response, data: data)

        if response.statusCode != 200 {
            return try .failure(APIError.serverError(code: response.statusCode, response: JSONDecoder().decode(ErrorResponse.self, from: data)))
        }
        return .success(data)
    }

    func post<P: Codable>(path: String, body: P) async throws -> Result<Data, APIError> {
        let apiUrl = URL(string: EndPoints.baseUrl + path)!

        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"

        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            return .failure(APIError.jsonEncodeError(error: error, data: body))
        }

        return try await executeRequest(request: &request)
    }

    func get(path: String) async throws -> Result<Data, APIError> {
        let apiUrl = URL(string: path)!

        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"

        return try await executeRequest(request: &request)
    }
}

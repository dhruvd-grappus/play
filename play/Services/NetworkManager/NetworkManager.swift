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

    private func executeRequest<T: Codable>(request: inout URLRequest) async throws -> Result<T, Error> {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        logRequest(request: request)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw APIError.resultError()
        }
        logResponse(response: response, data: data)
        if response.statusCode != 200 {
            throw APIError.serverError(code: response.statusCode)
        }

        do {
            let data = try JSONDecoder().decode(T.self, from: data)

            return .success(data)
        } catch {
            throw APIError.jsonDecodingError(error: error, data: data)
        }
    }

    func post<P: Codable, T: Codable>(path: String, body: P, for _: T.Type) async throws -> Result<T, Error> {
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

    func get<T: Codable>(path: String, for _: T.Type) async throws -> Result<T, Error> {
        let apiUrl = URL(string: path)!

        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"

        return try await executeRequest(request: &request)
    }
}

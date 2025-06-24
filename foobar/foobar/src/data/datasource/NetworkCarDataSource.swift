//
//  NetworkCarDataSource.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import Foundation

actor NetworkCarDataSource: CarDatasource {

    func fetchCars() async throws -> [CarNetwork] {
        let url = URL(string: AppConstants.Network.baseURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = AppConstants.Network.getDefaultHeaders()
        let (data, response) = try await URLSession.shared.data(for: request)

        print("🌎 \(#file) » \(#function) » \(#line)", response, separator: "\n")

        // check response status code
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw AppError.datasource(.networkError("\(statusCode)"))
        }

        // decode json data
        let decoder = JSONDecoder()
        let carResponse: CarNetworkResponse = try decoder.decode(CarNetworkResponse.self, from: data)
        let result = carResponse.cars
        return result
    }
}

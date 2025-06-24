//
//  MockCarDatasource.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import Foundation

actor MockCarDatasource: CarDatasource {
    func fetchCars() async throws -> [CarNetwork] {
        // Simulate a network delay
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second

        // get local json file
        guard let url = Bundle.main.url(forResource: "mockdata", withExtension: "json") else {
            throw AppError.datasource(.fileNotFound)
        }
        // read data from file
        guard let data = try? Data(contentsOf: url) else {
            throw AppError.datasource(.invalidData)
        }
        // decode json data
        let decoder = JSONDecoder()
        let response: CarNetworkResponse = try decoder.decode(CarNetworkResponse.self, from: data)
        let result = response.cars
        return result
    }
}


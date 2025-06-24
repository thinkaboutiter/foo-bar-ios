//
//  MockCarDatasource.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import Foundation

class MockCarDatasource: CarDatasource {
    func fetchCars() async throws -> [CarNetwork] {
        // Simulate a network delay
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second

        // get local json file
        guard let url = Bundle.main.url(forResource: "mockdata", withExtension: "json") else {
            throw MockCarDatasource.Error.fileNotFound
        }
        // read data from file
        guard let data = try? Data(contentsOf: url) else {
            throw MockCarDatasource.Error.invalidData
        }
        // decode json data
        let decoder = JSONDecoder()
        let response: CarNetworkResponse = try decoder.decode(CarNetworkResponse.self, from: data)
        let result = response.cars
        return result
    }
}

extension MockCarDatasource {
    enum Error: Swift.Error, CustomStringConvertible {
        case fileNotFound
        case invalidData

        var description: String {
            switch self {
            case .fileNotFound:
                return "Mock data file not found"
            case .invalidData:
                return "Invalid data format"
            }
        }
    }
}

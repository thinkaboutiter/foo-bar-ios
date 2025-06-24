//
//  CarNetworkResponse.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//

struct CarNetworkResponse: Codable {
    let title: String
    let version: String
    let cars: [CarNetwork]

    enum CodingKeys: String, CodingKey {
        case title
        case version
        case cars = "results"
    }
}


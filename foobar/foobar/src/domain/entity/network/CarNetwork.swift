//
//  CarNetwork.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//

struct CarNetwork: Codable {
    let title: String
    let aboutUrlString: String
    let details: String
    let imageUrlString: String

    enum CodingKeys: String, CodingKey {
        case title
        case aboutUrlString = "href"
        case details = "description"
        case imageUrlString = "thumbnail"
    }
}

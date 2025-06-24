//
//  CarApp.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//

struct CarApp {
    let title: String
    let aboutUrlString: String
    let details: String
    let imageUrlString: String

    init(from carNetwork: CarNetwork) {
        self.title = carNetwork.title
        self.aboutUrlString = carNetwork.aboutUrlString
        self.details = carNetwork.details
        self.imageUrlString = carNetwork.imageUrlString
    }
}

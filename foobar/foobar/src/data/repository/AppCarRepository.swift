//
//  AppCarRepository.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//

actor AppCarRepository: CarRepository {
    private let datasource: CarDatasource
    
    init(datasource: CarDatasource = NetworkCarDataSource()) {
        self.datasource = datasource
    }
    
    func fetchCars() async throws -> [CarApp] {
        let carsNetwork = try await datasource.fetchCars()
        let result = carsNetwork.map { CarApp.init(from: $0) }
        return result
    }
}

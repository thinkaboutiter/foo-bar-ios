//
//  CarRepository.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
protocol CarRepository {
    func fetchCars() async throws -> [CarApp]
}

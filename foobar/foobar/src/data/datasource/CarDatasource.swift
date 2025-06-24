//
//  CarDatasource.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import Foundation

protocol CarDatasource {
    func fetchCars() async throws -> [CarNetwork]
}


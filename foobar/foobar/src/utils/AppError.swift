//
//  AppError.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//

enum AppError: Error, Identifiable, CustomStringConvertible {
    var id: String {
        return description
    }

    var description: String {
        switch self {
        case .datasource(let datasource):
            return "Datasource Error: \(datasource.description)"
        case .unspecified(let message):
            return "Unspecified Error: \(message)"
        }
    }
    case datasource(Datasource)
    case unspecified(String)

}

extension AppError {
    enum Datasource: Swift.Error, CustomStringConvertible {
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


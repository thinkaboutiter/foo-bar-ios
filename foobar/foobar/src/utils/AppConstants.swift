//
//  AppConstants.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import Foundation

enum AppConstants {
    enum Network {
        static let baseURL = "https://gist.githubusercontent.com/Disconnecter/ba9872ace953e382b3497ba358940ca9/raw/90f9f3344b0539a71e7abcb69578c6dadb817a86/gistfile1.txt"
        static let timeoutInterval: TimeInterval = 30.0
        static let maxRetries = 3
        static let retryDelay: TimeInterval = 2.0

        static func getFullURL(for endpoint: String) -> String {
            return "\(baseURL)/\(endpoint)"
        }

        static func getDefaultHeaders() -> [String: String] {
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
}


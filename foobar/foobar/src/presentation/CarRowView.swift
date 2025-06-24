//
//  CarRowView.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import SwiftUI

struct CarRowView: View {
    let car: CarApp
    var body: some View {
        VStack(alignment: .leading) {
            Text(car.title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(car.details)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

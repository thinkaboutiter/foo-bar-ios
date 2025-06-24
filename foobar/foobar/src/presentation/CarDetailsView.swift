//
//  CarDetailsVoew.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import SwiftUI

struct CarDetailsView: View {
    let car: CarApp
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(car.title)
                .font(.largeTitle)
                .padding(.bottom, 5)
            Text(car.details)
                .font(.title2)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
        }
        .padding()
        .navigationTitle("Car Details")
    }
}

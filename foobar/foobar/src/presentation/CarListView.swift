//
//  CarListView.swift
//  foobar
//
//  Created by boyan.yankov on 2025-06-24.
//
import SwiftUI

struct CarListView: View {
    @StateObject private var viewModel = CarListView.ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.cars) { car in
                NavigationLink(destination: CarDetailsView(car: car)) {
                    Text(car.title)
                }
            }
            .navigationTitle("Cars")
            .task {
                await viewModel.fetchCars()
            }
            .alert(item: $viewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
            }
        }
    }
}

extension CarListView {
    class ViewModel: ObservableObject {
        @Published var cars: [CarApp] = []
        @Published var error: AppError?
        private let repository: CarRepository = AppCarRepository()

        @MainActor
        func fetchCars() async {
            do {
                let fetchedCars = try await repository.fetchCars()
                self.cars = fetchedCars
            } catch {
                self.error = error as? AppError ?? AppError.unspecified(error.localizedDescription)
            }
        }
    }
}

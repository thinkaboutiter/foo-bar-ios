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
            ZStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .scaleEffect(1.34)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if viewModel.cars.isEmpty {
                    Text("No cars available. Try again later.")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    List(viewModel.cars) { car in
                        NavigationLink(destination: CarDetailsView(car: car)) {
                            CarRowView(car: car)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 0)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.fetchCars()
                    }
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
        @Published var isLoading: Bool = false
        private let repository: CarRepository = AppCarRepository()

        @MainActor
        func fetchCars() async {
            isLoading = true
            do {
                let fetchedCars = try await repository.fetchCars()
                self.cars = fetchedCars
            } catch {
                self.error = error as? AppError ?? AppError.unspecified(error.localizedDescription)
            }
            isLoading = false
        }
    }
}

#Preview {
    CarListView()
        .environment(\.colorScheme, .light)
}

//
//  ListingView.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//

import SwiftUI

struct ListingView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            }  else {
                List(viewModel.products) { product in
                    NavigationLink(value: product) {
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: product.image)) { phase in
                                if let image = phase.image {
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                } else {
                                    ProgressView().frame(width: 60, height: 60)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(product.title)
                                    .font(.headline)
                                    .lineLimit(2)
                                Text(product.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Products")
        .onAppear {
            viewModel.fetchProducts { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let products):
                        viewModel.products = products
                    case .failure(let error):
                        viewModel.errorMessage = error.localizedDescription
                    }
                }
            }
        }
        
        .navigationDestination(for: ListingModel.self) { product in
            DetailsView(product: product)
        }
    }
}


//
//  DetailsView.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//

import SwiftUI

struct DetailsView: View {
    let product: ListingModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    if let image = phase.image {
                        image.resizable()
                             .scaledToFit()
                             .frame(maxWidth: .infinity)
                             .frame(height: 350)
                             .cornerRadius(12)
                    } else {
                        ProgressView().frame(height: 200)
                    }
                }
                
                Text(product.title)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//
//  ListingViewModel.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//
import Foundation

protocol ProductServiceProtocol {
      func fetchProducts(completion: @escaping (Result<[ListingModel], Error>) -> Void)
 }
//
class ProductViewModel: ObservableObject,ProductServiceProtocol {
    
    @Published var products: [ListingModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    func fetchProducts(completion: @escaping (Result<[ListingModel], any Error>) -> Void) {
        isLoading = true
                  guard let url = URL(string: "https://fakestoreapi.com/products") else {
                      completion(.failure(URLError(.badURL)))
                      return
                  }
                  URLSession.shared.dataTask(with: url) { data, response, error in
                      if let error = error {
                          completion(.failure(error))
                          return
                      }
                      guard let data = data else {
                          completion(.failure(URLError(.badServerResponse)))
                          return
                      }
                      do {
                          let products = try JSONDecoder().decode([ListingModel].self, from: data)
                          DispatchQueue.main.async {
                              self.isLoading = false
                          }
                          completion(.success(products))
                      } catch {
                          completion(.failure(error))
                      }
                  }.resume()
              }
    
}





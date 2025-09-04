//
//  ShirtsViewModel.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

@MainActor
class ShirtsViewModel: ObservableObject {
    
    @Published var httpError: HTTPError?
    @Published var shirts: [Shirt] = shirtList
    @Published var quote: Quote?
    
    private let repository: QuoteRepository
    
    init(repository: QuoteRepository) {
        self.repository = repository
    }
    
    func deleteShirt(shirt: Shirt) {
        shirts.removeAll { $0.id == shirt.id }
    }
    
    func addShirt(title: String, price: Double, size: Size) {
        let newShirt = Shirt(title: title, price: price, size: size)
        shirts.append(newShirt)
    }
    
    func executeFetchQuote() {
        Task {
            do {
                quote = try await repository.getQuotes()
                httpError = nil
            } catch let httpError as HTTPError {
                print("HTTPError while fetching quote: \(httpError.localizedDescription)")
                self.httpError = httpError
            } catch {
                print("Unknown error while fetching quote: \(error.localizedDescription)")
                self.httpError = .unknown(error)
            }
        }
    }
    
}



//
//  LocalQuoteRepository.swift
//  Sylando
//
//  Created by Jeff Braun on 04.09.25.
//

import Foundation

class LocalQuoteRepository: QuoteRepository {
    
    func getQuotes() async throws -> Quote {
        
        guard let quote = quotes.randomElement() else {
            throw QuoteError(reason: "Quotes array was empty")
        }
        
        return quote
    }
}


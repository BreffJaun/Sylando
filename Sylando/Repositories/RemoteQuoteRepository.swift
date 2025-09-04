//
//  QuoteRepository.swift
//  Sylando
//
//  Created by Jeff Braun on 03.09.25.
//

import Foundation

class RemoteQuoteRepository: QuoteRepository {

    func getQuotes() async throws -> Quote {
        let quotes: [Quote] = try await NetworkService.sendData(
            to: URLs.base + URLs.quotes,
            responseType: [Quote].self
        )
        
        guard let randomQuote = quotes.randomElement() else { throw HTTPError.noData }
        
        return randomQuote
    }
}

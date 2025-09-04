//
//  QuoteRepository.swift
//  Sylando
//
//  Created by Jeff Braun on 04.09.25.
//

import Foundation

protocol QuoteRepository {
    func getQuotes() async throws -> Quote
}

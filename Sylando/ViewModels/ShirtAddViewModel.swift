//
//  ShirtAddViewModel.swift
//  Sylando
//
//  Created by Jeff Braun on 02.09.25.
//

import Foundation

@MainActor
class ShirtAddViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var priceText: String = ""
    @Published var selectedSize: Size = .m
    @Published var randomQuote: String? = nil
    
    var isValid: Bool {
        !title.isEmpty &&
        !priceText.isEmpty &&
        Double(priceText.replacingOccurrences(of: ",", with: ".")) != nil
    }
    
    func loadRandomQuote() {
        randomQuote = quotes.randomElement()?.text
    }
    
    func parsePrice() -> Double? {
        Double(priceText.replacingOccurrences(of: ",", with: "."))
    }
    
    func reset() {
        title = ""
        priceText = ""
        selectedSize = .m
    }
}

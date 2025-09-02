//
//  ShirtAddView.swift
//  Sylando
//
//  Created by Jeff Braun on 02.09.25.
//

import SwiftUI

struct ShirtAddView: View {
    
    @EnvironmentObject var shirtsViewModel: ShirtsViewModel
    @StateObject private var shirtAddViewModel = ShirtAddViewModel()
    
    @Binding var showAddShirtSheet: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.65, green: 0.85, blue: 1.0),
                    Color(red: 0.45, green: 0.75, blue: 0.95),
                    Color(red: 0.60, green: 0.55, blue: 0.90)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            
            Form {
                Section {
                    Button {
                        shirtAddViewModel.loadRandomQuote()
                    } label: {
                        VStack(spacing: 12) {
                            ZStack {
                                Image(systemName: "tshirt.fill")
                                    .font(.system(size: 200))
                                    .foregroundColor(.purple.opacity(0.8))
                                
                                if let quote = shirtAddViewModel.randomQuote {
                                    Text(quote)
                                        .font(.headline)
                                        .foregroundColor(.yellow)
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: 150)
                                        .minimumScaleFactor(0.7)
                                    //                                            .border(.red)
                                }
                            }
                            .frame(maxWidth: .infinity, minHeight: 250)
                            
                            // Untertitel mit kleinem Shirt + Text
                            HStack(spacing: 8) {
                                Image(systemName: "tshirt.fill")
                                    .foregroundColor(.purple)
                                Text("Design your own shirt")
                                    .foregroundColor(.purple)
                                    .font(.headline)
                                    .bold()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color(.secondarySystemGroupedBackground))
                }
                
                Section("General") {
                    TextField("Title", text: $shirtAddViewModel.title)
                }
                
                Section("Details") {
                    Picker("Size", selection: $shirtAddViewModel.selectedSize) {
                        ForEach(Size.allCases, id: \.self) { size in
                            Text(size.rawValue.uppercased())
                                .tag(size)
                        }
                    }
                    
                    TextField("Price", text: $shirtAddViewModel.priceText)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Save") {
                        if let price = shirtAddViewModel.parsePrice() {
                            shirtsViewModel.addShirt(
                                title: shirtAddViewModel.title,
                                price: price,
                                size: shirtAddViewModel.selectedSize
                            )
                            showAddShirtSheet = false
                            shirtAddViewModel.reset()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.purple)
                    .disabled(!shirtAddViewModel.isValid)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("New T-Shirt")
    }
}


//#Preview {
//    ShirtAddView()
//}


//TextField("Enter amount", value: $amount, format: .number)
//    .keyboardType(.decimalPad)
//    .environment(\.locale, Locale(identifier: "en_US"))

//let normalized = inputText.replacingOccurrences(of: ",", with: ".")
//let value = Double(normalized)

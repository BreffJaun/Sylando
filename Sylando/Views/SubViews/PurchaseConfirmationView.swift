//
//  PurchaseConfirmationView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct PurchaseConfirmationView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 16) {
                Image(systemName: "cart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.purple)
                    .rotationEffect(.degrees(-15))
                
                Text("Purchased!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: 300, maxHeight: 5400)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(red: 1.0, green: 1.0, blue: 0.6))
                    .shadow(radius: 10)
            )
            .padding(32)
        }
    }
}

#Preview {
    PurchaseConfirmationView()
}

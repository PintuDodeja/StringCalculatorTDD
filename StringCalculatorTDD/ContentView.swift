//
//  ContentView.swift
//  StringCalculatorTDD
//
//  Created by Pintu Dodeja on 04/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @State private var result: String = ""
    
    let calculator = StringCalculator()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("String Calculator")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter numbers...", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Calculate") {
                do {
                    let value = try calculator.add(input)
                    result = "Result: \(value)"
                } catch {
                    result = error.localizedDescription
                }
            }
            .padding()
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(result)
                .padding()
                .foregroundColor(.green)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

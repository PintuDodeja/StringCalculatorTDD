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
    @State private var isError: Bool = false
    @State private var showResult: Bool = false
    @State private var animateButton: Bool = false
    @FocusState private var isFocused: Bool

    let calculator = StringCalculator()

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue.opacity(0.3), .purple.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                if #available(iOS 17.0, *) {
                    Text(StringConstant.title)
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.blue)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                        .onChange(of: input) { _, _ in
                            withAnimation {
                                showResult = false
                            }
                        }
                } else {
                    // Fallback on earlier versions
                    Text(StringConstant.title)
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.blue)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                        .onChange(of: input) { newValue in
                            withAnimation {
                                showResult = false
                            }
                        }
                }

                TextField(StringConstant.exampleInput, text: $input)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .keyboardType(.numbersAndPunctuation)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        calculate()
                    }

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        animateButton.toggle()
                    }

                    calculate()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            animateButton = false
                        }
                    }
                }) {
                    Text(StringConstant.calculate)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .background(animateButton ? Color.green.opacity(0.7) : Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(12)
                        .scaleEffect(animateButton ? 1.05 : 1.0)
                        .shadow(radius: 5)
                }

                if showResult {
                    Text(result)
                        .padding()
                        .background(isError ? Color.red.opacity(0.1) : Color.green.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(isError ? .red : .green)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.combined(with: .scale))
                        .animation(.spring(), value: showResult)
                }

                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            isFocused = false
        }
    }

    private func calculate() {
        withAnimation {
            showResult = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            do {
                let value = try calculator.add(input)
                result = "\(StringConstant.result): \(value)"
                isError = false
            } catch {
                result = error.localizedDescription
                isError = true
            }

            withAnimation {
                showResult = true
            }
        }
    }

}

#Preview {
    ContentView()
}

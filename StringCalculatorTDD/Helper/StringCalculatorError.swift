//
//  StringCalculatorError.swift
//  StringCalculatorTDD
//
//  Created by Pintu Dodeja on 04/07/25.
//


import Foundation

enum StringCalculatorError: Error, LocalizedError {
    case negativeNumbersNotAllowed([Int])

    var errorDescription: String? {
        switch self {
        case .negativeNumbersNotAllowed(let numbers):
            return "Negative numbers not allowed: \(numbers.map(String.init).joined(separator: ","))"
        }
    }
}

class StringCalculator {
    
    func add(_ numbers: String) throws -> Int {
        let sanitizedInput = numbers
            .replacingOccurrences(of: "\\n", with: "\n")   // fixes literal "\n"
            .replacingOccurrences(of: "\r\n", with: "\n")  // Windows-style newlines
            .replacingOccurrences(of: "\r", with: "\n")    // Mac-style carriage return
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !sanitizedInput.isEmpty else { return 0 }

        var delimiters = [",", "\n"]
        var numbersSection = sanitizedInput
        
        print("Numbers ->", numbersSection)
        
        if sanitizedInput.hasPrefix("//") {
            let delimiterEndIndex = sanitizedInput.range(of: "\n")!.lowerBound
            let delimiterSection = String(sanitizedInput[sanitizedInput.index(sanitizedInput.startIndex, offsetBy: 2)..<delimiterEndIndex])
            numbersSection = String(sanitizedInput[sanitizedInput.index(after: delimiterEndIndex)...])

            let pattern = #"\[(.*?)\]"#
            if let regex = try? NSRegularExpression(pattern: pattern) {
                let matches = regex.matches(in: delimiterSection, range: NSRange(location: 0, length: delimiterSection.utf16.count))
                if matches.isEmpty {
                    delimiters = [delimiterSection]
                } else {
                    delimiters = matches.compactMap {
                        if let range = Range($0.range(at: 1), in: delimiterSection) {
                            return String(delimiterSection[range])
                        }
                        return nil
                    }
                }
            }
        }

        let pattern = delimiters.map { NSRegularExpression.escapedPattern(for: $0) }.joined(separator: "|")
        let regex = try! NSRegularExpression(pattern: pattern)
        let replaced = regex.stringByReplacingMatches(in: numbersSection, range: NSRange(numbersSection.startIndex..., in: numbersSection), withTemplate: ",")
        let values = replaced.components(separatedBy: ",").compactMap { Int($0) }

        let negatives = values.filter { $0 < 0 }
        if !negatives.isEmpty {
            throw StringCalculatorError.negativeNumbersNotAllowed(negatives)
        }

        return values.reduce(0, +)
    }
}

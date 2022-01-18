//
//  Double.swift
//  CoinApp
//
//  Created by Davron Usmanov on 09/01/22.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency with 2 decimal places
    ///```
    ///Convert 1234.56 to $1.234.56
    ///```
    
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//      formatter.locale = .current
//      formatter.currencyCode = "usd"
//      formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 decimal places
    ///```
    ///Convert 1234.56 to "$1.234.56"
    ///```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.000"
    }
    
    /// Converts a Double into a Currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1.234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//      formatter.locale = .current
//      formatter.currencyCode = "usd"
//      formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1.234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWithDecimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.000"
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    ///```
    ///Convert 1.23456 to "1.23"
    ///```
    func asNumerString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    ///```
    ///Convert 1.23456 to "1.23%"
    ///```
    func asPercentString() -> String {
        return asNumerString() + "%"
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumerString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumerString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumerString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumerString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumerString()

        default:
            return "\(sign)\(self)"
        }
    }

}


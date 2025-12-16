//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 16/12/25.
//

import Foundation

extension Double{
    
    // converts a double into a currency with 2 decimal place
    /// ```
    /// convert 1234.56 to $1,234.56
    /// ```
    private var currentcyFormatter2:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current //<- default value
        formatter.currencyCode = "USD" // <- change currency
        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrencyWith2Decimals()->String{
        let number = NSNumber(value:self)
        return currentcyFormatter2.string(from:number) ?? "$0.00"
    }
    
    
    // converts a double into a currency with 2-6 decimal place
    /// ```
    /// convert 1234.56 to $1,234.56
    /// convert 12.3456 to $12.3456
    /// convert 0.123456 to $0.123456
    /// ```
    private var currentcyFormatter6:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current //<- default value
        formatter.currencyCode = "USD" // <- change currency
        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimals()->String{
        let number = NSNumber(value:self)
        return currentcyFormatter6.string(from:number) ?? "$0.00"
    }
    
    
    // converts a double into string representation
    /// ```
    /// convert 1.2345 to "1.23"
    /// ```
    func asNumberString()->String{
        return String(format: "%.2f",self)
    }
    
    
    // converts a double into string representation with percent symbol
    /// ```
    /// convert 1.2345 to "1.23%"
    /// ```
    func asPercentString()->String{
        return asNumberString() + "%"
    }
}

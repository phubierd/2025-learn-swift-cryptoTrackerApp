//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 17/12/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:nil, for: nil)
    }
}

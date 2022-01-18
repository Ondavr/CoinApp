//
//  UIApplication.swift
//  CoinApp
//
//  Created by Davron Usmanov on 11/01/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    
}

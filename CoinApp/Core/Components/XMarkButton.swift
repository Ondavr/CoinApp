//
//  XMarkButton.swift
//  CoinApp
//
//  Created by Davron Usmanov on 13/01/22.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentasionMode

    var body: some View {
        
        Button(action: {
            presentasionMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}


struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
           
    }
}

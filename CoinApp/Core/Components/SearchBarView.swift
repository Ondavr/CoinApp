//
//  SearchBarView.swift
//  CoinApp
//
//  Created by Davron Usmanov on 11/01/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var textFieldText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(textFieldText.isEmpty ?
                                 Color.theme.secondaryText : Color.theme.accent)
            
            TextField("Search by name or symbol...", text: $textFieldText)
                .foregroundColor(Color.theme.secondaryText)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(textFieldText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            textFieldText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.theme.background)
            .shadow(color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(textFieldText: .constant(""))
            .preferredColorScheme(.dark)
    }
}

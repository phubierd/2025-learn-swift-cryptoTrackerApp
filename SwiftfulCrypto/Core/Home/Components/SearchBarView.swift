//
//  SearchBarView.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 16/12/25.
//

import SwiftUI

struct SearchBarView: View {

    @Binding var searchText:String
    @FocusState private var isTextFieldFocused: Bool?
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            TextField("Search by name or symbol...",text:$searchText)
                .foregroundStyle(Color.theme.accent)
                .autocorrectionDisabled()
                .focused($isTextFieldFocused, equals: true)
                .overlay (alignment:.trailing){
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:10)
                        .foregroundStyle(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
//                            UIApplication.shared.endEditing()
                            isTextFieldFocused = nil
                            searchText = ""
                        }
                }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color:Color.theme.accent.opacity(0.15),
                    radius: 10,x:0,y:0
                )
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}

//
//  NavigationBar.swift
//  CodexPlus
//
//  Created by ana on 08/09/25.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        HStack {
            Image("Logotipo_g1")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.horizontal, 10)
            Spacer()
            
            Button (action : {
                print("Facoritos")
            }) {
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
                
            }
            
            Button (action : {
                print("Pesquisa")
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
                    .padding(.horizontal, 10)
            }
        }
    }
}
#Preview {
    Navigation()
}

//
//  NavigationBar.swift
//  CodexPlus
//
//  Created by ana on 08/09/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Image("Logotipo_g1")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
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
            }
            }
        }
    }
#Preview {
    NavigationBar()
}

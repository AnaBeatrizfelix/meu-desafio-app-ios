//
//  MenuRowView.swift
//  CodexPlus
//
//  Created by ana on 16/09/25.
//

import SwiftUI

struct MenuRowView: View {
    let title: String
    let url: URL
    
    var body: some View {
        LinkRowView(url: url) {
            Text(title.capitalized)
                .font(.headline)
                .padding()
                .foregroundColor(.red)
        }
    }
}

#Preview {
    NavigationStack{
        MenuRowView( title: "Economia",
                     url: URL(string: "https://g1.globo.com/economia")!
        )
        .padding()
    }
   
}

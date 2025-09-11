//
//  LinkRowView.swift
//  CodexPlus
//
//  Created by ana on 11/09/25.
//

import SwiftUI

struct LinkRowView: View {
    let title: String
    let url: URL
    
    var body: some View {
        Link(destination: url) {
            Text(title.capitalized)
                .font(.headline)
                .padding(.vertical, 4)
        }
    }
}

#Preview {
    LinkRowView(
        title: "G1"
        , url: URL(string: "https://www.g1.com")!
    )
}

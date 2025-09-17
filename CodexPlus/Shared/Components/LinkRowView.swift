//
//  LinkRowView.swift
//  CodexPlus
//
//  Created by ana on 11/09/25.
//

import SwiftUI

struct LinkRowView<Content:  View>: View {
    let url: URL
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        NavigationLink(destination: WebView(url: url)) {
          content()
        }
        .buttonStyle(.plain)
            }
        }

#Preview {
    NavigationStack {
           LinkRowView(url: URL(string: "https://www.g1.com")!) {
               Text("G1")
                   .font(.headline)
                   .padding()
                   .frame(maxWidth: .infinity, alignment: .leading)
                   .background(Color(.systemGray6))
                   .cornerRadius(8)
           }
           .padding()
       }
   }

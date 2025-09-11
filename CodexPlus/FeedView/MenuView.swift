//
//  MenuView.swift
//  CodexPlus
//
//  Created by ana on 10/09/25.
//

import SwiftUI

struct MenuView: View {
    @State private var items: [MenuItem] = []
    @State private var isLoading = false
    @State private var errorText: String?
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                if isLoading && items.isEmpty {
                    ProgressView()
                } else if let errorText = errorText {
                    VStack(spacing: 12) {
                        Text("Erro ao carregar menu")
                            .font(.headline)
                        Text(errorText)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Button("Tentar novamente") {
                            loadMenu()
                            
                        }
                    }
                    .padding()
                } else {
                    List(items, id: \.url) { item in
                        if let url = URL(string: item.url) {
                            Link(destination: url) {
                                Text(item.title.capitalized)
                                    .font(.headline)
                                    .padding(.vertical, 4)
                            }
                            
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }.tint(.red)
        }
        .onAppear{
            loadMenu()
        }
    }
        
    private func loadMenu() {
        
        do{
            items = try MenuLoader.load()
            errorText = nil
        } catch {
            errorText = "\(error.localizedDescription)"
            
        }
    }
}

#Preview {
    MenuView()
}

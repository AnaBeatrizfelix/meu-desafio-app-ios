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
                } else if let errorText {
                    ErroView (errorText: errorText,
                              retryAction: {loadMenu()}
                    )
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

import SwiftUI

struct ContentView: View {
    @State private var feedItems: [NewsLetter] = []
    @State private var isLoading = false
    @State private var errorText: String?
    
    private let service = HomeService()
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoading && feedItems.isEmpty {
                    ProgressView()
                } else if let errorText {
                    VStack(spacing: 12) {
                        Text("Erro ao carregar feed")
                            .font(.headline)
                        Text(errorText)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Button("Tentar novamente") {
                            Task { await loadFeed() }
                        }
                    }
                    .padding(.top, 50)
                } else {
                    NavigationBar()
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 16) {
                            ForEach(feedItems, id: \.idValue) { item in
                                if let link = item.content?.url,
                                   let url = URL(string: link.replacingOccurrences(of: "http://", with: "https://")) {
                                    Link(destination: url) {
                                        ModelFeedItem(item: item)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                ButtonBar()
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .task { await loadFeed() }
    }
    
    private func loadFeed() async {
        isLoading = true
        errorText = nil
        defer { isLoading = false }
        
        do {
            feedItems = try await service.fetchFeed()
        } catch {
            errorText = "Erro: \(error.localizedDescription)"
        }
    }
}

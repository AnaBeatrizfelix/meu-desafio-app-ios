import SwiftUI

struct AgronegociosView: View {
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
                    ErroView (errorText: errorText,
                              retryAction: {
                        Task { await loadFeed() }
                    }
                    )
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
                    .refreshable {
                        await loadFeed()
                    }
                }
                
            }
            
        }
        .task { await loadFeed() }
    }
    
    private func loadFeed() async {
        isLoading = true
        errorText = nil
        defer { isLoading = false }
        
        do {
            let newItems = try await service.fetchFeed(.agronegocios)
            if !newItems.isEmpty {
                feedItems = newItems
            }
        } catch {
            if (error as? URLError)?.code == .cancelled {
                return
            }
            errorText = "Erro: \(error.localizedDescription)"
        }
    }
}
#Preview {
    AgronegociosView()
}

import SwiftUI

struct ContentView: View {
    @State private var feedItems: [NewsLetter] = []
    @State private var isLoading = false
    @State private var errorText: String?
    
    private let service = HomeService()
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading && feedItems.isEmpty {
                    ProgressView()
                } else if let errorText {
                    ErroView (errorText: errorText){
                        Task { await loadFeed() }
                    }
                    
                } else {
                    NavigationBar()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 16) {
                            ForEach(feedItems, id: \.idValue) { item in
                                NewsRowView(item: item)
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
            let newItems = try await service.fetchFeed(.g1)
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
ContentView()
}

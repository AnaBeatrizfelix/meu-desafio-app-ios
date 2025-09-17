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
                            MenuRowView(title: item.title, url: url)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
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

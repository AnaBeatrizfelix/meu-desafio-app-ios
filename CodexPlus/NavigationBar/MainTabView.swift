import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            Text("")
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        
                        Text("home")
                        
                    }
                }
                .onAppear {selectedTab = 0 }
                .tag(0)
            
            Text("")
                .tabItem {
                    VStack {
                        Image(systemName:selectedTab == 1 ? "leaf.fill" : "leaf")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Agronegócios")
                                            
                    }
                }
                .onAppear {selectedTab = 1 }
                .tag(1)
            
            Text("")
                .tabItem {
                    VStack {
                        Image(systemName:selectedTab == 2 ?  "line.3.horizontal.fill" : "line.3.horizontal")
                            .environment( \.symbolVariants, selectedTab == 2 ? .fill : .none)
                        Text("Menu")
                    }
                    
                }
                .onAppear {selectedTab = 2 }
                .tag(2)
        }
        .tint(.red)
    }
}

#Preview {
    MainTabView()
}

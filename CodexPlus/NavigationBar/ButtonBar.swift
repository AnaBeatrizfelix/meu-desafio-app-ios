import SwiftUI

struct ButtonBar: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house")
                Text("Home")
                    .font(.caption)
            }
            Spacer()
            VStack {
                Image(systemName: "video")
                Text("Vídeo")
                    .font(.caption)
            }
            Spacer()
            VStack {
                Image(systemName: "gamecontroller")
                Text("Jogos")
                    .font(.caption)
            }
            Spacer()
            VStack {
                Image(systemName: "line.3.horizontal.decrease")
                Text("Mais")
                    .font(.caption)
            }
            Spacer()
        }
        .padding(.vertical, 6)
        .padding(.bottom, 12)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .shadow(radius: 2)
    }
}

#Preview {
    ButtonBar()
}

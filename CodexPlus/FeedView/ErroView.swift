//
//  ErroView.swift
//  CodexPlus
//
//  Created by ana on 11/09/25.
//

import SwiftUI

struct ErroView: View {
    
    let errorText: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Erro ao carregar feed")
                .font(.headline)
            Text(errorText)
                .font(.footnote)
                .foregroundColor(.secondary)
            Button("Tentar novamente") {
                retryAction()
            
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    ErroView(errorText: ""){
        print("Button acionado")
    }
}

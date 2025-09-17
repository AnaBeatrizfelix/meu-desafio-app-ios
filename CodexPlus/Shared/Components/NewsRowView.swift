//
//  NewsRowView.swift
//  CodexPlus
//
//  Created by ana on 11/09/25.
//

import SwiftUI

struct NewsRowView: View {
    let item: NewsLetter
    
    var body: some View {
        if let link = item.content?.url,
           let url = URL(string: link.replacingOccurrences(of: "http://", with: "https://")) {
            LinkRowView(url: url){
                ModelFeedItem(item: item)
            }
            .buttonStyle(.plain)
        }
    }
}
#Preview {
    NewsRowView(item: itemMock)
}

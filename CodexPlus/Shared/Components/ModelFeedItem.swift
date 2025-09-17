//
//  ModelFeedItem.swift
//  CodexPlus
//
//  Created by ana on 09/09/25.
//

import SwiftUI

struct ModelFeedItem: View {
    let item: NewsLetter
    

    private var bestImageURL: URL? {
        if let sizes = item.content?.image?.sizes {
            if let l = sizes.L?.url, let url = URL(string: l) { return url }
            if let m = sizes.M?.url, let url = URL(string: m) { return url }
            if let s = sizes.S?.url, let url = URL(string: s) { return url }
            if let direct = sizes.url, let url = URL(string: direct) { return url }
        }
        return nil
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
          
            if let chapeu = item.content?.chapeu?.label {
                Text(chapeu.uppercased())
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
            
         
            if let title = item.content?.title {
                Text(title)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
            }
            
         
            if let url = bestImageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
                .padding(.horizontal)
            }
            
          
            if let summary = item.content?.summary {
                Text(summary)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            
       
            if let metadata = item.metadata {
                Text(metadata)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            
            Divider()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ModelFeedItem(item: itemMock)
     
}


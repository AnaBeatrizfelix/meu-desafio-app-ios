//
//  FeedItemMock.swift
//  CodexPlus
//
//  Created by ana on 09/09/25.
//

import Foundation

var itemMock: NewsLetter {
    NewsLetter(
    id: "1",
    type: "materia",
    content: NewsLetterContent(
        chapeu: ContentLabel(label: "Política"),
        image: NewsImage(
            sizes: Sizes(
                L: FeedImage(url: "https://via.placeholder.com/1080x608", height: 608, width: 1080),
                M: nil, S: nil, url: nil
            )
        ),
        summary: "Resumo de exemplo da notícia.",
        title: "Título de exemplo",
        url: "https://g1.globo.com",
        video: nil
    ),
    metadata: "Há 2 horas — Em Política",
    lastPublication: nil
)
}

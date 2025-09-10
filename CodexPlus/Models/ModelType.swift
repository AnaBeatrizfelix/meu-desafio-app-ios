//
//  Models.swift
//  CodexPlus
//
//  Created by ana on 09/09/25.
//

import Foundation

struct FeedResponse: Codable {
    let resource: Resource
    let content_type: ContentType?
    let feed: Feed
}

struct Resource: Codable {
    let title: String?
    let description: String?
}


struct ContentType: Codable {
    let api: String?
    let name: String?
}


struct Feed: Codable {
    let falkor: Falkor?
}

struct Falkor: Codable {
    let items: [NewsLetter]?
}

struct NewsLetter: Codable, Identifiable {
    let id: String?
    let type: String?
    let content: NewsLetterContent?
    let metadata: String?
    let lastPublication: String?
    
    var idValue: String { id ?? UUID().uuidString }
}

struct NewsLetterContent: Codable {
    let chapeu: ContentLabel?
    let image: NewsImage?
    let summary: String?
    let title: String?
    let url: String?
    let video: VideoContent?
}

struct ContentLabel: Codable {
    let label: String?
}


struct NewsImage: Codable {
    let sizes: Sizes?
}

struct Sizes: Codable {
    let L: FeedImage?
    let M: FeedImage?
    let S: FeedImage?
    let url: String?
}

struct FeedImage: Codable {
    let url: String?
    let height: Int?
    let width: Int?
}


struct VideoContent: Codable {
    let url: String?
    let title: String?
    let thumbnail: String?
}

struct IdentifiableURL: Identifiable {
    let id = UUID()
    let url: URL
}

//
//  HomeService.swift
//  CodexPlus
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case requestFailed(String)
    case decodeFailed
    case emptyData
}

struct HomeService {
    private let feedURL = "https://native-leon.globo.com/feed/g1"
    
    func fetchFeed() async throws -> [NewsLetter] {
        guard let url = URL(string: feedURL) else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            guard !data.isEmpty else {
                throw RequestError.emptyData
            }
            
            let decoded = try JSONDecoder().decode(FeedResponse.self, from: data)
            let items = decoded.feed.falkor?.items ?? []
            
            return items.filter { $0.type == "materia" || $0.type == "basico" }
        } catch _ as DecodingError {
            throw RequestError.decodeFailed
        } catch {
            throw RequestError.requestFailed(error.localizedDescription)
        }
    }
}

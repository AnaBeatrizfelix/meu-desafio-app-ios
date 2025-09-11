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

extension RequestError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .requestFailed(let message):
            return "Falha na conexão: \(message)"
        case .decodeFailed:
            return "Erro ao processar os dados recebidos."
        case .emptyData:
            return "Nenhum notícia encontrada"
        }
    }
}

struct HomeService {
  
    func fetchFeed(_ feed: FeedMenuBarItem) async throws -> [NewsLetter] {
        guard let url = URL(string: feed.url) else {
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
        } catch let urlError as URLError  where urlError.code == .cancelled {
            return[]
        } catch {
            throw RequestError.requestFailed(error.localizedDescription)
        }
    }
}

import Foundation

struct MenuLoader {
    static func load(filename: String = "menu") throws -> [MenuItem] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Arquivo não localizado")
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let payload = try decoder.decode(MenuPayload.self, from: data)
            return payload.menuItems
        } catch {
            print("Erro ao ler ou decodificar o JSON: \(error)")
            return []
        }
    }
}

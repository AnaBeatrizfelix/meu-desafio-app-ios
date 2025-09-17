import Foundation

enum FeedMenuBarItem: String {
    case g1
    case agronegocios
    
    var url: String{
        switch self {
        case .g1:
            return "https://native-leon.globo.com/feed/g1"
        case .agronegocios:
            return "https://native-leon.globo.com/feed/https://g1.globo.com/economia/agronegocios"
        }
    }
}

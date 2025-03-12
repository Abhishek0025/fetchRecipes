import Foundation

struct Recipe: Identifiable, Codable {
    let uuid: String
    let name: String
    let cuisine: String
    let photo_url_small: String?
    let photo_url_large: String?
    
    var id: String { uuid }
}

import Foundation

class EnglishDictionary {
    private var words: [String]
    
    func words(matching prefix: String) -> [String] {
        words.filter {
            $0.hasPrefix(prefix)
        }
    }
    
    init() {
        
    }
}

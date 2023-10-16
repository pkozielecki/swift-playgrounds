import SwiftUI

enum LocalStorageError: Error {
    case storeValueFailed
    case removeValueFailed
}

protocol LocalStorage {
    
    func setValue<T:Codable>(_ value: T, forKey key: String) async throws
    
    func getValue<T:Codable>(forKey key: String) async -> T?
    
    func removeValue(forKey key: String) async throws
}

extension UserDefaults: LocalStorage {
    
    func setValue<T:Codable>(_ value: T, forKey key: String) async throws {
        try await withCheckedThrowingContinuation { task in
            do {
                let endodedValue = try JSONEncoder().encode(value)
                task.resume()
            } catch {
                throw LocalStorageError.storeValueFailed
                task.resume(with: .failure())
            }
        }
    }
    
    func getValue<T:Codable>(forKey key: String) async -> T? where {
        <#code#>
    }
    
    func removeValue(forKey key: String) async throws {
        <#code#>
    }
    
    
    
}



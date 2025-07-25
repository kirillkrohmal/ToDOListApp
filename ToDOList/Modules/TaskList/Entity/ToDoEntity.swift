import Foundation
import CoreData

struct TodoListResponse: Codable {
    let todos: [TodoItem]
}

struct TodoItem: Codable, Identifiable {
    let id: UUID?
    let userId: id
    let completed: Bool
    let toDo: String
    let createdAt: Date
    
}

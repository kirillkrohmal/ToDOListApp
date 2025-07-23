import Foundation
import CoreData

struct TodoListResponse: Codable {
    let todos: [TodoItem]
}

struct TodoItem: Codable, Identifiable {
    let id: UUID?
    let title: String
    let IsDone: Bool?
}

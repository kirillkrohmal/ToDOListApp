import Foundation
import CoreData

protocol TaskListInteractorProtocol {
    func loadTodosIfNeeded()
}

final class TaskListInteractor: TaskListInteractorProtocol {
    private let context = CoreDataStack.shared.context
    private let userDefaultsKey = "isInitialDataLoaded"

    func loadTodosIfNeeded() {
        let alreadyLoaded = UserDefaults.standard.bool(forKey: userDefaultsKey)
        guard !alreadyLoaded else {
            print("📦 Данные уже были загружены")
            return
        }

        DispatchQueue.global(qos: .userInitiated).async {
            NetworkService.shared.fetchTodos { result in
                switch result {
                case .success(let todos):
                    self.saveToCoreData(todos: todos)
                    UserDefaults.standard.set(true, forKey: self.userDefaultsKey)
                case .failure(let error):
                    print("❌ Ошибка загрузки: \(error)")
                }
            }
        }
    }

    private func saveToCoreData(todos: [TodoItem]) {
        let context = CoreDataStack.shared.context

        todos.forEach { item in
            let entity = ToDoEntity(context :context)
            entity.id = UUID()
            entity.isDone = Bool(item.completed)
            entity.title = String()
        }

        CoreDataStack.shared.saveContext()

        DispatchQueue.main.async {
            print("✅ Загружено и сохранено \(todos.count) задач")
        }
    }
}

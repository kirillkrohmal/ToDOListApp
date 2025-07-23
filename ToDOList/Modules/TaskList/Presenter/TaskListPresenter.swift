import Foundation
import CoreData

protocol TaskListPresenterProtocol: ObservableObject {
    var task: [ToDoEntity] { get }
    func fetchTasks()
}

final class TaskListPresenter: TaskListPresenterProtocol {
    @Published var task: [ToDoEntity] = []
    private let context = CoreDataStack.shared.context

    func fetchTasks() {
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        do {
            taskEntity = try context.fetch(request)
        } catch {
            print("❌ Ошибка загрузки задач: \(error)")
        }
    }
}

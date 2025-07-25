import SwiftUI
import CoreData

struct TaskDetailView: View {
    @Environment(\.presentationMode) var presentationMode

    let task: ToDoEntity?

    @State private var title: String
    @State private var isCompleted: Bool

    init(task: ToDoEntity?) {
        self.task = task
        _title = State(initialValue: task?.title ?? "")
        _isCompleted = State(initialValue: task?.completed ?? false)
    }

    var body: some View {
        Form {
            Section(header: Text("Название")) {
                TextField("Введите задачу", text: $title)
            }

            Toggle("Выполнено", isOn: $isCompleted)

            Button("Сохранить") {
                saveTask()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle(task == nil ? "Новая задача" : "Редактирование")
    }

    private func saveTask() {
        let context = CoreDataStack.shared.context
        let entity = task ?? ToDoEntity(context: context)
        entity.todo = toDo
        entity.completed = isCompleted
        entity.createdAt = entity.createdAt ?? Date()
        entity.id = entity.id == 0 ? Int64(Date().timeIntervalSince1970) : entity.id
        entity.userId = entity.userId
        CoreDataStack.shared.saveContext()
    }
}

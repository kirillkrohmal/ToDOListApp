import SwiftUI

final class TaskListRouter {
    static func makeDetailView(for task: ToDoEntity?) -> some View {
        TaskDetailView(task: task)
    }
}
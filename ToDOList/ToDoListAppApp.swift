import SwiftUI

@main
struct ToDoListAppApp: App {
    let interactor = TaskListInteractor()

    init() {
        interactor.loadTodosIfNeeded()
    }

    var body: some Scene {
        WindowGroup {
            TaskListView() 
        }
    }
}

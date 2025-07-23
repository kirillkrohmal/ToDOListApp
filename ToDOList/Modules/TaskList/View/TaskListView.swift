// updated to support navigation
import SwiftUI
import CoreData


struct TaskListView: View {
    @StateObject private var presenter = TaskListPresenter()
    @State private var showAdd = false

    var body: some View {
        NavigationView {
            List {
                ForEach(presenter.tasks, id: \.objectID) { task in
                    NavigationLink(destination: TaskListRouter.makeDetailView(for: task)) {
                        TaskRowView(task: task)
                    }
                }
            }
            .navigationTitle("Задачи")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAdd = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAdd) {
                TaskListRouter.makeDetailView(for: nil)
            }
            .onAppear {
                presenter.fetchTasks()
            }
        }
    }
}

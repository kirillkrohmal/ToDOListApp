import SwiftUI
import CoreData

struct TaskRowView: View {
    let task: ToDoEntity
    
    var body: some View {
        HStack {
            Image(systemName: task.title ? "checkmark.circle.fill" : "circle")
                .foregroundColor(taskEntity.completed ? .green : .gray)
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                if let date = task.createdAt {
                    Text(date, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

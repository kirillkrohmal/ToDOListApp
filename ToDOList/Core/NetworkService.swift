import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private init() {}

    func fetchTodos(completion: @escaping (Result<[TodoItem], Error>) -> Void) {
        guard let url = URL(string: "https://json.com/todos") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(NSError(domain: "No data", code: 0))) }
                return
            }

            do {
                let decoded = try JSONDecoder().decode(TodoListResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded.todos))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

import Foundation
import Combine

class PostViewModel: ObservableObject {
    private let apiService = APIService()
    
    @Published var posts: [Post] = []
    
    func loadPosts() {
        apiService.fetchPosts { [weak self] data in
            DispatchQueue.main.async {
                self?.posts = data ?? []
            }
        }
    }
}
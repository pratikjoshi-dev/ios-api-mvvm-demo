import Foundation

class APIService {
    func fetchPosts(completion: @escaping ([Post]?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let posts = try? JSONDecoder().decode([Post].self, from: data)
                completion(posts)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
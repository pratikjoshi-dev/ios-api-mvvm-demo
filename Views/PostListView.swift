import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        List(viewModel.posts, id: \.id) { post in
            Text(post.title)
        }
        .onAppear {
            viewModel.loadPosts()
        }
    }
}
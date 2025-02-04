//
//  ViewModel.swift
//  MasteringAPIcallUsingAlamofire
//
//  Created by Tech Exactly iPhone 6 on 04/02/25.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchPosts()
    }

    // Fetch Posts
    func fetchPosts() {
        APIService.shared.fetchPosts { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.posts = posts
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    // Create Post
    func createPost(title: String, body: String) {
        APIService.shared.createPost(title: title, body: body) { result in
            switch result {
            case .success(let newPost):
                DispatchQueue.main.async {
                    self.posts.append(newPost)
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    // Update Post
    func updatePost(postId: Int, title: String, body: String) {
        APIService.shared.updatePost(postId: postId, title: title, body: body) { result in
            switch result {
            case .success(let updatedPost):
                DispatchQueue.main.async {
                    if let index = self.posts.firstIndex(where: { $0.id == postId }) {
                        self.posts[index] = updatedPost
                    }
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    // Delete Post
    func deletePost(postId: Int) {
        APIService.shared.deletePost(postId: postId) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.posts.removeAll { $0.id == postId }
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}


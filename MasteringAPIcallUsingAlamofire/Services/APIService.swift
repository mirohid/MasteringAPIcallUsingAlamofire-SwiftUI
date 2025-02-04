//
//  APIService.swift
//  MasteringAPIcallUsingAlamofire
//
//  Created by Tech Exactly iPhone 6 on 04/02/25.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService() // Singleton instance
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    // Fetch all posts (GET)
    func fetchPosts(completion: @escaping (Result<[Post], AFError>) -> Void) {
        AF.request(baseURL, method: .get)
            .validate()
            .responseDecodable(of: [Post].self) { response in
                completion(response.result)
            }
    }

    // Create a new post (POST)
    func createPost(title: String, body: String, completion: @escaping (Result<Post, AFError>) -> Void) {
        let parameters: [String: Any] = ["title": title, "body": body, "userId": 1]
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self) { response in
                completion(response.result)
            }
    }

    // Update an existing post (PUT)
    func updatePost(postId: Int, title: String, body: String, completion: @escaping (Result<Post, AFError>) -> Void) {
        let url = "\(baseURL)/\(postId)"
        let parameters: [String: Any] = ["title": title, "body": body, "userId": 1]
        
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self) { response in
                completion(response.result)
            }
    }

    // Delete a post (DELETE)
    func deletePost(postId: Int, completion: @escaping (Result<Void, AFError>) -> Void) {
        let url = "\(baseURL)/\(postId)"
        
        AF.request(url, method: .delete)
            .validate()
            .response { response in
                completion(response.result.map { _ in })
            }
    }
}


////
////  ListView.swift
////  MasteringAPIcallUsingAlamofire
////
////  Created by Tech Exactly iPhone 6 on 04/02/25.
////
//
//import SwiftUI
//
//struct PostListView: View {
//    @StateObject var viewModel = PostViewModel()
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(viewModel.posts) { post in
//                    NavigationLink(destination: UpdatePostView(post: post, viewModel: viewModel)) {
//                        VStack(alignment: .leading) {
//                            Text(post.title)
//                                .font(.headline)
//                            Text(post.body)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                }
//                .onDelete(perform: deletePost)
//            }
//            .navigationTitle("Posts")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: AddPostView(viewModel: viewModel)) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.title)
//                    }
//                }
//            }
//            .onAppear {
//                viewModel.fetchPosts()
//            }
//        }
//    }
//
//    private func deletePost(at offsets: IndexSet) {
//        for index in offsets {
//            let post = viewModel.posts[index]
//            viewModel.deletePost(postId: post.id)
//        }
//    }
//}
//
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}

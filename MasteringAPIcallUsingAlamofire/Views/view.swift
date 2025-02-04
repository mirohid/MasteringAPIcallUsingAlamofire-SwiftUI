//
//  view.swift
//  MasteringAPIcallUsingAlamofire
//
//  Created by Tech Exactly iPhone 6 on 04/02/25.
//

import SwiftUI

struct PostView: View {
    @StateObject var viewModel = PostViewModel()
    @State private var isAddingPost = false
    @State private var editingPost: Post?

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        editingPost = post
                    }
                }
                .onDelete(perform: deletePost)
            }
            .navigationTitle("Posts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isAddingPost = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            .onAppear {
                viewModel.fetchPosts()
            }
            .sheet(isPresented: $isAddingPost) {
                AddEditPostView(viewModel: viewModel)
            }
            .sheet(item: $editingPost) { post in
                AddEditPostView(viewModel: viewModel, post: post)
            }
        }
    }

    private func deletePost(at offsets: IndexSet) {
        for index in offsets {
            let post = viewModel.posts[index]
            viewModel.deletePost(postId: post.id)
        }
    }
}

struct AddEditPostView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String
    @State private var body: String
    var viewModel: PostViewModel
    var post: Post?

    init(viewModel: PostViewModel, post: Post? = nil) {
        self.viewModel = viewModel
        _title = State(initialValue: post?.title ?? "")
        _body = State(initialValue: post?.body ?? "")
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(post == nil ? "New Post" : "Edit Post")) {
                    TextField("Title", text: $title)
                    TextField("Body", text: $body)
                }
                Button(action: savePost) {
                    Text(post == nil ? "Add Post" : "Save Changes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(post == nil ? Color.blue : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle(post == nil ? "Add Post" : "Edit Post")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }

    private func savePost() {
        guard !title.isEmpty, !body.isEmpty else { return }
        if let post = post {
            viewModel.updatePost(postId: post.id, title: title, body: body)
        } else {
            viewModel.createPost(title: title, body: body)
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct view_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

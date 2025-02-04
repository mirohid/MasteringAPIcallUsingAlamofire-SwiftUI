////
////  UpdateView.swift
////  MasteringAPIcallUsingAlamofire
////
////  Created by Tech Exactly iPhone 6 on 04/02/25.
////
//
//import SwiftUI
//
//struct UpdateView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var title: String
//    @State private var body: String
//    var post: Post
//    var viewModel: PostViewModel
//
//    init(post: Post, viewModel: PostViewModel) {
//        self.post = post
//        self.viewModel = viewModel
//        _title = State(initialValue: post.title)
//        _body = State(initialValue: post.body)
//    }
//
//    var body: some View {
//        Form {
//            Section(header: Text("Update Post")) {
//                TextField("Title", text: $title)
//                TextField("Body", text: $body)
//            }
//            Button(action: updatePost) {
//                Text("Save Changes")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .navigationTitle("Edit Post")
//    }
//
//    private func updatePost() {
//        viewModel.updatePost(postId: post.id, title: title, body: body)
//        presentationMode.wrappedValue.dismiss()
//    }
//}
//
//struct UpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateView()
//    }
//}

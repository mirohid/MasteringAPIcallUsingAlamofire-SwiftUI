////
////  AddView.swift
////  MasteringAPIcallUsingAlamofire
////
////  Created by Tech Exactly iPhone 6 on 04/02/25.
////
//
//import SwiftUI
//
//struct AddPostView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var title = ""
//    @State private var body = ""
//    var viewModel: PostViewModel
//
//    var body: some View {
//        Form {
//            Section(header: Text("Post Details")) {
//                TextField("Title", text: $title)
//                TextField("Body", text: $body)
//            }
//            Button(action: createPost) {
//                Text("Add Post")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .navigationTitle("New Post")
//    }
//
//    private func createPost() {
//        guard !title.isEmpty, !body.isEmpty else { return }
//        viewModel.createPost(title: title, body: body)
//        presentationMode.wrappedValue.dismiss()
//    }
//}
//
//
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPostView(, viewModel: <#PostViewModel#>)
//    }
//}

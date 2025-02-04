//
//  Model.swift
//  MasteringAPIcallUsingAlamofire
//
//  Created by Tech Exactly iPhone 6 on 04/02/25.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    var title: String
    var body: String
}

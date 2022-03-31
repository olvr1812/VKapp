//
//  UserPhotoStruct.swift
//  VKapp
//
//  Created by Оливер Салихов on 31.03.2022.
//

import Foundation


struct PhotoResponse {
    var response: Photos
}

extension PhotoResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Photos {
    var count: Int
    var items: [Photo]
}

extension Photos: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}



struct Photo {
    var id: Int
    var owner_id: Int
    var post_id: Int
    var sizes: [Sizes]
    var likes: Likes
}

extension Photo: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case owner_id
        case post_id
        case sizes
        case likes
    }
}

struct Sizes {
    var height: Int
    var url: String
    var type: String
    var width: Int
}

extension Sizes: Codable {
    enum CodingKeys: String, CodingKey {
        case height
        case url = "url"
        case type = "type"
        case width
    }
}
    
struct Likes {
    var user_likes: Int
    var count: Int
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case user_likes
        case count
    }
}

//
//  HttpJsonFormat.swift
//  SwiftCodes
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation

enum HTTPError: LocalizedError {
    case statusCode
    case post
}

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct Todo: Codable {
    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}

class PixabayImage: Codable {
    let largeImageURL: String
    let webformatHeight: Int
    let webformatWidth: Int
    let likes: Int
    let imageWidth: Int
    let id: Int
    let user_id: Int
    let views: Int
    let comments: Int
    let pageURL: String
    let imageHeight: Int
    let webformatURL: String
    let type: String
    let previewHeight: Int
    let tags: String
    let downloads: Int
    let user: String
    let favorites: Int
    let imageSize: Int
    let previewWidth: Int
    let userImageURL: String
    let previewURL: String
}

class PixabayObject: Codable {
    let totalHits: Int
    let hits: [PixabayImage]
    let total: Int
    public init(totalHits: Int, hits: [PixabayImage], total: Int) {
        self.totalHits = totalHits
        self.hits = hits
        self.total = total
    }
}

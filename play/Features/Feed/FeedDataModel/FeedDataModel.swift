//
//  FeedDataModel.swift
//  play
//
//  Created by Jai Nijhawan on 07/11/23.
//

import Foundation

// MARK: - FeedDataModel
struct FeedDataModel: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let hasPrevious, hasNext: Bool
    let count, totalPages: Int
    let content: [Content]
}

// MARK: - Content
struct Content: Codable, Identifiable {
    let id, title, description, contentKey: String
    let contentType: ContentType
    let category, readTime, thumbnail: String
    let isPortrait: Bool
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, description, contentKey, contentType, category, readTime, thumbnail, isPortrait, createdAt, updatedAt
    }
}

enum ContentType: String, Codable {
    case text = "TEXT"
}

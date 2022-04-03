//
//  NewsData.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 01.02.2022.
//

import Foundation

struct NewsInitialResponse: Codable {
    let response: NewsResponse
}

struct NewsResponse: Codable {
    let items: [NewsItems]
    let profiles: [NewsProfiles]
    let groups: [NewsGroups]
    let next_from: String
}

struct NewsItems: Codable {
    let source_id: Int
    let date: Int
    let text: String
    let attachments: [NewsAttachents]

}

struct NewsProfiles: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let photo_50: String

}

struct NewsGroups: Codable {
    let id: Int
    let name: String
    let photo_50: String

}

struct NewsAttachents: Codable {

    let photo: NewsPhoto
}

struct NewsPhoto: Codable {

    let sizes: [NewsPhotoSizes]
}

class NewsPhotoSizes: Codable {

    let width: Int
    let height: Int
    let url: String
    let type: String
}





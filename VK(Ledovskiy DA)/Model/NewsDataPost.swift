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
}

struct NewsItems: Codable {
    let source_id: Int
    let date: Int
    let text: String

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



//
//  PhotoData.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 12.12.2021.
//

import Foundation
import UIKit

struct PhotosInitialResponse: Codable {
    let response: PhotosResponse
}

struct PhotosResponse: Codable {
    let count: Int
    let items: [PhotosItems]
}

struct PhotosItems: Codable {
    let likes: PhotosLikes
    let sizes: [PhotosSizes]
}

struct PhotosLikes: Codable {
    let count: Int
}

struct PhotosSizes: Codable {
    let url: String
    let type: String
}

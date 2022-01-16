//
//  GroupsData.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 05.12.2021.
//

import Foundation
import RealmSwift

class GroupResponse: Object, Codable {
    @objc dynamic var response: GroupSecondLevel? = nil
}

@objcMembers
class GroupSecondLevel: Object, Codable {
    dynamic var count: Int = 0
    dynamic var items = List<GroupsItem>()

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        let itemsList = try container.decode([GroupsItem].self, forKey: .items)

        items.append(objectsIn: itemsList)

        super.init()
    }

    required override init() {
        super.init()
    }
}

class GroupsItem: Object, Codable {
    @objc dynamic var title: String = ""
    @objc dynamic var photo: String = ""
    @objc dynamic var id: Int = 0

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case photo = "photo_50"
        case id = "id"
}

    override class func primaryKey() -> String? {
            return "id"
        }
}


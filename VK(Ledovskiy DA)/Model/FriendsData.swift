//
//  Data.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class FriendsResponse: Object, Codable {
    dynamic var response: FriendsSecondLevel? = nil

    enum CodingKeys: String, CodingKey {
        case response = "response"
    }

}

@objcMembers
class FriendsSecondLevel: Object, Codable {
    dynamic var count: Int = 0
    dynamic var items = List<Items>()

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        let itemsList = try container.decode([Items].self, forKey: .items)

        items.append(objectsIn: itemsList)

        super.init()
    }

    required override init() {
        super.init()
    }

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case items = "items"
    }
}

@objcMembers
class Items: Object, Codable {
    dynamic var firstName: String = ""
    dynamic var id: Int = 0
    dynamic var lastName: String = ""
    dynamic var photo: String = ""
    dynamic var trackCode: String = ""

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case photo = "photo_50"
        case trackCode = "track_code"
    }

    override class func primaryKey() -> String? {
            return "id"
        }
}

//

//struct FriendsResponse {
//    var response: Response?
//
//    init(json: [String: Any]) {
//        self.response = Response(json: json["response"] as! [String: Any])
//    }
//}
//
//struct Response {
//    var count: Int
//    var items: Items?
//
//    init(json: [String: Any]) {
//        self.count = json["count"] as! Int
//        self.items = Items(json: json["items"] as! [String: Any])
//    }
//}
//
//struct Items {
//    var firstName: String
//    var id: Int
//    var lastName: String = ""
//    var photo: URL
//    var trackCode: String = ""
//
//    init(json: [String: Any]) {
//        self.firstName = json["first_name"] as! String
//        self.id = json["id"] as! Int
//        self.lastName = json["last_name"] as! String
//        self.photo = json["photo_50"] as! URL
//        self.trackCode = json["track_code"] as! String
//    }



//
//  RalmManager.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 08.12.2021.
//

import Foundation
import RealmSwift
import Realm

class RealmManager {

//    let realm = try! Realm()

//    func saveData(friends: [Items]) {
//        do {
//            let realm = try Realm()
//            realm.beginWrite()
//            realm.add(friends)
//            try realm.commitWrite()
//            print("all good")
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func saveData(groups: [GroupsItem]) {
//        do {
//            let realm = try Realm()
//            realm.beginWrite()
//            realm.add(groups)
//            try realm.commitWrite()
//            print("all good")
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }

    func save<T: Object>(data: [T]) {
           do {
//               let config = Realm.Configuration(schemaVersion: 1)
               let realm = try Realm ()

               realm.beginWrite()
//               realm.add(data)
               realm.add(data, update: .all)
               try realm.commitWrite()
               print(realm.configuration.fileURL)
               print("Save successful")
           } catch {
               print(error)
           }
       }

       func getFrineds<T: Object>() -> [T] {
           let configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
           let realm = try! Realm(configuration: configuration)
           let listFriends = realm.objects(T.self)
//           print("Zagruzil")
//           print(listFriends)
           return Array(listFriends)
       }

//    func getTestFriends() -> [Items] {
//        let  listFriends = realm.objects(Items.self)
//        print("Zagruzil")
//        print(listFriends)
//        return Array(listFriends)
//    }

}




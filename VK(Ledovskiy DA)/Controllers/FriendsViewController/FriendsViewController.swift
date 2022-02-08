//
//  FriendsViewController.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 15.10.2021.
//

import UIKit
import Realm
import RealmSwift
import Alamofire 

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let session = Session.instance
    let realmManager = RealmManager()

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromFriendToGallerySegue = "fromFriendToGallery"

    var friendArray = [Friend]()
    var savedFriendArray = [Friend]()
//    var friendsIdsArray = [Int]()

    var token: NotificationToken?
//    var dataSource: Results<Items>?

    var dataSource: [Items] = []

    func getImage(from url: String) -> UIImage? {
            var image: UIImage?
            guard let imageURL = URL(string: url) else { return nil }

            guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
            image = UIImage(data: imageData)

            return image
        }

//    func fillFriendsIdsArray(_ friendsInitialResponse: FriendsResponse) {
//            let friendsCount = friendsInitialResponse.response?.items.count
//            let friends = friendsInitialResponse.response?.items
//
//        for i in 0...friendsCount! - 1 {
//            friendsIdsArray.append(friends![i].id)
//            }
//        }

//    func fillFriendsIdsRealm(_ realmFriend: [Items]) {
//        let friend = realmFriend
//        let friendCount = realmFriend.count
//
//        for i in 0...friendCount - 1 {
//            friendsIdsArray.append(friend[i].id)
//        }
//    }

        func fillFriendsArray(_ friendsInitialResponse: FriendsResponse) {

            let friendsCount = friendsInitialResponse.response?.items.count
            let friends = friendsInitialResponse.response?.items

            for i in 0...friendsCount! - 1 {
                guard let avatar = getImage(from: (friends?[i].photo)!) else { return }

                friendArray.append(Friend(name: (friends?[i].firstName)! + (friends?[i].lastName)!, avatar: avatar, photos: [UIImage()], id: (friends?[i].id)!))
            }

            friendArray = friendArray.sorted { $0.name.lowercased() < $1.name.lowercased() }
        }
    
//    func fillFriendAraayFromRealm(_ realmFriend: [Items]) {
//        let friends = realmFriend
//
//        for i in 0...realmFriend.count - 1 {
//            guard let avatar = getImage(from: (friends[i].photo)) else { return }
//            friendArray.append(Friend(name: (friends[i].firstName) + " " + (friends[i].lastName), avatar: avatar,
//                                      photos: [UIImage()], id: friends[i].id))
//
//    }
//    }

//    func mathcRealm() {
//        makeRequest()
//        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
//            let realm = try! Realm()
//            dataSource = realm.objects(Items.self)
//        fillFriendAraayFromRealm(Array(((dataSource ?? nil) ?? nil)!))
//        fillFriendsIdsRealm(Array(((dataSource ?? nil) ?? nil)!))
//            token = dataSource?.observe { [weak self] changes in
//                switch changes {
//                case let .update(results, deletions, insertions, modifications):
//                    self?.tableView.beginUpdates()
//                    self?.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .fade)
//                    self?.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .fade)
//                    self?.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .fade)
//                    self?.tableView.endUpdates()
//                    print("UPDATED")
//
//                    print(self?.dataSource?.count)
//                case .initial:
//                    self?.tableView.reloadData()
//                    print("INTITAL")
//                case .error(let error):
//                    print("Error")
//
//                }
//            }
//        }

    func makeRequest() {
        let urlFriends = URL(string: "http://api.vk.com/method/friends.get?v=5.81&access_token=\(session.token)&count=50&fields=nickname,photo_50")
        let task = URLSession.shared.dataTask(with: urlFriends!) { data, response, error in
            do {
                let friends = try JSONDecoder().decode(FriendsResponse.self, from: data!)
                let pars = friends.response?.items
                self.fillFriendsArray(friends)

                DispatchQueue.main.async {
//                    self.realmManager.save(data: Array(pars!))
                    self.tableView.reloadData()
                                }
//                self.realmManager.saveData(friends: pars)
//                print(pars.map { $0.firstName + " " + $0.lastName })
            } catch(let error) {
                print(error)
            }
    }
    task.resume()
}

//    func fillFriendsArray() {
//        let friend1 = Friend(name: "Арнольд Шварцнегер", avatar: UIImage(named: "arnoldAva")!,
//                             photos: [UIImage(named: "arni1")!, UIImage(named: "arni2")!, UIImage(named: "arni3")!, UIImage(named: "arni4")!, UIImage(named: "arni5")!, UIImage(named: "arni6")!])
//        let friend2 = Friend(name: "Диана Принс", avatar: UIImage(named: "dianaAva")!,
//                             photos: [UIImage(named: "diana1")!, UIImage(named: "diana2")!, UIImage(named: "diana3")!,
//                                      UIImage(named: "diana4")!, UIImage(named: "diana5")!, UIImage(named: "diana6")!])
//        let friend3 = Friend(name: "Криштиано Роналдо", avatar: UIImage(named: "ronaldoAva")!,
//                             photos: [UIImage(named: "cri1")!, UIImage(named: "cri2")!, UIImage(named: "cri3")!,
//                                      UIImage(named: "cri4")!, UIImage(named: "cri5")!, UIImage(named: "cri6")!])
//        let friend4 = Friend(name: "Меган Фокс", avatar: UIImage(named: "meganAva")!,
//                             photos: [UIImage(named: "megan1")!, UIImage(named: "megan2")!, UIImage(named: "megan3")!,
//                                      UIImage(named: "megan4")!, UIImage(named: "megan5")!])
//        friendArray.append(friend1)
//        friendArray.append(friend2)
//        friendArray.append(friend3)
//        friendArray.append(friend4)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        let realm = try! Realm()
//        makeRequest()
//        fillFriendsArray()
//        mathcRealm()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        //        self.dataSource = realmManager.getFrineds()
        //        fillFriendAraayFromRealm(dataSource)

//        dataSource = realm.objects(Items.self)
//        fillFriendAraayFromRealm(Array(((dataSource ?? nil) ?? nil)!))

        let operationQueue = OperationQueue()
        let friendsRequst = FriendsRequest()
        let friendsJsonDecode = FriendsJsonDecode()
        let friendsReloadData = FriendsReloadData(controller: self)

        operationQueue.addOperation(friendsRequst)
        friendsJsonDecode.addDependency(friendsRequst)
        operationQueue.addOperation(friendsJsonDecode)
        friendsReloadData.addDependency(friendsJsonDecode)
        operationQueue.addOperation(friendsReloadData)

        savedFriendArray = friendArray
//        tableView.reloadData()

        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(tapFunc))
        self.view.addGestureRecognizer(tapScreen)
        tapScreen.cancelsTouchesInView = false

    }

    @objc func tapFunc() {
        self.view.endEditing(true)
    }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == fromFriendToGallerySegue,
                let sourceVC = segue.source as? FriendsViewController,
               //               let destinationVC = segue.destination as? GalleryViewController,
                //               let friend = sender as? Friend {
                //                destinationVC.photos = friend.photos
                let destinationVC = segue.destination as? GalleryViewController,
               //                        let friend = sender as? Friend {
               let friend = sender as? Friend {
                destinationVC.friendId = friend.id
                destinationVC.avatar = friend.avatar
            }
        }
    }

    func arrayLetter(sourceArray: [Friend]) -> [String] {
        var resultArray = [String]()

        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1))
            if !resultArray.contains(nameLetter.lowercased()) {
                resultArray.append(nameLetter.lowercased())
            }
        }
        return resultArray.sorted { firstItem, secondItem in firstItem < secondItem }
    }

    func arrayByLetter(sourceArray: [Friend], letter: String) -> [Friend] {
        var resultArray = [Friend]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1)).lowercased()
            if nameLetter == letter.lowercased() {
                resultArray.append(item)
            }
        }
            return resultArray
    }

    extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {

        func numberOfSections(in tableView: UITableView) -> Int {
            return arrayLetter(sourceArray: friendArray).count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayByLetter(sourceArray: friendArray, letter: arrayLetter(sourceArray: friendArray)[section]).count
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(cellHeight)
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath)
                             as? CustomTableViewCell
                             else {return UITableViewCell()}

            cell.configure(friend: arrayByLetter(sourceArray: friendArray, letter: arrayLetter(sourceArray: friendArray)[indexPath.section])[indexPath.row], completion: { [weak self] myFriend in
                guard let self = self else {return}
                self.performSegue(withIdentifier: self.fromFriendToGallerySegue, sender: myFriend)
            })
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: fromFriendToGallerySegue, sender: arrayByLetter(sourceArray: friendArray,
            letter: arrayLetter(sourceArray: friendArray)[indexPath.section])[indexPath.row])
            tableView.deselectRow(at: indexPath, animated: true)
        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section : Int) -> String? {
            return arrayLetter(sourceArray: friendArray)[section].uppercased()
        }

    }

    extension FriendsViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                self.friendArray = self.savedFriendArray
            } else {
                self.friendArray = self.friendArray.filter({ friendItem in
                    friendItem.name.lowercased().contains(searchText.lowercased())})
            }
            self.tableView.reloadData()
        }
    }

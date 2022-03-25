//
//  MyGroupsViewController.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 15.10.2021.
//

import UIKit
import RealmSwift

class MyGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let session = Session.instance
    let realmManager = RealmManager()

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromAllGroupsToMyGroupsSegue = "fromAllGroupsToMyGroups"

    var myGroupsArray = [Group]()

    var token: NotificationToken?
    var dataSource: Results<GroupsItem>?
//    var dataSource: [GroupsItem] = []

    func getImage(from url: String) -> UIImage? {
           var image: UIImage?
           guard let imageURL = URL(string: url) else { return nil }

           guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
           image = UIImage(data: imageData)

           return image
       }

       func fillAllGroupsArray(_ groupsInitialResponse: GroupResponse) {

           let groupsCount = groupsInitialResponse.response?.items.count
           let groups = groupsInitialResponse.response?.items

           for i in 0...groupsCount! - 1 {

               guard let avatar = getImage(from: (groups![i].photo)) else { return }

               myGroupsArray.append(Group(title: groups![i].title, avatar: avatar))
           }
       }

    func fillGroupFromRealm(_ realmGroups: [GroupsItem]) {
        let groups = realmGroups

        for i in 0...realmGroups.count - 1 {
            guard let avatar = getImage(from: (groups[i].photo)) else { return }

            myGroupsArray.append(Group(title: groups[i].title, avatar: avatar))
        }
    }

    func makeRequest() {
        let urlGroups = URL(string: "http://api.vk.com/method/groups.get?v=5.81&access_token=\(session.token)&count=50&extended=1&fields=id")
        let task = URLSession.shared.dataTask(with: urlGroups!) { data, response, error in
            do {
                let groups = try JSONDecoder().decode(GroupResponse.self, from: data!)
                let pars = groups.response?.items
//                self.fillAllGroupsArray(groups)
                DispatchQueue.main.async {
                    self.realmManager.save(data: Array(pars!))
                    self.tableView.reloadData()
                }
//                self.realmManager.saveData(groups: pars)

//                print(pars.map { $0.title })
//                print(pars)
                } catch(let error) {
                print(error)
            }
    }
    task.resume()
}

    func mathcRealm() {
        makeRequest()
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try! Realm()
            dataSource = realm.objects(GroupsItem.self)
        fillGroupFromRealm(Array(((dataSource ?? nil) ?? nil)!))
            token = dataSource?.observe { [weak self] changes in
                switch changes {
                case let .update(results, deletions, insertions, modifications):
                    self?.tableView.beginUpdates()
                    self?.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .fade)
                    self?.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .fade)
                    self?.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .fade)
                    self?.tableView.endUpdates()
                    print("UPDATED")

                    print(self?.dataSource?.count)
                case .initial:
                    self?.tableView.reloadData()
                    print("INTITAL")
                case .error(let error):
                    print("Error")

                }
            }
        }

//    func fillMyGroupsArray() {
//        let group1 = Group(title: "Marvel", avatar: UIImage(named: "Unknown")!)
//        let group2 = Group(title: "MDK", avatar: UIImage(named: "Unknown2")!)
//        let group3 = Group(title: "Кино", avatar: UIImage(named: "Unknown3")!)
//        let group4 = Group(title: "Инвестиции", avatar: UIImage(named: "Unknown4")!)
//        myGroupsArray.append(group1)
//        myGroupsArray.append(group2)
//        myGroupsArray.append(group3)
//        myGroupsArray.append(group4)
//    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        makeRequest()
        mathcRealm()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self

//        dataSource = realmManager.getFrineds()
//        fillGroupFromRealm(dataSource)
        tableView.reloadData()
    }

    

    func isItemAlreadyArray(group: Group) -> Bool {
        return myGroupsArray.contains { sourceGroup in sourceGroup.title == group.title }
    }

    @IBAction func unwindSegueToMyGroups(segue: UIStoryboardSegue) {
        if segue.identifier == fromAllGroupsToMyGroupsSegue,
           let sourceVC = segue.source as? AllGroupViewController,
           let selectedGroup = sourceVC.selectedGroup as? Group {
            if isItemAlreadyArray(group: selectedGroup) {return}
            self.myGroupsArray.append(selectedGroup)
            tableView.reloadData()
        }
    }
}

extension MyGroupsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath)
                as? CustomTableViewCell else {return UITableViewCell()}

        cell.configure(group: myGroupsArray[indexPath.row])
        cell.setTitleLabel(text: myGroupsArray[indexPath.row].title)

        return cell
    }
}


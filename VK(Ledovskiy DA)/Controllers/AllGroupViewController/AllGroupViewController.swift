//
//  AllGroupViewController.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 22.10.2021.
//

import UIKit

class AllGroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromAllGroupsToMyGroupsSegue = "fromAllGroupsToMyGroups"
    var selectedGroup: Group?

    var allGroupsArray = [Group]()

    func fillALLGroupsArray() {
        let group1 = Group(title: "TRUE GYM", avatar: UIImage(named: "gr1")!)
        let group2 = Group(title: "Real Madrid", avatar: UIImage(named: "gr2")!)
        let group3 = Group(title: "Скидки", avatar: UIImage(named: "gr3")!)
        let group4 = Group(title: "Музыка", avatar: UIImage(named: "gr4")!)
        allGroupsArray.append(group1)
        allGroupsArray.append(group2)
        allGroupsArray.append(group3)
        allGroupsArray.append(group4)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        fillALLGroupsArray()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
    }
}


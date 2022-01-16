//
//  AllGroupViewController+TableDelegate.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 22.10.2021.
//

import UIKit

extension AllGroupViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = allGroupsArray[indexPath.row]
        performSegue(withIdentifier: fromAllGroupsToMyGroupsSegue, sender: allGroupsArray[indexPath.row])
    }
}

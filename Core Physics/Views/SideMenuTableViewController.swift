//
//  SideMenuTableViewController.swift
//  SideMenu
//
//  Created by Jon Kent on 4/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import SideMenu

protocol TableDataDelegate {
    func dataTransfer(data: Int)
}

class SideMenuTableViewController: UITableViewController {
    
    var delegate: TableDataDelegate? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Refresh cell blur effect in case it changed
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell
        cell.blurEffectStyle = SideMenuManager.default.menuBlurEffectStyle
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var cellNumber: Int = 1
        
        if SideMenuManager.default.menuLeftNavigationController?.isHidden == true {
            if indexPath.row == 0 {
                cellNumber = 5
                delegate?.dataTransfer(data: cellNumber)
            } else if indexPath.row == 1 {
                cellNumber = 6
                delegate?.dataTransfer(data: cellNumber)
            } else if indexPath.row == 2 {
                cellNumber = 7
                delegate?.dataTransfer(data: cellNumber)
            } else if indexPath.row == 3 {
                cellNumber = 8
                delegate?.dataTransfer(data: cellNumber)
            }
        } else if SideMenuManager.default.menuRightNavigationController?.isHidden == true {
            if indexPath.row == 0 {
                cellNumber = 1
                delegate?.dataTransfer(data: cellNumber)
            } else if indexPath.row == 1 {
                cellNumber = 2
                delegate?.dataTransfer(data: cellNumber)
            } else if indexPath.row == 2 {
                cellNumber = 3
                delegate?.dataTransfer(data: cellNumber)
            } else if indexPath.row == 3 {
                cellNumber = 4
                delegate?.dataTransfer(data: cellNumber)
            }
        } else {}
        print(cellNumber)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}


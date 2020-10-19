//
//  MainViewController.swift
//  ListContent
//
//  Created by Fahim Farook on 19-10-2020.
//

import UIKit

class MainViewController: UITableViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sec = indexPath.section
		let row = indexPath.row
		switch (sec, row) {
		case (0, 0):
			navigationController?.pushViewController(SimpleTableView(), animated: true)

		case (0, 1):
			navigationController?.pushViewController(SimpleCollectionView(), animated: true)

		case (0, 2):
			navigationController?.pushViewController(SimpleStackView(), animated: true)

		case (1, 0):
			navigationController?.pushViewController(DiffableTableView(), animated: true)

		case (1, 1):
			navigationController?.pushViewController(DiffableCollectionView(), animated: true)

		case (2, 0):
			navigationController?.pushViewController(CustomTableView(), animated: true)

		case (2, 1):
			navigationController?.pushViewController(CustomCollectionView(), animated: true)

		case (2, 2):
			navigationController?.pushViewController(CustomStackView(), animated: true)

		default:
			NSLog("Unknown option")
		}
	}

}

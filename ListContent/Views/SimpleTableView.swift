//
//  RootViewController.swift
//  ListContent
//
//  Created by Fahim Farook on 18-10-2020.
//

import UIKit

class SimpleTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
	private var tableView: UITableView!
	private let reuseIdentifier = "BookCell"

    override func viewDidLoad() {
        super.viewDidLoad()
		// View title
		title = "Books - Table"
		// Add table view
		tableView = UITableView(frame: view.bounds, style: .insetGrouped)
		tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		// Register cell
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
		tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }

	// MARK: - Table View Data Source / Delegate
	func numberOfSections(in tableView: UITableView) -> Int {
		return Book.sections.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Book.booksFor(section: section).count
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier)!
		let section = Book.sections[section]
		var content = cell.defaultContentConfiguration()
		content.text = section
		cell.contentConfiguration = content
		return cell
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		var content = cell.defaultContentConfiguration()
		let section = Book.sections[indexPath.section]
		if let arr = Book.books[section] {
			let book = arr[indexPath.row]
			content.image = book.authType == .single ? UIImage(systemName: "person.fill") : UIImage(systemName: "person.2.fill")
			content.text = book.title
			content.secondaryText = book.author
		}
		cell.contentConfiguration = content
		return cell
	}
}

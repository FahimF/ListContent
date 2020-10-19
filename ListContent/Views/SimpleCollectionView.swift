//
//  SimpleCollectionView.swift
//  ListContent
//
//  Created by Fahim Farook on 19-10-2020.
//

import UIKit

class SimpleCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	private var collectionView: UICollectionView!
	private var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Book>!

    override func viewDidLoad() {
        super.viewDidLoad()
		// View title
		title = "Books - Collection"
		// Collection view layout
		let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
		let layout = UICollectionViewCompositionalLayout.list(using: config)
		// Add collection view
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.addSubview(collectionView)
		collectionView.delegate = self
		collectionView.dataSource = self
		// Cell registration
		cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Book> { cell, indexPath, book in
			var content = cell.defaultContentConfiguration()
			content.image = book.authType == .single ? UIImage(systemName: "person.fill") : UIImage(systemName: "person.2.fill")
			content.text = book.title
			content.secondaryText = book.author
			cell.contentConfiguration = content
		}
    }
    
	// MARK: - Collection View Data Source / Delegates
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return Book.sections.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return Book.booksFor(section: section).count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let section = Book.sections[indexPath.section]
		let arr = Book.books[section]!
		let book = arr[indexPath.row]
		let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: book)
		return cell
	}
}

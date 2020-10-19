//
//  Book.swift
//  ListContent
//
//  Created by Fahim Farook on 19-10-2020.
//

import Foundation

enum AuthorType {
	case single, multiple
}

struct Book: Hashable {
	var title = ""
	var author = ""
	var pages = 0
	var year = 0
	var genre = ""
	var authType = AuthorType.single

	static var sections: [String] {
		return ["Fiction", "Non-Fiction"]
	}

	static var books: [String: [Book]] {
		return [
			"Fiction": [
				Book(title: "Peace Talks", author:"Jim Butcher", pages: 340, year: 2020),
				Book(title: "Battle Ground", author:"Jim Butcher", pages: 300, year: 2020),
				Book(title: "Neuromancer", author:"William Gibson", pages: 271, year: 1984),
				Book(title: "Snow Crash", author:"Neal Stephenson", pages: 480, year: 1992)
			],
			"Non-Fiction": [
				Book(title: "UIKit Apprentice", author:"Fahim Farook & Matthijs Hollemans", pages: 1128, year: 2020, authType: AuthorType.multiple),
				Book(title: "Swift Apprentice", author:"The Ray Wenderlich Tutorial Team", pages: 500, year: 2020, authType: AuthorType.multiple)
			]
		]
	}

	static func booksFor(section: Int) -> [Book] {
		let sec = Book.sections[section]
		if let arr = Book.books[sec] {
			return arr
		}
		return []
	}
}

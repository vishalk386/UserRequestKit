//
//  UserListResponse.swift
//
//
//  Created by Vishal Kamble on 08/06/24.
//

import Foundation

// MARK: - UserListResponse
struct UserListResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - User
public struct User: Codable {
    public let id: Int
    public let email, firstName, lastName: String
    public let avatar: String

    public enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}


// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}

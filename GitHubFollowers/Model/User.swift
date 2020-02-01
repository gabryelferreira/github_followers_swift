//
//  User.swift
//  GitHubFollowers
//
//  Created by Gabryel Ferreira on 29/01/20.
//  Copyright © 2020 Gabryel Ferreira. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var followersUrl: String
    var createdAt: String
}

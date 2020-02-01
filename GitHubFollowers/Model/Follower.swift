//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Gabryel Ferreira on 29/01/20.
//  Copyright © 2020 Gabryel Ferreira. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

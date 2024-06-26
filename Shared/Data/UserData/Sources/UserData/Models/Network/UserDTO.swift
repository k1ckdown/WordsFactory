//
//  UserDTO.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import Foundation

struct UserDTO: Codable {
    let id: String
    let name: String
    let email: String
    let joinDate: Date
}

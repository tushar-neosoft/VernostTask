//
//  LoginModel.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//

import Foundation

struct ListingModel: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let description: String
    let image: String
}



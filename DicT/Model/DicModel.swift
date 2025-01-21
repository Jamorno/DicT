//
//  DicModel.swift
//  DicT
//
//  Created by Jamorn Suttipong on 21/1/2568 BE.
//

import Foundation

struct DicModel: Codable {
    let word: String
    let meanings: [Meaning]
}

struct Meaning: Codable {
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
    let example: String?
}

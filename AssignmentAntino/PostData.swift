//
//  PostData.swift
//  AssignmentAntino
//
//  Created by Naman Sharma on 28/12/19.
//  Copyright © 2019 Naman Sharma. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let data: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return name
    }
    let location: String
    let age: Int
    let name: String
    let url: String?
}

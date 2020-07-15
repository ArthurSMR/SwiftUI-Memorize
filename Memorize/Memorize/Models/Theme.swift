//
//  Theme.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 08/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

class Theme<CardContent> where CardContent: Equatable {
    var name: String
    var content: [CardContent]
    
    init(name: String, content: [CardContent]) {
        self.name = name
        self.content = content
    }
}

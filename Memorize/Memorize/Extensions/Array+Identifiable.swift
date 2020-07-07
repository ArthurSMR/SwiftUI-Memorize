//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 06/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
}

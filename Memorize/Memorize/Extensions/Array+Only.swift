//
//  Array+Only.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 07/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

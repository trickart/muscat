//
//  Array+.swift
//  
//
//  Created by trick on 2021/08/29.
//

extension Array {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

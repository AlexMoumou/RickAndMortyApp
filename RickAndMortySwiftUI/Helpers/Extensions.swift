//
//  Extensions.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation

// MARK: - Debugging Helper
extension CustomStringConvertible where Self: Codable {
    var description: String {
        var description = "\n***** \(type(of: self)) *****\n"
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
}

extension Array {
    /// Returns the object at the current index
    /// if it does not exist then it returns nil
    ///
    /// - Parameter index: index
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

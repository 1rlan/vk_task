//
//  FindRandomIndexFunc.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import Foundation

func findRandomIndex<T: Equatable>(in array: [T], matching value: T) -> Int? {
    let matchingIndices = array.enumerated().filter { $0.element == value }.map { $0.offset }
    guard !matchingIndices.isEmpty else {
        return nil
    }
    
    let randomIndex = matchingIndices.randomElement()
    return randomIndex
}

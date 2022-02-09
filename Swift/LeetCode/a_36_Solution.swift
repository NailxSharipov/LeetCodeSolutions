//
//  a_36_Solution.swift
//  LeetCode
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

final class ValidSudoku {
    
    struct Box {
        
        private static let map = [
            Character("."): 0,
            Character("1"): 1,
            Character("2"): 2,
            Character("3"): 3,
            Character("4"): 4,
            Character("5"): 5,
            Character("6"): 6,
            Character("7"): 7,
            Character("8"): 8,
            Character("9"): 9
        ]

        private let buffer: [Int]

        func get(x: Int, y: Int) -> Int {
            let index = x + y * 9
            return buffer[index]
        }
        
        init(rows: [[Character]]) {
            var array = [Int](repeating: 0, count: 81)
            var i = 0
            for row in rows {
                for x in row {
                    array[i] = Box.map[x] ?? 0
                    i += 1
                }
            }
            buffer = array
        }
        
        func isValid(row: Int) -> Bool {
            var array = [Bool](repeating: true, count: 10)
            let offset = 9 * row
            for i in 0..<9 {
                let index = offset + i
                let number = buffer[index]
                guard number > 0 else { continue }
                if array[number] {
                    array[number] = false
                } else {
                    return false
                }
            }
            return true
        }
        
        func isValid(column: Int) -> Bool {
            var array = [Bool](repeating: true, count: 10)
            for i in 0..<9 {
                let index = 9 * i + column
                let number = buffer[index]
                guard number > 0 else { continue }
                if array[number] {
                    array[number] = false
                } else {
                    return false
                }
            }
            return true
        }

        func isValidSquare(x0: Int, y0: Int) -> Bool {
            var array = [Bool](repeating: true, count: 10)
            for y in 0..<3 {
                let offset = (y + y0) * 9 + x0
                for x in 0..<3 {
                    let index = x + offset
                    let number = buffer[index]
                    guard number > 0 else { continue }
                    if array[number] {
                        array[number] = false
                    } else {
                        return false
                    }
                }
            }
            return true
        }
        
    }
    
    static func isValidSudoku(_ board: [[Character]]) -> Bool {
        let box = Box(rows: board)
        for i in 0..<9 {
            if !box.isValid(row: i) {
                return false
            }
            if !box.isValid(column: i) {
                return false
            }
            
            let x = i % 3
            let y = i / 3
            
            if !box.isValidSquare(x0: 3 * x, y0: 3 * y) {
                return false
            }
        }

        return true
    }
    
}

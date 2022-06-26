//
//  a_37_Solution.swift
//  LeetCode
//
//  Created by Nail Sharipov on 20.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

final class SudokuSolver {
    
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
        
        private static let revMap = [
            Character("."),
            Character("1"),
            Character("2"),
            Character("3"),
            Character("4"),
            Character("5"),
            Character("6"),
            Character("7"),
            Character("8"),
            Character("9")
        ]
        
        struct Square {
            let index: Int
            
        }

//        private var buffer: [Int]
        private (set) var buffer: UnsafeMutablePointer<Int>
        
        init(rows: [[Character]]) {
            buffer = UnsafeMutablePointer<Int>.allocate(capacity: 81)
            var i = 0
            for row in rows {
                for x in row {
                    buffer[i] = Box.map[x] ?? 0
                    i += 1
                }
            }
        }
        
        @inline(__always)
        func isContain(number: Int, y: Int) -> Bool {
            let y0 = y * 9
            for x in 0..<9 {
                let i = x + y0
                if buffer[i] == number {
                    return true
                }
            }
            return false
        }
        
        @inline(__always)
        func isContain(number: Int, x: Int) -> Bool {
            var i = x
            for _ in 0..<9 {
                if buffer[i] == number {
                    return true
                }
                i += 9
            }
            return false
        }
        
        @inline(__always)
        func isContain(number: Int, x: Int, y: Int) -> Bool {
            var i0 = x - x % 3 + 9 * (y - y % 3)
            for _ in 0...2 {
                for xi in 0...2 {
                    let i = i0 + xi
                    if buffer[i] == number {
                        return true
                    }
                }
                i0 += 9
            }
            return false
        }

        @inline(__always)
        func isPossible(number: Int, x: Int, y: Int) -> Bool {
            guard !self.isContain(number: number, x: x) else {
                return false
            }
            guard !self.isContain(number: number, y: y) else {
                return false
            }
            guard !self.isContain(number: number, x: x, y: y) else {
                return false
            }
            return true
        }

        func solve() -> Bool {
            for i in 0..<81 where buffer[i] == 0 {
                let x = i % 9
                let y = i / 9

                for n in 1...9 {
                    if self.isPossible(number: n, x: x, y: y) {
                        buffer[i] = n
                        if self.solve() {
                            return true
                        }
                        buffer[i] = 0
                    }
                }
                return false
            }
            
            return true
        }
        
        func fill(board: inout [[Character]]) {
            for i in 0..<81 {
                let x = i % 9
                let y = i / 9
                board[y][x] = Self.revMap[buffer[i]]
            }
        }

    }
    
    static func solveSudoku(_ board: inout [[Character]]) {
        let box = Box(rows: board)
        _ = box.solve()
        box.fill(board: &board)
        box.buffer.deallocate()
    }
    
}

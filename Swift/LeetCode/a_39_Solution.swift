//
//  a_39_Solution.swift
//  LeetCode
//
//  Created by Nail Sharipov on 04.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

struct CombinationSum {
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var distinct = Array(Set(candidates)).sorted()
        var allSteps = [Int: Set<[Int: Int]>]()

        guard !distinct.isEmpty else {
            return []
        }
        
        var count = 0
        let minDist = distinct[0]
        for a in distinct where a <= target {
            var set = Set<[Int: Int]>()
            set.insert([a: 1])
            allSteps[a] = set
            if a < target {
                count += 1
            }
        }

        let hasNext = allSteps.count > 1 || (allSteps.count == 1 && allSteps[target] == nil )
        
        while hasNext {
            var newSteps = [Int: Set<[Int: Int]>]()

            var min = Int.max
            for a in distinct {
                for step in allSteps {
                    let sum = step.key

                    let newSum = sum + a
                    guard newSum == target || minDist + newSum <= target else {
                        continue
                    }
                    
                    let combinations = step.value
                    var newCombinations = newSteps[newSum] ?? allSteps[newSum] ?? Set<[Int: Int]>()
                    
                    for combination in combinations {
                        var newCombination = combination
                        let exA = newCombination[a]
                        newCombination[a] = (exA ?? 0) + 1

                        newCombinations.insert(newCombination)
                    }
                    
                    newSteps[newSum] = newCombinations
                    if min > newSum {
                        min = newSum
                    }
                }
            }

            if let last = allSteps[target], newSteps[target] == nil {
                newSteps[target] = last
            }

            guard min != Int.max else {
                break
            }
            
            allSteps = newSteps
            distinct = distinct.filter({ $0 + min <= target })
        }
        
        guard let targetCombinations = allSteps[target] else { return [] }
        var result = [[Int]]()
        result.reserveCapacity(targetCombinations.count)
        
        for combination in targetCombinations {
            var list = [Int]()
            for item in combination {
                let a = item.key
                for _ in 0..<item.value {
                    list.append(a)
                }
            }
            result.append(list)
        }
        
        
        return result
    }
    
}

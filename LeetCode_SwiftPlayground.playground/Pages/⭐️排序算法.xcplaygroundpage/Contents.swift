//: [Previous](@previous)

import Foundation

var array = [4,5,6,3,2,1]

//bubble sort
func bubbleSort(_ array: inout [Int]) {
    var flag = false
    for i in 0..<array.count-1 {
        for j in 0..<array.count-1-i {
            if array[j] > array[j+1] {
                (array[j],array[j+1]) = (array[j+1],array[j])
                flag = true
            }
        }
        if !flag {break}
    }
    
}




//: [Next](@next)

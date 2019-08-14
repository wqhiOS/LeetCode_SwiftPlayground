//: [Previous](@previous)

import Foundation

var array = [4,5,6,3,2,1]

//冒泡排序
func bubbleSort(_ array: inout [Int]) {
    for i in 0..<array.count-1 {
        for j in 0..<array.count-1-i {
            if array[j] > array[j+1] {
                (array[j],array[j+1]) = (array[j+1],array[j])
            }
        }
    }
}




//: [Next](@next)

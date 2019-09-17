//: [Previous](@previous)

import Foundation

var array = [8,3,5,7,4,2,1,6]

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
//test
//bubbleSort(&array)

//insertion sort
func insertionSort(_ array: inout [Int]) {
    for i in 1..<array.count {
        let value = array[i]
        // 查找插入的位置
        var j = i-1
        while j>=0 {
            if array[j] > value {
                array[j+1] = array[j]//移动位置
            }else {
                break//这里说明找到了
            }
            j-=1
        }
        //插入
        array[j+1] = value
    }
}
//test
insertionSort(&array)



//: [Next](@next)

//: [Previous](@previous)

import Foundation

var array = [4,5,6,3,2,1,7]

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
        for j in stride(from: i-1, to: -1, by: -1) {
            if array[j] > value {

                array[j+1] = array[j]
            }else {
                break
            }
            
            if j == 0 {
                array[0] = value
            }
        }

    }
}
func insertionSort2(_ arr:[Int]) -> [Int] {
    if arr.count<=1 {return arr}
    var sortedArr = arr
    var tempInt:Int
    for i in 0..<arr.count {
        tempInt = sortedArr[i]
        for j in stride(from: i, to: -1, by: -1){
            if tempInt < sortedArr[j]{
                sortedArr.remove(at: j + 1)
                sortedArr.insert(tempInt, at: j)
            }
        }
    }
    return sortedArr
}
//test
insertionSort(&array)




//: [Next](@next)

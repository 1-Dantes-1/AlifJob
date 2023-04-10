import Foundation

var array: [Int] = [2,4,5,-2,1]

func Task1(){
    for i in 0...array.count - 1{
        if (array[i] < 0){
            array[i] = 0
        }
    }
    print("Array deleted negative numbers:\(array)")
}

func Task2(){
    var sortedArrByDescending = array.sorted(by:>)
    var sortedArrByAscending = array.sorted(by:<)
    print("Sorted by >:\(sortedArrByDescending)")
    print("Sorted by <:\(sortedArrByAscending)")
}

func Task3(){
    var sortedArrByDescending = array.sorted(by:>)
    var sortedArrByAscending = array.sorted(by:<)
    var max = sortedArrByDescending[0]
    var min = sortedArrByAscending[0]
    print("Max:\(max)")
    print("Min:\(min)")
}

func Task4(){
    var sum = 0
    for i in 0...array.count - 1 {
        sum += array[i]
    }
    print("Sum:\(sum)")
}
print("Array: \(array)")
Task1()
Task2()
Task3()
Task4()

import Cocoa


// Insertion Sort(삽입 정렬)

public func insertionSort<T: Comparable>(_ list: inout [T]) {
    if list.count <= 1 {
        return
    }
    
    for i in 1..<list.count {
        let a = list[i]
        var j = i
        while j > 0 && list[j - 1] > a {
           list[j] = list[j - 1]
            j -= 1
        }
        list[j] = a
    }
}

var myList = [1, 14, 9, 81, 3, 2, 7]



insertionSort(&myList)

// 최적화(대규모 데이터세트를 만났을 때)
// 이차 알고리즘임에 따라 없다? 아니 별로 없다.. 그냥 다른 정렬을 써보자
// 2D 게임 엔진에도 사용되고 있다(삽입 정렬 - Sprite)


// Merge Sort
// Point : recursion
//

public func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
    
    if list.count < 2 {
        return list
    }
    
    let center = (list.count) / 2
    return merge(mergeSort([T](list[0..<center])), rightHalf: mergeSort([T](list[center..<list.count])))
    
}


private func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex =  0
    var tmpList = [T]()
    tmpList.reserveCapacity(leftHalf.count + rightHalf.count)
    
    while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) {
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            tmpList.append(leftHalf[leftIndex])
            leftIndex += 1
        } else if leftHalf[leftIndex] > rightHalf[rightIndex] {
            tmpList.append(rightHalf[rightIndex])
            rightIndex += 1
        } else {
            tmpList.append(leftHalf[leftIndex])
            tmpList.append(rightHalf[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    tmpList += [T](leftHalf[leftIndex..<leftHalf.count])
    tmpList += [T](rightHalf[rightIndex..<rightHalf.count])
    return tmpList
}

var testList = [1, 14, 9, 81, 3, 2, 7]
mergeSort(testList)



// Quick Sort
// Lomuto Partitoning Scheme
// O(nlogn)
// 최악 : O(n^)
// Pivot 선택 여부에 따라 알고리즘 성능이 크게 차이남.


public func quickSort<T: Comparable> (_ list: inout [T], low: Int, high: Int) {
    if low < high {
        let pivot = partition(&list, low: low, high: high)
        
        quickSort(&list, low: low, high: pivot - 1)
        quickSort(&list, low: pivot + 1, high: high)
    }
}

private func partition<T: Comparable> (_ list: inout [T], low: Int, high: Int) -> Int{
    return 0
}

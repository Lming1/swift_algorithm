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


var testList = [1, 14, 9, 81, 3, 2, 7]

insertionSort(&testList)

// 최적화(대규모 데이터세트를 만났을 때)
// 이차 알고리즘임에 따라 없다? 아니 별로 없다.. 그냥 다른 정렬을 써보자
// 2D 게임 엔진에도 사용되고 있다(삽입 정렬 - Sprite)



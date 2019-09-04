import AppKit
import Foundation


// 동일한 타입만
let nsFooArray: NSArray = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

// 강제 언래핑 사용
let swiftArray: [Int] = nsFooArray as! [Int]

// 타입 캐스팅

if let testArray: [Int] = nsFooArray as? [Int] {
    print(testArray)
}


// 다른 타입이 있다면
let mixedNSArray: NSArray = NSArray(array: [0, 1, "1", 2, "3", 5, "8", 13, 21, 34])

//let swiftArrayMixed: [Int] = mixedNSArray as! [Int] // Int 타입이 아닌 값이 있어서 에러 발생

let swiftArrayMixed: [AnyObject] = mixedNSArray as [AnyObject] // 이렇게 사용할 경우의 문제점은?


if let testArrayMixed: [Int] = mixedNSArray as? [Int] {
    // false
 
}

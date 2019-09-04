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


// 프로토콜 작성 문법

protocol TestParticle {
    var name: String { get }
    func particalAsImage() -> NSImage
}

// protocol extension. 소스코드 작성자가 아니더라도 기존 프로토콜의 기능을 확장 할 수 있다
extension Collection {
    func encryptElements(salt: String) -> [Iterator.Element] {
        guard !salt.isEmpty else { return [] }
        guard self.count > 0 else { return [] }
        var index = self.startIndex
        var result: [Iterator.Element] = []
        repeat {
            let el = self[index]
            result.append(el)
            // index = index.successor()
            index = self.index(after: startIndex)
            
        }while (index != self.endIndex)
            return result
        
    }
}

var myArr = [String]()
myArr.append("foo")
var result = myArr.encryptElements(salt: "test")

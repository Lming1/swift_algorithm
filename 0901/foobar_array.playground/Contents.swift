import UIKit

// 기본부터 다시 실습 (2019.09.01)

// Array 기본 선언

var fooArray = Array<Int>()

//단축 선언

var intArray = [Int]()

//배열 저장공간 할당
intArray.capacity
intArray.reserveCapacity(500)
intArray.capacity


// 배열 리터럴 선언
var intLiteralArray:[Int] = [1, 2, 3]


// 기본값 배열 생성(음..)
intLiteralArray = [Int] (repeating: 2, count: 5) // count:5, repeatedValue:2에서 변경됨

var testArray = [Int]()

testArray.append(50)
testArray.append(contentsOf: [60,65,70,75]) // contentsOf 로 변경됨

// 특정 인덱스에 추가할 경우
testArray.insert(55, at: 1)

// 특정 인덱스 교체
testArray[2] = 63

// 특정 범위 요소 가져옴
testArray[2..<5]
testArray[2...5]

var stringArray = [String]()
stringArray.append(contentsOf: ["A", "B", "C", "D"])


// 배열 요소 확인
testArray.contains(55)
stringArray.contains("A")


// Dictionary

// 정식 선언 문법
var testDict = Dictionary<Int, String>()

// 단축
var fooDict: [Int:String] = [1: "Test1", 2: "Test2", 3: "Test3"]

// 추가(updateValue는 nil을 반환한다)
fooDict.updateValue("Test4", forKey: 4)

// 삭제(삭제된 값을 반환하고있다.)
let removedPair = fooDict.removeValue(forKey: 1)

// 딕셔너리 값 가져오기 & 옵셔널 바인딩
var myDict = [1: "Lee", 2: "Ko", 3: "Park"]
if let optResult = myDict[4] {
    print(optResult)
} else {
    print("Key Not Found")
}

// 정렬 예제
let states = ["AL": "Alabama", "CA": "California", "AK": "Alaska", "AZ": "Arizona", "AR": "Arkansas"]

// 1) 키의 값을 기준으로 정렬
let sortedArrayFromDictionary = states.sorted(by: { $0.0 < $1.0}) // sort(_:)에서 변경됨. Developer Document 찾아보기
print(sortedArrayFromDictionary)

for (key) in sortedArrayFromDictionary.map({$0.0}){
    print("Key : \(key)")
}

for (value) in sortedArrayFromDictionary.map({$0.1}) {
    print("Value : \(value)")
}

// 2) Value 기준으로 정렬
let sortedValueFromDictionary = states.sorted(by: { $0.1 < $1.1})
print(sortedValueFromDictionary)


// Set


//var stringSet = Set<String>()
//var stringSet: Set = ["A", "B", "C"]
//print(stringSet.debugDescription)

// Set 변경, 가져오기
var stringSet: Set  = ["Erik", "Mary", "Michael", "John", "Sally"]
stringSet.insert("Patrick")

if stringSet.contains("Erik") {
    print("Found element")
} else {
    print("Element not found")
}

stringSet.remove("Erik")
// index(of:_)에서 왜 firstIndex로 변경된건지.

if let idx = stringSet.firstIndex(of: "John") {
    stringSet.remove(at: idx)
}

stringSet.removeFirst()

stringSet.removeAll()


var fooSet: Set  = ["Erik", "Mary", "Michael", "John", "Sally"]


// set 정렬
for name in fooSet.sorted() {
    print("name = \(name)")
}

// set 연산자

let adminRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "SETTINGS", "PUBLISH_ANY", "ADD_USER", "EDIT_USER", "DELETE_USER"]
let editorRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "PUBLISH_ANY"]
let authorRole: Set = ["READ", "EDIT_OWN", "DELETE_OWN", "PUBLISH_OWN", "CREATE"]
let contributorRole: Set = ["CREATE", "EDIT_OWN"]
let subscriberRole: Set = ["READ"]

// 합집합
let fooResource = subscriberRole.union(contributorRole)
// 교집합
let commonPermissions = authorRole.intersection(contributorRole)
// 여집합
let exclusivePremissions = authorRole.symmetricDifference(contributorRole)




var sourceSet: Set = [1, 2, 3]
var destSet: Set = [2, 1, 3]

import UIKit



// 구조체, 클래스 차이


struct Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Address {
    var street: String = ""
    var city: String = ""
    var state: String = ""
    var zipcode: String = ""
    init(street: String, city: String, state: String, zipcode: String) {
        self.street = street
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
}

// 구조체 인스턴스 생성
let person = Person(firstName: "John", lastName: "Smith")
// person.firstName = "test" // 컴파일 에러 발생

// 클래스 상수 인스턴스 생성
let address = Address(street: "1 Infinite Loop", city: "Jeju", state: "Jeju", zipcode: "63075")

// Address가 래퍼런스 타입, 컴파일 타임 에러 발생하지 않음.
address.city = "Seoul"

// 단, Address 인스턴스가 상수이고, 다른 인스턴스로 전달하는 시점에서는 수정 불가. 컴파일 에러 발생
//address = Address(street: "test", city: "Test", state: "Test", zipcode: "12345")

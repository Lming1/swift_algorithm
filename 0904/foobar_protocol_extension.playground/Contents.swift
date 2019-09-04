import Foundation
import AppKit



struct Particle {
    var name: String
    var symbol: String
    var statistics: String
    
}

// 배열 리터럴 문법 사용해서 구현한 예제 ..


struct ParticleList: ExpressibleByArrayLiteral {
    private let items: [Particle]
    init(arrayLiteral: Particle...) {
        self.items = arrayLiteral
    }
}


var test1 = Particle(name: "test1", symbol: "q", statistics: "test1")
var test2 = Particle(name: "test2", symbol: "w", statistics: "test2")
var test3 = Particle(name: "test3", symbol: "e", statistics: "test3")

var particleList = [test1, test2, test3]


// iterator

public protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Self.Element?
}

// sequence

import AppKit

import Foundation

// Objective-C Message - receiver(메소드 실행 결과를 받게될 대상 객체), selector(메소드의 이름), parameters(메소드에 전달되 실행 될 객체)
// 메시지로 모델을 전달할 떄는 컴파일 시점의 바인딩(complie-time binding)이 아닌 동적 바인딩(dynamic binding)기법을 사용함.
// 이렇게하면 메시지를 미리 구현해놓지 않고, 런타임에 해당 메시지를 구현 및 실행하는 것이 가능해짐

// Objective-C
//NSString *postalCode = [NSString alloc] initWithFormat:@"%d-%d", 32259, 1234];
//postalCode = "32259-1234"
// int len = [postalCode length];

//Swift에서 호출

var postalCode: NSString = NSString(format: "%d-%d", 32259, 1234)
var len = postalCode.length

// 실패 가능 초기화 예제

if let url = NSURLComponents(string: "http://[www].google.com") {
    print("정상 url")
} else {
    print("비정상")
}

// swift에서 실패 가능 초기화 기능 사용해서는 안될 때,

public struct Particle  {
    private var name: String
    private var symbol: String
    private var statistics: String
    private var image: NSImage
}

extension Particle {
    init?(name: String, symbol: String, statistics: String, imageName: String) {
        self.name = name
        self.symbol = symbol
        self.statistics = statistics
        if let image = NSImage(named: imageName) {
            print("initialization succeeded")
            self.image = image
        } else {
            print("initialization failed")
            return nil
        }
    }
}

// testParticle을 초기화 하고자 할 때, test.jpg라는 이름의 이미지 파일을 찾을 수 없음에 따라, testParticle은 nil이 됨...
var testParticle = Particle(name: "test", symbol: "t", statistics: "test", imageName: "test.jpg")

//SOLID 원칙 중, 단일 책임, 의존성 도치 위배
//NSImage 클래스 정보를 얻기 위해 구조체를 서로 연결시킴.
//초기화가 진행되는 동안 요소의 생성에 관여하려한 점
// NSImage 클래스에서 외부 변화에 영향을 받을 수 있는 가능성을 열어뒀다는 점.
// 사용자 입장에서 이미지를 표시할 때 NSImage에 의존된다는 사실도 알 수 없도록 한 점..


public struct TestParticle {
    private var name: String
    private var symbol: String
    private var statistics: String
    private var image: NSImage
    
    public init(name: String, symbol: String, statistics: String, image: NSImage) {
        self.name = name
        self.symbol = symbol
        self.statistics = statistics
        self.image = image
    }
}

extension TestParticle {
    public func particalAsImage() -> NSImage {
        return self.image
    }
}






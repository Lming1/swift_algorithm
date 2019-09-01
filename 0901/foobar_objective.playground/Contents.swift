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


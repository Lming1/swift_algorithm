import UIKit


// 튜플

let responseCode = (4010, "Invalid file contents", 0x21451fff3b)


// index 접근
print(responseCode.0)

// 분할 접근
let (errorCode, errorMessage, offset) = responseCode

print(errorCode)
print(errorMessage)
print(offset)


//명시적 선언.(타입)
let testResponseCode:(errorCode:Int, errorMessage:String, offset:Double) = (4010, "Invalid file contents", 0x8ffffffffffffff)

print(testResponseCode.errorMessage)


// 튜플 메소드 구조

func getPartnerList() -> (statusCode:Int, description:String, metaData: (partnerStatusCode:Int, partnerErrorMessage:String, partnerTraceId:String)) {
    return (503, "Service Unavailable", (32323, "System is down for maintainance until 2019-09-01T00:00:00+09:00", "5A953D9C-7781-427C-BC00-257B2EB98426"))
}

var result = getPartnerList()

print(result)

print(result.statusCode)

print(result.description)

print(result.metaData.partnerErrorMessage)


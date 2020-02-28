import XCTest
@testable import SwiftPack

final class SwiftPackTests: XCTestCase {
    static var allTests = [
        ("testPackingValue", testPackingValue),
    ]
    
    let tests: [(value: Packable, expected: [UInt8], message: String)] = [
        (value: Optional<Bool>(nilLiteral: ()), expected: [0xc0], message: "nil value"),
        
        (value: false, expected: [0xc2], message: "false value"),
        (value: true, expected: [0xc3], message: "true value"),
        
        (value: UInt(0), expected: [0x0], message: "UInt: min positive fixint"),
        (value: UInt(1), expected: [0x1], message: "UInt: positive fixint"),
        (value: UInt(0x7f), expected: [0x7f], message: "UInt: max positive fixint"),
        (value: UInt(0x80), expected: [0xcc, 0x80], message: "UInt: uint 8 min"),
        (value: UInt(0xff), expected: [0xcc, 0xff], message: "UInt: uint 8 max"),
        
        (value: UInt8(0), expected: [0x0], message: "UInt8: min positive fixint"),
        (value: UInt8(1), expected: [0x1], message: "UInt8: positive fixint"),
        (value: UInt8(0x7f), expected: [0x7f], message: "UInt8: max positive fixint"),
        (value: UInt8(0x80), expected: [0xcc, 0x80], message: "UInt8: uint 8 min"),
        (value: UInt8.max, expected: [0xcc, 0xff], message: "UInt8: uint 8 max"),
        
        (value: Int(0), expected: [0x0], message: "Int: min positive fixint"),
        (value: Int(1), expected: [0x1], message: "Int: positive fixint"),
        (value: Int(0x7f), expected: [0x7f], message: "Int: max positive fixint"),
        (value: Int(0x80), expected: [0xcc, 0x80], message: "Int: uint 8 min"),
        (value: Int(0xff), expected: [0xcc, 0xff], message: "Int: uint 8 max"),
        
        (value: Int8(0), expected: [0x0], message: "Int8: min positive fixint"),
        (value: Int8(1), expected: [0x1], message: "Int8: positive fixint"),
        (value: Int8(0x7f), expected: [0x7f], message: "Int8: max positive fixint"),
    ]
    
    func testPackingValue() {
        for t in tests {
            XCTAssertEqual(t.expected, t.value.pack(), t.message)
        }
    }
}

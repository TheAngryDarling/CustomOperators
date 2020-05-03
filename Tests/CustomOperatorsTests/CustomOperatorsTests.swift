import XCTest
@testable import CustomOperators

final class CustomOperatorsTests: XCTestCase {
    
    func testXOR() {
        let a: Bool = true
        let b: Bool = false
        XCTAssertTrue(a ^^ b, "Expected \(a) xor \(b) == true but returned false")
        XCTAssertFalse(a ^^ a, "Expected \(a) xor \(a) == false but returned true")
        XCTAssertFalse(b ^^ b, "Expected \(b) xor \(b) == false but returned true")
    }
    
    func testSmallestOperator() {
        let a: Int = 1
        let b: Int = 2
        let c: Int? = nil
        XCTAssert((a ?< b) == a, "Expected \(a) ?< \(b) == \(a) but returned \((a ?< b))")
        XCTAssert((b ?< a) == a, "Expected \(b) ?< \(a) == \(a) but returned \((b ?< a))")
        XCTAssert((a ??< c) == a, "Expected \(a) ??< \(c as Any) == \(a) but returned \((a ??< c))")
        XCTAssert((c ??< a) == a, "Expected \(c as Any) ??< \(a) == \(a) but returned \((c ??< a))")
        XCTAssert((c ??< c) == c, "Expected \(c as Any) ??< \(c as Any) == \(c as Any) but returned \((c ??< c) as Any)")
    }
    
    func testLargestOperator() {
        let a: Int = 1
        let b: Int = 2
        let c: Int? = nil
        XCTAssert((a ?> b) == b, "Expected \(a) ?> \(b) == \(b) but returned \((a ?> b))")
        XCTAssert((b ?> a) == b, "Expected \(b) ?> \(a) == \(b) but returned \((b ?> a))")
        XCTAssert((a ??> c) == a, "Expected \(a) ??> \(c as Any) == \(a) but returned \((a ??> c))")
        XCTAssert((c ??> a) == a, "Expected \(c as Any) ??> \(a) == \(a) but returned \((c ??> a))")
        XCTAssert((c ??> c) == c, "Expected \(c as Any) ??> \(c as Any) == \(c as Any) but returned \((c ??> c) as Any)")
    }
    
    static var allTests = [
        ("testXOR", testXOR),
        ("testSmallestOperator", testSmallestOperator),
        ("testLargestOperator", testLargestOperator)
    ]
}

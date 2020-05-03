import XCTest
@testable import CustomOperators

final class CustomOperatorsTests: XCTestCase {

    func testXOR() {
        let varA: Bool = true
        let varB: Bool = false
        XCTAssertTrue(varA ^^ varB, "Expected \(varA) xor \(varB) == true but returned false")
        XCTAssertFalse(varA ^^ varA, "Expected \(varA) xor \(varA) == false but returned true")
        XCTAssertFalse(varB ^^ varB, "Expected \(varB) xor \(varB) == false but returned true")
    }

    func testSmallestOperator() {
        let varA: Int = 1
        let varB: Int = 2
        let varC: Int? = nil
        XCTAssert((varA ?< varB) == varA,
                  "Expected \(varA) ?< \(varB) == \(varA) but returned \((varA ?< varB))")
        XCTAssert((varB ?< varA) == varA,
                  "Expected \(varB) ?< \(varA) == \(varA) but returned \((varB ?< varA))")
        XCTAssert((varA ??< varC) == varA,
                  "Expected \(varA) ??< \(varC as Any) == \(varA) but returned \((varA ??< varC))")
        XCTAssert((varC ??< varA) == varA,
                  "Expected \(varC as Any) ??< \(varA) == \(varA) but returned \((varC ??< varA))")
        XCTAssert((varC ??< varC) == varC,
                  "Expected \(varC as Any) ??< \(varC as Any) == \(varC as Any) but returned \((varC ??< varC) as Any)")
    }

    func testLargestOperator() {
        let varA: Int = 1
        let varB: Int = 2
        let varC: Int? = nil
        XCTAssert((varA ?> varB) == varB,
                  "Expected \(varA) ?> \(varB) == \(varB) but returned \((varA ?> varB))")
        XCTAssert((varB ?> varA) == varB,
                  "Expected \(varB) ?> \(varA) == \(varB) but returned \((varB ?> varA))")
        XCTAssert((varA ??> varC) == varA,
                  "Expected \(varA) ??> \(varC as Any) == \(varA) but returned \((varA ??> varC))")
        XCTAssert((varC ??> varA) == varA,
                  "Expected \(varC as Any) ??> \(varA) == \(varA) but returned \((varC ??> varA))")
        XCTAssert((varC ??> varC) == varC,
                  "Expected \(varC as Any) ??> \(varC as Any) == \(varC as Any) but returned \((varC ??> varC) as Any)")
    }

    static var allTests = [
        ("testXOR", testXOR),
        ("testSmallestOperator", testSmallestOperator),
        ("testLargestOperator", testLargestOperator)
    ]
}

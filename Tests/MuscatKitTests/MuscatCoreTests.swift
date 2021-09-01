//
//  MuscatCore.swift
//  
//
//  Created by trick on 2021/09/02.
//

@testable import MuscatKit
import XCTest

final class MuscatCoreTests: XCTestCase {
    func testProcess() {
        let core = MuscatCore()
        XCTAssertEqual(
            core.process(text: "すもももももももものうち"),
            "す\u{2060}も\u{2060}も\u{2060}も\u{200B}も\u{2060}も\u{2060}も\u{200B}も\u{2060}も\u{2060}の\u{200B}う\u{2060}ち"
        )
    }
}

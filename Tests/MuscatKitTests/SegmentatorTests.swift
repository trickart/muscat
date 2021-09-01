//
//  SegmentatorTests.swift
//  
//
//  Created by trick on 2021/08/29.
//

@testable import MuscatKit
import XCTest

final class SegmentatorTests: XCTestCase {
    func testすもも() {
        let segmentator = Segmentator()
        let segments = [
            Segment(text: "すもも", needsJoin: false),
            Segment(text: "も", needsJoin: true),
            Segment(text: "もも", needsJoin: false),
            Segment(text: "も", needsJoin: true),
            Segment(text: "もも", needsJoin: false),
            Segment(text: "の", needsJoin: true),
            Segment(text: "うち", needsJoin: false)
        ]
        XCTAssertEqual(segmentator.segment(text: "すもももももももものうち"), segments)
    }

    func test人間失格() {
        let segmentator = Segmentator()
        let segments = [
            Segment(text: "私", needsJoin: false),
            Segment(text: "は", needsJoin: true),
            Segment(text: "、", needsJoin: true),
            Segment(text: "その", needsJoin: false),
            Segment(text: "男", needsJoin: false),
            Segment(text: "の", needsJoin: true),
            Segment(text: "写真", needsJoin: false),
            Segment(text: "を", needsJoin: true),
            Segment(text: "三", needsJoin: false),
            Segment(text: "葉", needsJoin: true),
            Segment(text: "、", needsJoin: true),
            Segment(text: "見", needsJoin: false),
            Segment(text: "た", needsJoin: true),
            Segment(text: "こと", needsJoin: false),
            Segment(text: "が", needsJoin: true),
            Segment(text: "ある", needsJoin: false),
            Segment(text: "。", needsJoin: true)
        ]
        XCTAssertEqual(segmentator.segment(text: "私は、その男の写真を三葉、見たことがある。"), segments)
    }

    func test括弧() {
        let segmentator = Segmentator()
        let segments = [
            Segment(text: "「", needsJoin: false),
            Segment(text: "こころ", needsJoin: true),
            Segment(text: "」", needsJoin: true)
        ]
        XCTAssertEqual(segmentator.segment(text: "「こころ」"), segments)
    }
}

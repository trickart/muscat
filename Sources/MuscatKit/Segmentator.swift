//
//  Segmentator.swift
//  
//
//  Created by trick on 2021/08/25.
//

import Foundation
import MeCabObjC
import MeCabIPAdic

public final class Segmentator {
    let tagger: Tagger

    public init(tagger: Tagger = Tagger(url: MeCabIPAdic.url)) {
        self.tagger = tagger
    }

    func segment(text: String) -> [Segment] {
        let nodes = tagger.parseNode(text)
        var segments = [Segment]()
        var carry = false
        for node in nodes {
            if let surface = node.surface,
               let feature = node.feature {
                segments.append(Segment(text: surface, needsJoin: carry || needToJoinBefore(feature: feature)))
                carry = needsToJoinAfter(feature: feature)
            }
        }
        return segments
    }

    private func needToJoinBefore(feature: String) -> Bool {
        !Self.joinBeforeFeatures.filter { feature.hasPrefix($0) }.isEmpty
    }

    private func needsToJoinAfter(feature: String) -> Bool {
        !Self.joinAfterFeatures.filter { feature.hasPrefix($0) }.isEmpty
    }
}

extension Segmentator {
    // left-id.defから抜粋
    static let joinBeforeFeatures = [
        "記号,括弧閉",
        "記号,句点",
        "記号,読点",
        "形容詞,接尾",
        "助詞",
        "助動詞",
        "動詞,接尾",
        "名詞,接尾"
    ]

    static let joinAfterFeatures = [
        "記号,括弧開"
    ]
}

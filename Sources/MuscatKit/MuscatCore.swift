import Foundation

public final class MuscatCore {
    let segmentator: Segmentator

    public init(segmentator: Segmentator = Segmentator()) {
        self.segmentator = segmentator
    }

    public func process(text: String) -> String {
        let segments = segmentator.segment(text: text)
        var joined = [String]()
        segments.forEach { segment in
            if segment.needsJoin {
                let lastIndex = joined.count - 1
                let last = joined[lastIndex]
                joined[lastIndex] = last + segment.text
            } else {
                joined.append(segment.text)
            }
        }
        return joined.map { text in
            text.map { String($0) }.joined(separator: "\u{2060}")
        }
        .joined(separator: "\u{200B}")
    }
}

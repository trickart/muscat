import ArgumentParser
import Foundation
import MuscatKit

struct Muscat: ParsableCommand {
    struct Path: ExpressibleByArgument {
        let url: URL

        init(argument: String) {
            self.url = URL(fileURLWithPath: argument)
        }
    }

    @Argument(help: "Path to input strings file.")
    var inputPath: Path
    @Argument(help: "Path to output strings file.")
    var outputPath: Path

    mutating func run() throws {
        do {
            let strings = try readStrings(input: inputPath.url)
            let core = MuscatCore()
            let processed = strings.mapValues { core.process(text: $0) }
            try writeStrings(strings: processed, output: outputPath.url)
        } catch {
            print(error)
        }
    }

    private func readStrings(input: URL) throws -> [String: String] {
        let stringsFile = try Data(contentsOf: input)
        return try PropertyListDecoder().decode([String: String].self, from: stringsFile)
    }

    private func writeStrings(strings: [String: String], output: URL) throws {
        var lines = ""
        strings.forEach { key, value in
            lines.append("\"\(key)\" =  \"\(value)\";\n")
        }
        try lines.write(to: output, atomically: false, encoding: .utf8)
    }
}

Muscat.main()

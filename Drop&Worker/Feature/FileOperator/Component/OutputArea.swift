import Foundation
import SwiftUI

public struct OutputArea: View {
    let outputFileNames: [String]
    let onClear: () -> Void
    
    init(outputFileNames: [String], onClear: @escaping () -> Void = {}) {
        self.outputFileNames = outputFileNames
        self.onClear = onClear
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                HStack {
                    Spacer()
                    Button("Clear") {
                        onClear()
                    }
                }
                List(outputFileNames, id: \.self) { fileName in
                    Text(fileName)
                        .onDrag {
                            let fileURL = Manager.fileIO.outputDirectoryURL.appendingPathComponent(fileName)
                            guard let itemProvider = NSItemProvider(contentsOf: fileURL) else {
                                return NSItemProvider()
                            }
                            return itemProvider
                        }
                }
            }
        }
    }
}

#Preview {
    OutputArea(outputFileNames: ["hoge", "fuga"], onClear: {print("clear")})
        .padding()
}

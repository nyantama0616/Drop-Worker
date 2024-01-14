import Foundation
import SwiftUI

public struct OutputArea: View {
    let outputFileNames: [String]
    
    init(outputFileNames: [String]) {
        self.outputFileNames = outputFileNames
    }
    
    public var body: some View {
        VStack {
            Text("Outputs")
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

#Preview {
    OutputArea(outputFileNames: ["hoge", "fuga"])
        .padding()
}

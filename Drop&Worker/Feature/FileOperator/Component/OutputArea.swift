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
            }
        }
        .onAppear() {
            print(outputFileNames)
        }
    }
}

import Foundation
import SwiftUI

public struct FileOperatorView: View {
    @ObservedObject var viewModel: FileOperatorViewModel
    
    public var body: some View {
        HStack {
            DropArea()
                .frame(width: 200, height: 200)
                .onDrop(of: [.fileURL], delegate: viewModel.dropDelegate)
            OutputArea(outputFileNames: viewModel.outputFileNames, onClear: viewModel.clearOutputs)
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    FileOperatorView(viewModel: FileOperatorViewModel())
        .padding()
}

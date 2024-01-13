import Foundation
import SwiftUI

public struct FileOperatorView: View {
    @ObservedObject var viewModel: FileOperatorViewModel
    
    public var body: some View {
        VStack {
            Text("Drop a File!")
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
        }
        .onDrop(of: [.fileURL], delegate: viewModel.dropDelegate)
    }
}

#Preview {
    FileOperatorView(viewModel: FileOperatorViewModel())
        .padding()
}


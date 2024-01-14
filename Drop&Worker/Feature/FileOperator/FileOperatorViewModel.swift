//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

public class FileOperatorViewModel: ObservableObject {
    @Published private var model: FileOperatorModel = FileOperatorModel()
    
    var outputFileNames: [String] {
        model.outputFileNames
    }

    func clearOutputs() {
        model.clearOutputs()
    }
    
    var dropDelegate: FileOperatorDropDelegate = FileOperatorDropDelegate()

    init() {
        dropDelegate.fileFunc = { [weak self] url in
            self?.model.createFileWithName(fileURL: url) //TODO: なんで「？」が必要なのか調べる
        }
    }
}

struct FileOperatorDropDelegate: DropDelegate {
    var fileFunc: (URL) -> () = { _ in }

    //TODO: この関数、動いてるけどよく分かってない
    func performDrop(info: DropInfo) -> Bool {
        guard let itemProviders = info.itemProviders(for: ["public.file-url"]) as? [NSItemProvider] else {
            return false
        }

        for (_, itemProvider) in itemProviders.enumerated() {
            itemProvider.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
                if let error = error {
                    print("Error loading item: \(error)")
                } else if let urlData = urlData as? Data, let url = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL? {
                    DispatchQueue.main.async {
                        fileFunc(url)
                    }
                } else {
                    print("Couldn't get URL from item")
                }
            }
        }

        return true
    }

    func dropEntered(info: DropInfo) {
        print("Drop entered")
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .copy)
    }

    func dropExited(info: DropInfo) {
        print("Drop exited")
    }
}

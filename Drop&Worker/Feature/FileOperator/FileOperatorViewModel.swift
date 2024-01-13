//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

public class FileOperatorViewModel: ObservableObject {
    var dropDelegate: FileOperatorDropDelegate = FileOperatorDropDelegate()

    init() {
        dropDelegate.fileFunc = { [weak self] url in
            self?._addName(fileURL: url)
        }
    }

    private func _addName(fileURL: URL) {
        let name = "中北竜馬" //TODO: 設定可能にする
        
        let fileNameWithoutExtension = fileURL.deletingPathExtension().lastPathComponent
        let fileExtension = fileURL.pathExtension
        
        let destinationFileName = "\(fileNameWithoutExtension)_\(name).\(fileExtension)"
        let destinationURL = Manager.fileIO.outputDirectoryURL.appendingPathComponent(destinationFileName)

        do {
            try FileManager.default.copyItem(at: fileURL, to: destinationURL)
            print("Copied file to: \(destinationURL)")
        } catch {
            print("Error copying file: \(error)")
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

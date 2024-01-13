import Foundation

public struct FileIO {
    let outputDirectoryURL: URL
    
    //TODO: initはいつ呼ばれるの？
    public init() {
        outputDirectoryURL = Foundation.FileManager.default.temporaryDirectory.appendingPathComponent("output")
        
        // Create output directory if it doesn't exist
        let fileManager = Foundation.FileManager.default
        if !fileManager.fileExists(atPath: outputDirectoryURL.path) {
            do {
                try fileManager.createDirectory(at: outputDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory: \(error)")
            }
        }
    }
}

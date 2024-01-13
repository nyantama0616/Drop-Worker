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

    public func getOutputFileNames() -> [String] {
        let fileManager = Foundation.FileManager.default
        do {
            let outputFiles = try fileManager.contentsOfDirectory(at: outputDirectoryURL, includingPropertiesForKeys: nil)
            let fileNames = outputFiles.map { $0.lastPathComponent }
            return fileNames
        } catch {
            print("Error getting output files: \(error)")
            return []
        }
    }
}

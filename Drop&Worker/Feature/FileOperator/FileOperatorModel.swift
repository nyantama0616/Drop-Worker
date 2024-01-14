import Foundation

public struct FileOperatorModel {
    private(set) var outputFileNames: [String] = []

    public init() {
        clearOutputs()
    }

    //ファイル名の末尾に名前を追加する
    public mutating func createFileWithName(fileURL: URL) {
        let name = "中北竜馬" //TODO: 設定可能にする
        
        let fileNameWithoutExtension = fileURL.deletingPathExtension().lastPathComponent
        let fileExtension = fileURL.pathExtension
        
        let destinationFileName = "\(fileNameWithoutExtension)_\(name).\(fileExtension)"
        let destinationURL = Manager.fileIO.outputDirectoryURL.appendingPathComponent(destinationFileName)

        do {
            try FileManager.default.copyItem(at: fileURL, to: destinationURL)
            self.outputFileNames.append(destinationFileName) //TODO: 現状appendしてるが、アルファベット順になるようにするかも
            print("Copied file to: \(destinationURL)")
        } catch {
            print("Error copying file: \(error)")
        }
    }
    
    public mutating func clearOutputs() {
        Manager.fileIO.clearOutputs() //TODO: エラーハンドリングするべきか？
        self.outputFileNames = Manager.fileIO.getOutputFileNames()
    }   
}

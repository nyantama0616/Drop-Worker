import Foundation

public struct FileOperatorModel {
    private(set) var outputFileNames: [String] = []

    init() {
        self.updateOutputFileNames()
    }

    //TODO: おそらくoutputにファイルを追加する処理もここに書くべき
    public mutating func updateOutputFileNames() {
        self.outputFileNames = Manager.fileIO.getOutputFileNames()
    }
}

import Foundation
import SwiftUI

public struct DropArea: View {
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .cornerRadius(10)
            Text("Drop a File!")
                .foregroundColor(.white)
                .padding()
        }
    }
}

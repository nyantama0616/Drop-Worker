import Foundation
import SwiftUI

public struct CounterModel {
    private(set) var count: Int = 0
    
    public mutating func increment() {
        count += 1
    }
}

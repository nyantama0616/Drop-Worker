//

import Foundation
import SwiftUI

public class CounterViewModel: ObservableObject {
    @Published private var model: CounterModel = CounterModel()
    
    var count: Int {
        model.count
    }
    
    public func increment() {
        model.increment()
    }
}

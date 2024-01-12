import SwiftUI

public struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel
    
    public var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
            Button("Increment") {
                viewModel.increment()
            }
        }
    }
}

#Preview {
    CounterView(viewModel: CounterViewModel())
}

//
//  ContentView.swift
//  Drop&Worker
//
//  Created by Nyantama on 2024/01/10.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(String(count))
            Button(action: {count += 1}) {
                Text("Count Up")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  FlipAnimationSwiftUI
//
//  Created by Sandra Gomez on 5/27/24.
//

import SwiftUI

private class Counter: ObservableObject {
    private var timer: Timer?
    
    @Published var value: Int = 0
    
    init(interval: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {_ in self.value += 1 }
    }
}

struct ContentView: View {
    private let images = (1...8).map { String(format: "bear%01d", $0)}.map {Image($0)}
    
    @ObservedObject private var counter = Counter(interval: 0.1)
    
    var body: some View {
        VStack {
            images[counter.value % images.count]
        }
    }
}

#Preview {
    ContentView()
}

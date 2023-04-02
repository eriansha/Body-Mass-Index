//
//  ContentView.swift
//  Body Mass Index
//
//  Created by Ivan on 20/03/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State private var index = 0
    @State private var weight = 70.0
    @State private var height = 150.0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $index) {
                    Text("Calculator").tag(0)
                    Text("History").tag(1)
                }
                .pickerStyle(.segmented)
                
                if index == 0 {
                    CalculatorView(
                        weight: $weight,
                        height: $height
                    )
                } else {
                    HistoryView()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .navigationTitle(Text("Body Mass index"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  ContentView.swift
//  Body Mass Index
//
//  Created by Ivan on 20/03/23.
//

import SwiftUI
import CoreData

enum Tab {
    case calculator
    case histories
}

struct ContentView: View {
    @State private var selectedTab: Tab = .calculator
    @State private var weight = 70.0
    @State private var height = 150.0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedTab) {
                    Text("Calculator").tag(Tab.calculator)
                    Text("History").tag(Tab.histories)
                }
                .pickerStyle(.segmented)
                
                if selectedTab == Tab.calculator {
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


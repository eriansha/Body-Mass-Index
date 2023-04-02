//
//  CalculatorView.swift
//  Body Mass Index
//
//  Created by Ivan on 02/04/23.
//

import SwiftUI

struct CalculatorView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var weight: Double
    @Binding var height: Double
    
    @State private var score: Double
    
    init(weight: Binding<Double>, height: Binding<Double>) {
        self._weight = weight
        self._height = height
        
        self._score = State(initialValue: BmiController.calculateScore(
            weight: weight.wrappedValue,
            height: height.wrappedValue
        ))
    }
    
    func addItem() {
        BmiController().addBmi(
            weight: weight,
            height: height,
            context: managedObjectContext
        )
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Weight (kg)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g", weight.rounded()))")
                    .font(.title2)
                    .bold()
            }.padding(.top, 30)
            
            Slider(value: $weight, in: 45...120)
                .onChange(of: weight) { newWeight in
                    score = BmiController.calculateScore(
                        weight: newWeight,
                        height: height
                    )
                }
            
            HStack {
                Text("Height (cm)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g", height.rounded()))")
                    .font(.title2)
                    .bold()
            }.padding(.top, 20)
            
            Slider(value: $height, in: 100...200)
                .onChange(of: height) { newHeight in
                    score = BmiController.calculateScore(
                        weight: weight,
                        height: newHeight
                    )
                }
            
            HStack {
                Text("Your Body Mass Index")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(String(format: "%.2f", score))
                        .font(.title)
                        .bold()
                    
                    Text(BmiController.getScale(score: score))
                        .font(.body)
                        .foregroundColor(BmiController.getScaleColor(score: score))
                }
            }.padding(.top, 20)
            
            Button {
                addItem()
            } label: {
                Text("Save to history")
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 32
                    )
            }
            .background(.blue)
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.top, 20)
            
            Spacer()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(
            weight: .constant(60.0),
            height: .constant(150.0)
        )
    }
}

//
//  HistoryView.swift
//  Body Mass Index
//
//  Created by Ivan on 02/04/23.
//

import SwiftUI

struct HistoryView: View {
    @FetchRequest(
        entity: BodyMassIndex.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \BodyMassIndex.date, ascending: false)
        ]
    ) var histories: FetchedResults<BodyMassIndex>
    
    var body: some View {
        if histories.isEmpty {
            VStack {
                Spacer()
                
                Text("No Record")
                
                Spacer()
            }
        } else {
            List(histories) { bmi in
                VStack(alignment: .leading) {
                    if let unwrappedDate = bmi.date {
                        Text("\(unwrappedDate.formatted(date: .abbreviated, time: .shortened))")
                            .foregroundColor(.gray)
                    } else{
                        Text("-")
                    }
                    
                    HStack {
                        Text(String(format: "%.2f", bmi.result))
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Text("\(BmiController.getScale(score: bmi.result))")
                            .font(.title2)
                            .foregroundColor(BmiController.getScaleColor(score: bmi.result))
                    }
                    .padding(.top, -4)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

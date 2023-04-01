//
//  HistoryView.swift
//  Body Mass Index
//
//  Created by Ivan on 02/04/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var savedHistories: [Bmi]
    
    var body: some View {
        if savedHistories.isEmpty {
            VStack {
                Spacer()
                
                Text("No Record")
                
                Spacer()
            }
        } else {
            List(savedHistories) { bmi in
                VStack(alignment: .leading) {
                    Text("\(bmi.date.formatted(date: .abbreviated, time: .shortened))")
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text(String(format: "%.2f", bmi.result))
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Text("\(Bmi.getScale(score: bmi.result))")
                            .font(.title2)
                            .foregroundColor(Bmi.getScaleColor(score: bmi.result))
                    }
                    .padding(.top, -4)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(savedHistories: .constant([
        ]))
    }
}

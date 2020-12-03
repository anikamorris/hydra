//
//  WaterTrackerView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/30/20.
//

import SwiftUI

struct WaterTrackerView: View {
    @State private var ounces: Double = 0
    var body: some View {
        VStack {
            Text("How much water did you drink?")
                .fontWeight(.semibold)
                .foregroundColor(.darkBlue)
                .font(.system(size: 20.0))
                .padding()
            Text("\(Int(ounces))oz")
                .fontWeight(.semibold)
                .foregroundColor(.darkBlue)
                .font(.system(size: 30.0))
            Slider(value: $ounces, in: 0...100, step: 1.0)
                .padding()
        }
    }
}

struct WaterTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerView()
    }
}

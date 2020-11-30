//
//  WaterTrackerView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/30/20.
//

import SwiftUI

struct WaterTrackerView: View {
    var body: some View {
        Rectangle()
            .trim(from: 0, to: 0.5)
            .fill(Color.medLightBlue)
    }
}

struct WaterTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerView()
    }
}

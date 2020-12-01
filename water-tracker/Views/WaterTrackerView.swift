//
//  WaterTrackerView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/30/20.
//

import SwiftUI

struct WaterTrackerView: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Circle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.medLightBlue, lineWidth: 20)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .onReceive(timer) { _ in
                withAnimation {
                    guard self.completionAmount < 1 else { return }
                    self.completionAmount += 0.8
                }
            }
    }
}

struct WaterTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerView()
    }
}

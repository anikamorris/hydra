//
//  SetIntakeView.swift
//  water-tracker
//
//  Created by Anika Morris on 12/3/20.
//

import SwiftUI

struct SetIntakeView: View {
    @State private var weight = 0.0
    @State private var minOfExercise = 0.0
    @State private var isShowingHome = false
    @State private var goal: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.lightBlue.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading) {
                    Text("How much do you weigh?")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.title3)
                    Text("\(Int(weight))lbs")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.system(size: 30.0))
                        .padding()
                    Slider(value: $weight, in: 80...400, step: 1.0)
                        .padding()
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("How much will you exercise today?")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.title3)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                    Text("\(Int(minOfExercise)) minutes")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.system(size: 30.0))
                        .padding()
                    Slider(value: $minOfExercise, in: 0...200, step: 1.0)
                        .padding()
                }
                .padding()
                Button("Next") {
                    let waterIntake = WaterIntake(weight: weight, minutesOfExercise: minOfExercise)
                    goal = CGFloat(waterIntake.calculate())
                    isShowingHome = true
                }
                NavigationLink(destination: HomeView(goal: $goal), isActive: $isShowingHome) { EmptyView() }
            }
            .padding()
        }
    }
}

struct SetIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        SetIntakeView()
    }
}

//
//  ContentView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/29/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("hydra-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 90, alignment: .center)
            Spacer()
            Image("water-drop")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text("Your body needs water!")
                .fontWeight(.semibold)
                .foregroundColor(.skyBlue)
                .font(.system(size: 20))
            Text("Track your daily water intake in just a few taps.")
                .font(.system(size: 17))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Get Started") {
                print("starting")
            }
                .foregroundColor(.white)
                .padding()
                .frame(width: 250, height: 50, alignment: .center)
                .background(Color.skyBlue)
                .cornerRadius(8)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

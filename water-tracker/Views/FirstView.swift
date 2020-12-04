//
//  ContentView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/29/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingDetailView = false
    
    var body: some View {
        NavigationView {

            VStack {
                Image("hydra-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 90, alignment: .center)
                    .offset(x: 0, y: -50.0)
                Spacer()
                Image("water-drop")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 0, y: -40.0)
                Text("Your body needs water!")
                    .fontWeight(.semibold)
                    .foregroundColor(.skyBlue)
                    .font(.system(size: 20))
                    .offset(x: 0, y: -30.0)
                Text("Track your daily water intake.")
                    .font(.system(size: 17))
                    .foregroundColor(.secondary)
                    .offset(x: 0, y: -30.0)
                Spacer()
                NavigationLink(destination: SetIntakeView(), isActive: $isShowingDetailView) { EmptyView() }
                Button("Get Started") {
                    self.isShowingDetailView = true
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

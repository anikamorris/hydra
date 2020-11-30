//
//  HomeView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/29/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("wave")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Stay Hydrated")
                            .fontWeight(.bold)
                            .foregroundColor(.darkBlue)
                            .font(.system(size: 30))
                        Text("Track your water intake")
                            .foregroundColor(.darkBlue)
                    }
                    .padding()
                    Spacer()
                }
                .offset(x: 0, y: -50.0)
            }
            .edgesIgnoringSafeArea(.all)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Goal")
                        .foregroundColor(.secondary)
                        .font(.system(size: 15))
                    Text("125oz")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.title3)
                }
                .padding(.trailing, 15)
                VStack(alignment: .leading) {
                    Text("Completed")
                        .foregroundColor(.secondary)
                        .font(.system(size: 15))
                    Text("90%")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.title3)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

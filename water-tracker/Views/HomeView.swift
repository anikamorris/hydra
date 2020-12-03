//
//  HomeView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/29/20.
//

import SwiftUI

struct HomeView: View {
    @State private var completionAmount: CGFloat = 0.9
    @State var showingDetail = false

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
                VStack(alignment: .center) {
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
                    .offset(x: 0, y: -75.0)
                    Image("water-drops")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 0.0, y: -60.0)
                    Text("Almost there!")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.title3)
                        .offset(x: 0.0, y: -40.0)
                    ZStack {
                        Circle()
                            .trim(from: 0, to: completionAmount)
                            .stroke(Color.medLightBlue, lineWidth: 15)
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(-90))
                            .padding()
                        Text("112oz")
                            .foregroundColor(.darkBlue)
                            .fontWeight(.bold)
                            .font(.title3)
                    }
                    .offset(x: 0, y: -40.0)
                    Spacer()
                }
                .padding()
                ZStack {
                    Rectangle()
                        .foregroundColor(.lightBlue)
                        .frame(width: 80, height: 300, alignment: .center)
                        .overlay(
                              Rectangle()
                                .foregroundColor(.skyBlue)
                                // height is 300px, so to get the offset no matter the height of the overlay, we multiply 300 by the completion amount and set the y offset to half of the difference
                                .frame(width: 80, height: 270, alignment: .bottom)
                                .offset(y: 15)
                        )
                        .cornerRadius(8.0)
                        .padding()
                        .offset(x: -5.0, y: -60.0)
                    Button(action: {
                        self.showingDetail.toggle()
                    }) {
                        Text("+")
                            .font(.system(size: 35.0))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }.sheet(isPresented: $showingDetail) {
                        WaterTrackerView()
                    }
                    .offset(x: -5.0, y: -60.0)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension Shape {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

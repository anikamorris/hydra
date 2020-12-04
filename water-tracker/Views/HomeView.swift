//
//  HomeView.swift
//  water-tracker
//
//  Created by Anika Morris on 11/29/20.
//

import SwiftUI

struct HomeView: View {
    @State private var completionAmount: CGFloat = 0.8
    @State var showingDetail = false
    @Binding var goal: CGFloat
    
    private func completionToPercent() -> String {
        let percent = Int(completionAmount * 100)
        return "\(percent)%"
    }
    
    private func completionToOz() -> String {
        let oz = Int(goal * completionAmount)
        return "\(oz)oz"
    }
    
    private func completionToHeight() -> CGFloat {
        return 300 * completionAmount
    }
    
    // height is 300px, so to get the offset no matter the height of the overlay, we multiply 300 by the completion amount and set the y offset to half of the difference
    private func overlayOffset() -> CGFloat {
        let height = completionToHeight()
        let difference = 300 - height
        return difference / 2
    }
    
    private func inspirationText() -> String {
        if completionAmount < 0.05 {
            return "Start hydrating!"
        } else if completionAmount < 0.5 {
            return "Keep going!"
        } else if completionAmount < 0.85 {
            return "You're doing great!"
        } else if completionAmount < 1.0 {
            return "Almost there!"
        } else {
            return "You did it!"
        }
    }

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
                            Text("\(Int(goal))oz")
                                .foregroundColor(.darkBlue)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                        .padding(.trailing, 15)
                        VStack(alignment: .leading) {
                            Text("Completed")
                                .foregroundColor(.secondary)
                                .font(.system(size: 15))
                            Text("\(completionToPercent())")
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
                    Text("\(inspirationText())")
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .font(.system(size: 15.0))
                        .offset(x: 0.0, y: -50.0)
                    ZStack {
                        Circle()
                            .trim(from: 0, to: completionAmount)
                            .stroke(Color.medLightBlue, lineWidth: 15)
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(-90))
                            .padding()
                        Text("\(completionToOz())")
                            .foregroundColor(.darkBlue)
                            .fontWeight(.bold)
                            .font(.title3)
                    }
                    .offset(x: 0, y: -50.0)
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
                                .frame(width: 80, height: completionToHeight(), alignment: .bottom)
                                .offset(y: overlayOffset())
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
                        WaterTrackerView(isPresented: self.$showingDetail)
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

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(goal: 125)
//    }
//}

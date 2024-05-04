//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Kamal on 04/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color(.lightBlue)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Cairo, Eg")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    Text("33°")
                        .font(.system(size: 70, weight: .bold))
                        .foregroundStyle(Color.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 33)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.fill", temperature: 29)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 36)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 35)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 33)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.rain.fill", temperature: 29)
                    WeatherDayView(dayOfWeek: "MON", imageName: "wind", temperature: 24)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName:String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Kamal on 04/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cairo, EG")
                
                MainStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 33)
                
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill",  temperature: 33)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.fill",      temperature: 29)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill",    temperature: 36)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill",    temperature: 35)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill",    temperature: 33)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.rain.fill", temperature: 29)
                    WeatherDayView(dayOfWeek: "MON", imageName: "wind",            temperature: 24)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    MainButton(title: isNight ? "Day" : "Night",
                               textColor: isNight ? .blue : .white,
                               backgroundColor: isNight ? .white : .yellow)
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
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.white, .yellow, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                   isNight ? .gray : .lightBlue]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.gray.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold))
                .foregroundStyle(Color.white)
        }
        .padding(.bottom, 40)
    }
}




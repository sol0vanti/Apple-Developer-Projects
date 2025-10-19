//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Alex Balla on 19.10.2025.
//

import SwiftUI

struct ContentView: View {
    let highArray: [Int] = [18, 12, 9, 14, 20, 21, 19]
    let lowArray: [Int] = [15, 7, 6, 12, 15, 17, 15]
    let isRainyArray: [Bool] = [false, true, true, false, false, false, false]
    let humidityArray: [Int] = [27, 84, 91, 31, 11, 19, 71]
    
    private func average(of array: [Int]) -> Int {
        guard !array.isEmpty else { return 0 }
        let total = array.reduce(0, +)
        return total / array.count
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        DayForecast(day: "Mon", high: highArray[0], low: lowArray[0], isRainy: isRainyArray[0], humidity: humidityArray[0])
                        DayForecast(day: "Tue", high: highArray[1], low: lowArray[1], isRainy: isRainyArray[1], humidity: humidityArray[1])
                        DayForecast(day: "Wed", high: highArray[2], low: lowArray[2], isRainy: isRainyArray[2], humidity: humidityArray[2])
                        DayForecast(day: "Thu", high: highArray[3], low: lowArray[3], isRainy: isRainyArray[3], humidity: humidityArray[3])
                        DayForecast(day: "Fri", high: highArray[4], low: lowArray[4], isRainy: isRainyArray[4], humidity: humidityArray[4])
                        DayForecast(day: "Sat", high: highArray[5], low: lowArray[5], isRainy: isRainyArray[5], humidity: humidityArray[5])
                        DayForecast(day: "Sun", high: highArray[6], low: lowArray[6], isRainy: isRainyArray[6], humidity: humidityArray[6])
                    }
                }
                
                let avgHumidity = average(of: humidityArray)
                let avgHigh = average(of: highArray)
                let avgLow = average(of: lowArray)
                let rainyDays = isRainyArray.filter { $0 }.count
                let sunnyDays = isRainyArray.count - rainyDays
                
                WeekForecast(
                    avgHumidity: avgHumidity,
                    avgHigh: avgHigh,
                    avgLow: avgLow,
                    sunnyDays: sunnyDays,
                    rainyDays: rainyDays
                )
            }
            .navigationTitle("Weather Forecast")
        }
    }
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let isRainy: Bool
    let humidity: Int
    
    var highColor: Color {
        if high >= 16 {
            return Color.orange
        } else {
            return Color.cyan
        }
    }
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
                .fontWeight(Font.Weight.heavy)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(3)
            Text("Humidity: \(humidity)%")
                .fontWeight(Font.Weight.semibold)
            Text("High: \(high)°C")
                .fontWeight(Font.Weight.semibold)
                .foregroundStyle(highColor)
            Text("Low: \(low)°C")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let avgHumidity: Int
    let avgHigh: Int
    let avgLow: Int
    let sunnyDays: Int
    let rainyDays: Int
    
    var body: some View{
        VStack {
            Text("Avg humidity: \(avgHumidity)%")
                .font(Font.title)
            Text("Avg high: \(avgHigh)°C")
                .font(Font.title)
            Text("Avg low: \(avgLow)°C")
                .font(Font.title)
            Text("Sunny days: \(sunnyDays)")
                .font(Font.title)
            Text("Rainy days: \(rainyDays)")
                .font(Font.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

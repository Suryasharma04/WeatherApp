//
//  WeatherView.swift
//  MainWeatherApp
//
//  Created by Surya Sharma on 6/23/23.
//

import SwiftUI

struct WeatherView: View {
    
    var weather:  ResponseBody
    
    var body: some View {
        ZStack{
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().year().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        
                        VStack(spacing: 20){
                            Image(systemName: "sun.max.fill")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
//                    Image("ny")
//                        .resizable()
//                        .frame(width: .infinity, height: 200)
//                        .scaledToFit()
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() +  "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.wind.speed.roundDouble() +  "°"))
                        
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.main.tempMin.roundDouble() +  "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() +  "%"))
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
//        .background(.cyan)
        .background(LinearGradient(colors: [.blue, .cyan, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

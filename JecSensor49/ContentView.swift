//
//  ContentView.swift
//  FesSample
//
//  Created by cmStudent on 2022/08/08.
//
import SwiftUI

struct ContentView: View {
    init(){
        //TabViewの背景色の設定（青色）
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.circle")
                        Text("home")
                    }
                }.tag(1)
            
            SensorView()
                .tabItem {
                    VStack {
                        Image(systemName: "sensor.tag.radiowaves.forward")
                        Text("AR")
                    }
                }.tag(2)
        .accentColor(.blue)
    }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

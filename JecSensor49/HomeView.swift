//
//  HomeView.swift
//  JecSensor49
//
//  Created by cmStudent on 2022/08/30.
//

import SwiftUI

struct HomeView: View {
    
    @State private var playerSize: CGSize = .zero
    @State private var selected: Video = .jec
    
    var body: some View {
        VStack {
            
            Image("logo1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            
            PlayerView(video: $selected)
                .frame(
                    width: playerSize.width,
                    height: playerSize.height
                )
            
            Picker("動画の選択", selection: $selected) {
                ForEach(Video.allCases, id: \.self) { video in
                    Text(video.rawValue.uppercased())
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .onAppear {
            // windowサイズからplayerサイズを算出.
            let frame = UIApplication.shared.windows.first?.frame ?? .zero
            
            //縦横比16:9
            playerSize = CGSize(
                width: frame.width,
                height: frame.width / 16 * 9
            )
        }
    }
}

enum Video: String, CaseIterable {
    
    case jec
    case voice
    case international
    
    var videoId: String {
        switch self {
        case .jec: return "ktEgR3-5UYI"
        case .voice: return "Yo2RFm_MJ4s"
        case .international: return "mzTWfDwun50"
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

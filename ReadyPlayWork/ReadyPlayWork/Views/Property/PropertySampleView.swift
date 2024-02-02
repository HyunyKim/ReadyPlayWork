//
//  PropertySampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/28.
//

import SwiftUI

struct Episode {
    var title: String
}

struct PlayButton: View {
    
    var isPlaying: Bool
    
    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
//            isPlaying.toggle()
        }.foregroundStyle(.random)
    }
}

struct PlayerVIew: View {
    var episode: Episode
    @Binding var isPlaying: Bool
    
    var body: some View {
        VStack {
            Text(episode.title)
                .foregroundStyle(isPlaying ? .primary : .secondary)
                .foregroundStyle(.random)
            PlayButton(isPlaying: isPlaying)
        }
    }
}

struct MyView: View {
    
    @State private var isPlaying1: Bool = false
    @State private var isPlaying2: Bool = false
    
    var body: some View {
        VStack(spacing: 50, content: {
            PlayerVIew(episode: Episode(title: "NewJeans - ETA"), isPlaying: $isPlaying1)
            PlayerVIew(episode: Episode(title: "NewJeans - ETA"), isPlaying: $isPlaying2)
            
            Button(isPlaying1 ? "MyView Playing" : "MyView Pause") {
                isPlaying1.toggle()
            }.foregroundStyle(.random)
        })
    }
}


struct PropertySampleView: View {
    var body: some View {
         VStack {
             MyView()
         }
         .padding()
     }
}

extension ShapeStyle where Self == Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        PropertySampleView()
    }
}

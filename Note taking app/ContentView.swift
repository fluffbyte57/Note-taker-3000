//
//  ContentView.swift
//  Note taking app
//
//  Created by Yacov Vladimirovich on 7/21/26.
//  ooooo cool project awesome sauce


// i have no idea how to commit properly...

import SwiftUI

struct ContentView: View {
    
    @State private var notes = ""
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    print("Goodbye world")
                } label: {
                    Image(systemName: "trash")
                        .glassEffect()
                        //.fixedSize(horizontal: 15, vertical: 15)
                }
                Spacer()
                Text("Note taker")
                    .font(.largeTitle)
                    .bold()
                    .italic()
                    .padding()
                Spacer()
                Button{
                    print("Hello world")
                } label: {
                    Image(systemName: "plus")
                        .glassEffect()
                        //.fixedSize(horizontal: 15, vertical: 15)
                }
                Spacer()
            }
            //TOP AND TITLE HERE
        }
        
        VStack{
            TextEditor(text: $notes)
                .scrollContentBackground(.hidden)
                .frame(height: 550)
                .background(.gray)
                //.glassEffect(.clear)
                .cornerRadius(30)
                .padding()
            Spacer()
            //TEXT BOX
        }
        
        VStack{
            Text("Recents")
            Spacer()
            Image(.placeholder)
                .resizable()
                //.scaledToFit()
                .frame(width: 350, height:100)
            //BOTTOM BAR RECENT NOTES
        }

    }
}

#Preview {
    ContentView()
}

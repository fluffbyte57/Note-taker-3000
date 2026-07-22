//
//  ContentView.swift
//  Note taking app
//
//  Created by Yacov Vladimirovich on 7/21/26.
//  ooooo cool project awesome sauce


// Nevermind now i know how to commit, i'm a genius

import SwiftUI

struct ContentView: View {

    @AppStorage("currentnote") private var currentnote = ""
    @AppStorage("savedNotes") private var savedNotesData: Data = Data()
    @State private var notes: [String]  = [
        "First note",
        "Second note",
        "DEv note"
    ]
    
    //.preferredColorScheme(darkMode? .dark : .light)
    @AppStorage("darkMode") private var darkMode = false
    
    
    //////oooooo mysterious data saver AND loader //////
    
    func saveNotes() {
        if let data = try? JSONEncoder().encode(notes) {
            savedNotesData = data
        }
    }
    
    func loadNotes() {
        if let loadedNotes = try? JSONDecoder().decode(
            [String].self,
            from: savedNotesData
        ) {
            notes = loadedNotes
        }
    }
    ////////////////////////////////////////////////////
    
    var body: some View {
        //.preferredColorScheme(darkMode ? .dark : .light)
        //preferredColorScheme(darkMode ? .dark : .light)
        //preferredColorScheme(.dark)
        VStack{
            HStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.ultraThinMaterial)
                        .frame(width: 100 , height: 50)
                    HStack(spacing: 10){
                        Button{
                            print("Deleted the current note")
                            
                            if let index = notes.firstIndex(of: currentnote) {
                                notes.remove(at: index)
                                saveNotes()
                                currentnote = ""
                                //finds the CURRENT NOTE and DELETES IT
                            }
                            
                            saveNotes()
                            currentnote = ""
                                  // along with deleting current "note" and text in it, also show a text label as saying "no notes currently selected" and have it always be visible unless the TextEditor is overlaying it
                        } label: {
                            Image(systemName: "trash")
                                .glassEffect()
                                .font(.system(size: 30))
                        }
                        Button{
                            print("darkmode state: ", darkMode)
                            darkMode.toggle()
                            //dark | light mode switcher!!
                        } label: {
                            Image(systemName: darkMode ? "sun.max.fill" : "moon")
                                .glassEffect()
                                .font(.system(size: 35))
                        }
                    }

                }
                Text("Note taker")
                    .font(.title)
                    .bold()
                    .italic()
                    .padding()
                    .lineLimit(1)
                    .layoutPriority(1)
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.ultraThinMaterial)
                        .frame(width: 100 , height: 50)
                    HStack(spacing: 10){
                        Button{
                            print("sharing note")
                            //ILL MAKE THIS THE SHARING BUTTON
                        } label: {
                            Image(systemName: "paperplane")
                                .glassEffect()
                                .font(.system(size: 35))
                        }
                        Button{
                            notes.append(currentnote)
                            saveNotes()
                            currentnote = ""
                        } label: {
                            Image(systemName: "plus")
                                .glassEffect()
                                .font(.system(size: 40))
                        }
                    }

                }
                Spacer()
            }
            //TOP AND TITLE HERE
        }
        
        VStack{
            TextEditor(text: $currentnote)
                .scrollContentBackground(.hidden)
                .background(.ultraThinMaterial)
                .frame(width: 420, height: 550)
                .font(.system(size: 30))
                //.glassEffect(.regular)
                //.background(.gray)
                //.fill(.ultraThinMaterial)
                //.glassEffect(.clear)
                .cornerRadius(30)
                .padding()
            //Spacer()
            //TEXT BOX
        }
        
        VStack{
            Text("Recents")
                .bold()
                .font(.title3)
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial)
                ScrollView{
                    VStack(spacing: 5){
                        ForEach(notes, id: \.self){ note in
                            Button{
                                print("loading note")
                                currentnote = note
                            } label: {
                                Text(note)
                                    //.padding()
                                    .lineLimit(1)
                                    .layoutPriority(1)
                                    .glassEffect(.clear)
                                    .font(.title)
                            }
                        }
                    }
                }
                .frame(width: 400, height: 85)
                //.background(.red)
            }
                //.scaledToFit()
            
                .frame(width: 420, height:100)
            //BOTTOM BAR RECENT NOTES
                .onAppear{
                    loadNotes()
                }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}

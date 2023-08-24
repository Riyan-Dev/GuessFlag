//
//  ContentView.swift
//  Guess Flag
//
//  Created by Muhammad Riyan on 18/04/2020.
//  Copyright © 2020 Muhammad Riyan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy","Monaco", "Monaco","Nigeria","Poland","Russia","Spain", "UK", "US"].shuffled()
    
    @State private var correctAsnwer = Int.random(in: 0..<3)
    
    @State private var showingscore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack(spacing: 30) {
                    VStack {
                        Text ("Guess the flag of")
                            .foregroundColor(.white)
                        Text(countries[correctAsnwer])
                            .foregroundColor(.white)
                            .fontWeight(.black)
                            .font(.largeTitle)
                        }
                    ForEach (0..<4) { Number in
                        Button(action: {
                            self.flagTapped(Number)
                        }) {
                        Image(self.countries[Number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            
                            .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                            .shadow(color: .black, radius: 3, x: 2, y: 2)
                        }
                    }
                    Spacer()
                    Text ("Your Current score is \(score)")
                    .foregroundColor(.white)
                    .font(.footnote)
                        .fontWeight(.semibold)
                Spacer()
               }
                .alert(isPresented: $showingscore) {
                    Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("countinue")) {
                        self.askQuestion()
                        })
                }
            }
        }
    func flagTapped (_ number: Int) {
    if number == correctAsnwer {
        scoreTitle = "Right"
        score += 1
    } else {
        scoreTitle = "Oops Wrong! Thats the flag of \(countries[number])"
        score = 0
    }
        showingscore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAsnwer = Int.random(in: 0..<3)
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

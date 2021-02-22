//
//  ContentView.swift
//  CathTheKennySwiftUI
//
//  Created by yunus olgun on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var timeLeft = 10.0
    @State var choosenX: CGFloat = 200
    @State var choosenY:CGFloat = 100
    @State var showAlert = false
    
    let (x1,y1) = (200,230)
    let (x2,y2) = (70,230)
    let (x3,y3) = (330,230)
    let (x4,y4) = (200,360)
    let (x5,y5) = (70,360)
    let (x6,y6) = (330,360)
    let (x7,y7) = (200,100)
    let (x8,y8) = (70,100)
    let (x9,y9) = (330,100)
    
    var counterTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeLeft < 0.5 {
                self.showAlert = true
            } else {
                self.timeLeft -= 1
            }
            
        }
    }
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let tupleArray = [(self.x1,self.y1),(self.x2,self.y2),(self.x3,self.y3),(self.x4,self.y4),(self.x5,self.y5),(self.x6,self.y6),(self.x7,self.y7),(self.x8,self.y8),(self.x9,self.y9)]
            
            var previousNumber: Int?
            
            func randomNumberGenerator() -> Int {
                var randomNumber = Int(arc4random_uniform(UInt32(tupleArray.count - 1)))
                
                while previousNumber == randomNumber {
                    randomNumber = Int(arc4random_uniform(UInt32(tupleArray.count - 1)))
                }
                
                previousNumber = randomNumber
                
                return randomNumber
            }
            
            
            
            self.choosenX = CGFloat(tupleArray[randomNumberGenerator()].0)
            self.choosenY = CGFloat(tupleArray[randomNumberGenerator()].1)
        }
    }
    
    var body: some View {
        VStack{
            Spacer().frame(height:100)
            Text("Catch The Kenny").font(.largeTitle)
            Text("Time Left: \(Int(self.timeLeft))").font(.title)
            Text("Score: \(self.score)").font(.title)
            Spacer()
            
            Image("kenny")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .position(x: self.choosenX, y: self.choosenY)
                .gesture(TapGesture(count: 1).onEnded({
                    self.score += 1
                }))
                .onAppear(perform: {
                    _ = self.timer
                    _ = self.counterTimer
                })
            
            Spacer()
        }.alert(isPresented: $showAlert, content: {
            return Alert(title: Text("Time Over!"), message: Text("Want to play again?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                //ok button action
                self.score = 0
                self.timeLeft = 10.0
            }), secondaryButton: Alert.Button.cancel())
        })
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

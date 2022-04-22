//
//  ContentView.swift
//  SlotsGame
//
//  Created by Adir Elmakais on 22/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstSlot = "apple"
    @State private var secondSlot = "cherry"
    @State private var thirdSlot = "star"
    @State private var credits = 1000
    @State private var alertDisplay = false
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("SwiftUI Slots!")
                .font(.largeTitle)
            
            Spacer()
            
            Text("Credits left: " + String(credits))
            
            Spacer()
            
            HStack {
                Image(firstSlot)
                    .resizable().frame(width: 120, height: 120)
                Image(secondSlot)
                    .resizable().frame(width: 120, height: 120)
                Image(thirdSlot)
                    .resizable().frame(width: 120, height: 120)
                    
            }
            
            Spacer()
            
            Button(action: {
                
                let slots = ["apple", "cherry", "star"]
                
                firstSlot = slots.randomElement()!
                secondSlot = slots.randomElement()!
                thirdSlot = slots.randomElement()!
                
                if (firstSlot == secondSlot) && (secondSlot == thirdSlot) {
                    credits += 200
                }
                else {
                    credits -= 100
                }
                
                if (credits <= 0) {
                    alertDisplay = true
                }
                
                
                
                
            }) {
                Text("Spin")
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
            }.alert(isPresented: $alertDisplay) {
                Alert(
                    title: Text("You lose!"),
                    message: nil,
                    primaryButton: .default(Text("Try Again"), action: {
                        credits = 1000
                    }),
                    secondaryButton: .destructive(Text("Give up"), action: {
                        exit(0)
                    }))
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

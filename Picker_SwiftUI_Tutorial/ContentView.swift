//
//  ContentView.swift
//  Picker_SwiftUI_Tutorial
//
//  Created by Seokhyun Kim on 2021-03-05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    
    let myColorArray = ["Red", "Green", "Blue"]
    
    func changeColor(index : Int) -> Color {
        switch index {
        case 0:
            return .red
        case 1:
            return .green
        case 2:
            return .blue
        default:
            return .red
        }
    }
    var body: some View {
        VStack(alignment: .center) {
            Circle()
                .foregroundColor(self.changeColor(index: selectionValue))
                .frame(width: 50, height: 50)
            Text("Selected value : \(selectionValue)")
            Text("Selected color : \(myColorArray[selectionValue])")
            
            Picker(selection: $selectionValue, label: Text(""), content: {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
            
            Picker("Picker", selection: $selectionValue, content: {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            })
            .frame(width: 50, height: 100)
            .clipped()
            .padding() //default 10
            .border(self.changeColor(index: selectionValue), width: 10)

        }.padding(.horizontal, 50)
    }
}


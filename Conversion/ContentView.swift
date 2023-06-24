//
//  ContentView.swift
//  Conversion
//
//  Created by Fraidoon Pourooshasb on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let unitOptions = ["seconds", "minutes", "hours", "days"]
    let conversionFactors = [1.0, 60.0, 3600.0, 86400.0]
    
    var outputValue: Double {
        let inputValue = Double(inputNumber)
        let inputConversionFactor = conversionFactors[inputUnit]
        let outputConversionFactor = conversionFactors[outputUnit]
        
        return inputValue * inputConversionFactor / outputConversionFactor
    }
    
    var formattedOutputValue: String {
        let decimalPlaces = 3
        return String(format: "%.\(decimalPlaces)f", outputValue)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Put your value inside")) {
                    TextField("Amount", value: $inputNumber, format: .number).keyboardType(.numberPad)
                }
                
                Section {
                    Picker("Input Units", selection: $inputUnit) {
                        ForEach(0..<4) { index in
                            Text(unitOptions[index])
                        }
                    }
                    
                    Picker("Output Units", selection: $outputUnit) {
                        ForEach(0..<4) { index in
                            Text(unitOptions[index])
                        }
                    }
                }
                
                Section(header: Text("Conversion")) {
                    Text("Your output is \(formattedOutputValue) \(unitOptions[outputUnit]) ")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

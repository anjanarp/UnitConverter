//
//  ContentView.swift
//  UnitConverter
//
//  Created by Anjana Rajamani on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    /*
    game plan:
     - make state variable for what kind of conversion you want to make
     - make a form that picks which type of conversion
     - based on that state variable it will display a certain view
     - make a state variable that stores the input text field
     - create an input text feild with a keypad
     - created a segmented toggle picker for the input unit, store with associated state variable
     - create a segmented output picker for output, store with associated state variable
     - create computer properties that take input and convert to base unit to be converted
     - creat computer properties that takes base unit amount and converts it to respective outputs
     - display output in text field
     */
    @FocusState private var amountIsFocused: Bool
    
    // Temperature Properties
    @State private var tempInputUnit = "°C"
    let tempUnits = ["°C", "°F", "K"]
    @State private var tempInputAmt: Double = 0.0
    @State private var tempOutputUnit = "°C"
    
    
    // Length Properties
    @State private var lengthInputUnit = "m"
    let lengthUnits = ["m", "km", "ft", "yd", "mi"]
    @State private var lengthInputAmt: Double = 0.0
    @State private var lengthOutputUnit = "m"
    
    
    
    // Time Properties
    @State private var timeInputUnit = "sec"
    let timeUnits = ["sec", "min", "hr", "day"]
    @State private var timeInputAmt: Double = 0.0
    @State private var timeOutputUnit = "sec"
    
    // Volume Properties
    @State private var volumeInputUnit = "mL"
    let volumeUnits = ["mL", "L", "cups", "pt", "gal"]
    @State private var volumeInputAmt: Double = 0.0
    @State private var volumeOutputUnit = "mL"

    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        HStack {
                            Text("Temperature")
                                .font(.headline)
                                .padding(10)
                            
                            VStack {
                                HStack {
                                    Text("Input Amount:")
                                        .font(.subheadline)
                                    TextField("Input", value: $tempInputAmt, format: .number)
                                        .font(.subheadline)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(5)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .keyboardType(.decimalPad)
                                        .focused($amountIsFocused)
                                }
                                
                                Picker("Input Unit", selection: $tempInputUnit) {
                                    ForEach(tempUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.bottom, 5)
                                
                                HStack {
                                    Text("Output Amount: \(tempOutputAmt)")
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Picker("Output Unit", selection: $tempOutputUnit) {
                                    ForEach(tempUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                
                            }
                            .padding(10)
                        }
                        .padding(.bottom, 5)
                        
                        HStack {
                            Text("Length")
                                .font(.headline)
                                .padding(10)
                            
                            VStack {
                                HStack {
                                    Text("Input Amount:")
                                        .font(.subheadline)
                                    TextField("Input", value: $lengthInputAmt, format: .number)
                                        .font(.subheadline)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(5)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .keyboardType(.decimalPad)
                                        .focused($amountIsFocused)
                                }
                                
                                Picker("Input Unit", selection: $lengthInputUnit) {
                                    ForEach(lengthUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.bottom, 5)
                                
                                HStack {
                                    Text("Output Amount:")
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Picker("Output Unit", selection: $lengthOutputUnit) {
                                    ForEach(lengthUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                
                            }
                            .padding(10)
                        }
                        .padding(.bottom, 5)
                        
                        HStack {
                            Text("Time")
                                .font(.headline)
                                .padding(10)
                            
                            VStack {
                                HStack {
                                    Text("Input Amount:")
                                        .font(.subheadline)
                                    TextField("Input", value: $timeInputAmt, format: .number)
                                        .font(.subheadline)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(5)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .keyboardType(.decimalPad)
                                        .focused($amountIsFocused)
                                }
                                
                                Picker("Input Unit", selection: $timeInputUnit) {
                                    ForEach(timeUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.bottom, 5)
                                
                                HStack {
                                    Text("Output Amount:")
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Picker("Output Unit", selection: $timeOutputUnit) {
                                    ForEach(timeUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                
                            }
                            .padding(10)
                        }
                        
                        HStack {
                            Text("Volume")
                                .font(.headline)
                                .padding(10)
                            
                            VStack {
                                HStack {
                                    Text("Input Amount:")
                                        .font(.subheadline)
                                    TextField("Input", value: $volumeInputAmt, format: .number)
                                        .font(.subheadline)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(5) // Padding inside the TextField
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .keyboardType(.decimalPad)
                                        .focused($amountIsFocused)
                                }
                                
                                Picker("Input Unit", selection: $volumeInputUnit) {
                                    ForEach(volumeUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.bottom, 5)
                                
                                HStack {
                                    Text("Output Amount:")
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Picker("Output Unit", selection: $volumeOutputUnit) {
                                    ForEach(volumeUnits, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                
                            }
                            .padding(10)
                        }
                        .scaleEffect(geometry.size.width / 375)
                        .padding()
                    }
                }
            }
            
            
            
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                            amountIsFocused = false
                    }
                }
            }
            .navigationTitle("Unit Converter")
            
        }
    }
}

#Preview {
    ContentView()
}

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
    
    var tempOutputAmt: Double {
        var celsius: Double {
            switch tempInputUnit {
            case "°C":
                return tempInputAmt
            case "°F":
                return (tempInputAmt - 32) * 5/9
            case "K":
                return tempInputAmt - 273.15
            default:
                return tempInputAmt
            }
        }
        
        switch tempOutputUnit {
        case "°C":
            return celsius
        case "°F":
            return (celsius * 9/5) + 32
        case "K":
            return celsius + 273.15
        default:
            return celsius
        }
    }

    
    
    // Length Properties
    @State private var lengthInputUnit = "m"
    let lengthUnits = ["m", "km", "ft", "yd", "mi"]
    @State private var lengthInputAmt: Double = 0.0
    @State private var lengthOutputUnit = "m"
    var lengthOutputAmt: Double {
        var meters: Double {
            switch lengthInputUnit {
            case "m":
                return lengthInputAmt
            case "km":
                return lengthInputAmt * 1000
            case "ft":
                return lengthInputAmt * 0.3048
            case "yd":
                return lengthInputAmt * 0.9144
            case "mi":
                return lengthInputAmt * 1609.34
            default:
                return lengthInputAmt
            }
        }
        
        switch lengthOutputUnit {
        case "m":
            return meters
        case "km":
            return meters / 1000
        case "ft":
            return meters / 0.3048
        case "yd":
            return meters / 0.9144
        case "mi":
            return meters / 1609.34
        default:
            return meters
        }
    }
    
    // Time Properties
    @State private var timeInputUnit = "sec"
    let timeUnits = ["sec", "min", "hr", "day"]
    @State private var timeInputAmt: Double = 0.0
    @State private var timeOutputUnit = "sec"
    var timeOutputAmt: Double {
        var seconds: Double {
            switch timeInputUnit {
            case "s":
                return timeInputAmt
            case "min":
                return timeInputAmt * 60
            case "h":
                return timeInputAmt * 3600
            case "d":
                return timeInputAmt * 86400
            default:
                return timeInputAmt
            }
        }
        
        switch timeOutputUnit {
        case "s":
            return seconds
        case "min":
            return seconds / 60
        case "hr":
            return seconds / 3600
        case "day":
            return seconds / 86400
        default:
            return seconds
        }
    }

    
    // Volume Properties
    @State private var volumeInputUnit = "mL"
    let volumeUnits = ["mL", "L", "cups", "pt", "gal"]
    @State private var volumeInputAmt: Double = 0.0
    @State private var volumeOutputUnit = "mL"
    var volumeOutputAmt: Double {
        var milliliters: Double {
            switch volumeInputUnit {
            case "mL":
                return volumeInputAmt
            case "L":
                return volumeInputAmt * 1000
            case "cups":
                return volumeInputAmt * 240
            case "pt":
                return volumeInputAmt * 473.176
            case "gal":
                return volumeInputAmt * 3785.41
            default:
                return volumeInputAmt
            }
        }
        
        switch volumeOutputUnit {
        case "mL":
            return milliliters
        case "L":
            return milliliters / 1000
        case "cups":
            return milliliters / 240
        case "pt":
            return milliliters / 473.176
        case "gal":
            return milliliters / 3785.41
        default:
            return milliliters
        }
    }


    
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
                                    Text("Output Amount: \(String(format: "%.2f", tempOutputAmt))")
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
                                    Text("Output Amount: \(String(format: "%.2f", lengthOutputAmt))")
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
                                    Text("Output Amount: \(String(format: "%.2f", timeOutputAmt))")
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
                                    Text("Output Amount: \(String(format: "%.2f", volumeOutputAmt))")
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

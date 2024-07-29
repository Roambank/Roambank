//
//  PickupFormView.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 18/07/24.
//

import SwiftUI

struct ScheduleFormView: View {
    @StateObject private var viewModel = ScheduleFormViewModel()
    @State private var showingLocationPicker = false
    @State private var selectedLocation: String = ""
    @State private var detailLocation: String = ""
    @Binding var navigateFromRecycle: Bool
    
    var selectedWastes: [WasteOrder]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("SUMMARY")) {
                    List(selectedWastes) { waste in
                        HStack {
                            Text(waste.wasteType.nama)
                                .font(.body)
                            Spacer()
                            Text("\(waste.berat, specifier: "%.1f") Kg")
                                .font(.body)
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Section(header: Text("PICK UP TIME")) {
                    DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                    Picker("Select Time Slot", selection: $viewModel.selectedTime) {
                        Text("Select Time Slot").foregroundColor(.gray).tag("")
                        ForEach(viewModel.timeSlots, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                }
                
                Section(header: Text("PICK UP LOCATION")) {
                    NavigationLink(destination: MapFormView(selectedLocation: $selectedLocation, detailLocation: $detailLocation)) {
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 40))
                                .padding(.trailing, 5)
                            VStack(alignment: .leading) {
                                if selectedLocation.isEmpty {
                                    Text("No location selected")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                } else {
                                    Text(selectedLocation)
                                        .font(.headline)
                                    Text(detailLocation)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    TextField("Notes", text: $viewModel.locationNotes)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            
            Button(action: {
                viewModel.selectedWaste = selectedWastes
                viewModel.location = selectedLocation
                viewModel.detailLocation = detailLocation
                viewModel.createdOrder = viewModel.createOrder()
                viewModel.navigateToConfirmation = true
                viewModel.createSchedule()
            }) {
                Text("Create Schedule")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Ijo"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Schedule Pickup")
        .navigationDestination(isPresented: $viewModel.navigateToConfirmation) {
            if let order = viewModel.createdOrder {
                ConfirmationView(order: order, navigateFromRecycle: $navigateFromRecycle)
            }
        }
    }
}

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView(navigateFromRecycle: .constant(false), selectedWastes: [])
    }
}

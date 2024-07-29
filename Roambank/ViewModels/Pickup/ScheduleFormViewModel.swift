//
//  ScheduleViewModel.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 18/07/24.
//

import Foundation
import SwiftUI

class ScheduleFormViewModel: ObservableObject {
    @Published var selectedWaste: [WasteOrder] = []
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: String = ""
    @Published var location: String = ""
    @Published var detailLocation: String = ""
    @Published var locationNotes: String = ""
    @Published var showingAlert = false
    @Published var alertMessage = ""
    @Published var navigateToConfirmation = false
    @Published var createdOrder: Order?
    
    @AppStorage("firstName") private var firstName: String = ""
    @AppStorage("lastName") private var lastName: String = ""
    @AppStorage("email") private var email: String = ""
    
    let timeSlots = ["6:00-9:00", "12:00-15:00", "18:00-21:00"]
    
    func createOrder() -> Order? {
        guard !selectedTime.isEmpty, !location.isEmpty else {
            alertMessage = "Please fill in all fields correctly"
            showingAlert = true
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        var totalPoin = 0
        selectedWaste.forEach { waste in
            totalPoin += Int(waste.berat * Double(waste.wasteType.poinPerKilo))
        }
        
        let user = User(nama: "\(firstName) \(lastName)", noHP: "08123456789", alamat: location, email: "\(email)" )
        let rombeng = Rombeng(nama: "\(firstName) \(lastName)", wilayah: "Surabaya")
        
        let order = Order(
            user: user,
            wastes: selectedWaste,
            intervalJam: selectedTime,
            hari: formattedDate,
            lokasi: location,
            detailLokasi: detailLocation,
            status: "Pending",
            rombeng: rombeng,
            poin: totalPoin,
            keteranganLokasi: locationNotes
        )
        
        return order
    }
    
    func createSchedule() {
        guard let order = createOrder() else { return }
        createdOrder = order
        navigateToConfirmation = true
        
        let wasteDetails = order.wastes.enumerated().map { (index, waste) -> String in
            return """
            \(index + 1). *Waste Type: \(waste.wasteType.nama)*
            - Weight: \(waste.berat) kg
            - Points per Kilo: \(waste.wasteType.poinPerKilo)
            - Category: \(waste.wasteType.category)
            """
        }.joined(separator: "\n")
        
        let message = """
        *New Schedule:*
        Waste list:
        \(wasteDetails)
        
        Details:
        - Date: \(order.hari)
        - Time Slot: \(order.intervalJam)
        - Location: \(order.lokasi), \(order.detailLokasi), \(order.keteranganLokasi)
        - Total Points: \(order.poin)
        """
        
        sendMessageToWhatsApp(message: message)
    }
    
    func sendMessageToWhatsApp(message: String) {
        let phoneNumber = "6281249395866"
        let urlString = "https://api.whatsapp.com/send?phone=\(phoneNumber)&text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                alertMessage = "WhatsApp is not installed on this device."
                showingAlert = true
            }
        }
    }
}

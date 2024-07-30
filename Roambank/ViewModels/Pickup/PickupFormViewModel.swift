//
//  ScheduleViewModel.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 18/07/24.
//

import Foundation
import SwiftUI

class PickupFormViewModel: ObservableObject {
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
            keteranganLokasi: locationNotes, status: "Pending",
            rombeng: rombeng,
            poin: totalPoin
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
    
    var order: Order
    var addOrderResponseData: AddOrderResponseData
    var getOrdersResponseData: GetOrdersResponseData
    
    init() {
        self.order = Order(id: UUID(), user: User(), wastes: [], intervalJam: "", hari: "", lokasi: "", detailLokasi: "", keteranganLokasi: "", status: "", rombeng: Rombeng(), poin: 0)
        self.addOrderResponseData = AddOrderResponseData(code: 0, desc: "")
        self.getOrdersResponseData = GetOrdersResponseData(code: 0, desc: "", orderData: Order(user: User(), wastes: [], intervalJam: "", hari: "", lokasi: "", detailLokasi: "", keteranganLokasi: "", status: "", rombeng: Rombeng(), poin: 0))
    }
    
    func addOrder(newOrder: Order) {
        guard let url = URL(string: Const.baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestData = AddOrderRequestData(feature: Const.addOrderEP, orderData: newOrder)
            let jsonData = try JSONEncoder().encode(requestData)
            print(String(data: jsonData, encoding: .utf8) ?? "")
            request.httpBody = jsonData
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Request Error: ", error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        print("Response:", String(data: data, encoding: .utf8) ?? "")
                        let decodedData = try JSONDecoder().decode(AddOrderResponseData.self, from: data)
                        self.addOrderResponseData = decodedData
                    }
                    catch let error {
                        print("Error Decoding:", error)
                    }
                }
            }
            
            dataTask.resume()
        } catch let error {
            print("Error Request:", error)
        }
    }
    
    func getOrderData(orderId: UUID) {
        guard let url = URL(string: Const.baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestData = GetOrdersRequestData(feature: Const.getOrderBasedOnIdEP, orderId: orderId)
            let jsonData = try JSONEncoder().encode(requestData)
            print(String(data: jsonData, encoding: .utf8) ?? "")
            request.httpBody = jsonData
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Request Error: ", error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        print(String(data: data, encoding: .utf8) ?? "")
                        let decodedData = try JSONDecoder().decode(GetOrdersResponseData.self, from: data)
                        self.getOrdersResponseData = decodedData
                    }
                    catch let error {
                        print("Error Decoding:", error)
                    }
                }
            }
            
            dataTask.resume()
        } catch let error {
            print("Error Request:", error)
        }
    }
}

extension Date {
    func getStringOfDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}

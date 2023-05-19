//
//  Data.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import Foundation

class ContactVO : ObservableObject {
    let id : String = UUID().uuidString
    @Published var name : String
    @Published var phoneNumbers : [PhoneNumberVO]
    
    init(name : String, phoneNumbers : [PhoneNumberVO]) {
        self.name = name
        self.phoneNumbers = phoneNumbers
    }
}

class PhoneNumberVO : ObservableObject {
    let id : String = UUID().uuidString
    @Published var number : String
    
    init(number: String) {
        self.number = number
    }
}

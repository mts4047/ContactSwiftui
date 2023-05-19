//
//  Repository.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import Foundation
import Combine

class ContactRepo : ObservableObject {
    private init() {}
    static let shared = ContactRepo()
    
    @Published var contacts = [
        ContactVO(name: "Myat Thu", phoneNumbers: [PhoneNumberVO(number: "0942534677")])
    ]
}

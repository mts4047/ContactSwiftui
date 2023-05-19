//
//  TextFieldPhoneNumber.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import SwiftUI

struct TextFieldPhoneNumber: View {
    @ObservedObject var phoneNumber : PhoneNumberVO
    var body: some View {
        TextField("Enter phone numbers", text: self.$phoneNumber.number)
            .padding([.leading, .trailing], 10)
            .frame(height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray))
    }
}

struct TextFieldPhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPhoneNumber(phoneNumber: PhoneNumberVO(number: ""))
    }
}

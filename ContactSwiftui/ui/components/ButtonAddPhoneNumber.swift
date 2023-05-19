//
//  ButtonAddPhoneNumber.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import SwiftUI

struct ButtonAddPhoneNumber: View {
    var body: some View {
        HStack {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(.systemGreen))
            Text("add phone")
        } 
    }
}

struct ButtonAddPhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAddPhoneNumber()
    }
}

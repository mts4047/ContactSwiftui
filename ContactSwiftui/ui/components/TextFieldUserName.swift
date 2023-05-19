//
//  TextFieldUserName.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import SwiftUI

struct TextFieldUserName: View {
    @Binding var textFieldName : String
    var body: some View {
        TextField("Enter name", text: $textFieldName)
            .padding([.leading, .trailing], 10)
            .frame(height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray)
            )
    }
}

struct TextFieldUserName_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldUserName(textFieldName: .constant(""))
    }
}

//
//  UpdateContactView.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import SwiftUI

struct UpdateContactView: View {
    @Binding var isPresented : Bool
    @State var textFieldName : String = ""
    @State var phoneNumbers = [PhoneNumberVO]()
    
    var data : ContactVO
    
    init(isPresented : Binding<Bool>, data : ContactVO) {
        self._isPresented = isPresented
        self._textFieldName = .init(initialValue: data.name)
        self.data = data
        self._phoneNumbers = .init(initialValue: data.phoneNumbers)
    }
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                TextFieldUserName(textFieldName: $textFieldName)
                ForEach(phoneNumbers, id: \.id, content: { item in
                    TextFieldPhoneNumber(phoneNumber: item)
                })
                
                ButtonAddPhoneNumber()
                    .onTapGesture {
                        self.phoneNumbers.append(PhoneNumberVO(number: ""))
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Update Contact View", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                self.updateContact()
                self.isPresented = false
            }, label: {
                Text("Done")
            }))
        }
        
    }
    
    private func updateContact() {
        ContactRepo.shared.contacts = ContactRepo.shared.contacts.map({ (data) -> ContactVO in
            var contact = data
            if self.data.id == data.id {
                contact.name = self.textFieldName
                contact.phoneNumbers = phoneNumbers
                
            }
            return contact
            
        })
        
    }
}

struct UpdateContactView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateContactView(isPresented: .constant(false), data: ContactVO(name: "", phoneNumbers: [PhoneNumberVO]()))
    }
}

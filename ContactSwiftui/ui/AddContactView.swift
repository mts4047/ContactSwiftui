//
//  AddContactView.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 01/04/2023.
//

import SwiftUI

struct AddContactView: View {
    @Binding var isPresented : Bool
    @State var textFieldName : String = ""
    @State var phoneNumbers = [PhoneNumberVO]()
    
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
            .navigationBarTitle("Add Contact View", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                self.addContact()
                self.isPresented = false
                
            }, label: {
                Text("Done")
            })
            )
        }
        
    }
    
    private func addContact() {
        ContactRepo.shared.contacts.append(ContactVO(name: self.textFieldName, phoneNumbers: phoneNumbers))
    }
   
    
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(isPresented: .constant(true))
    }
}


//
//  ContactDetailsView.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 06/04/2023.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @State var isUpdateContactViewShowing : Bool = false
    @EnvironmentObject var data : ContactVO
    var body: some View {

            ScrollView{
                HStack{
                    VStack(alignment: .leading){
                        Text("Phone Numbers")
                            .font(Font.system(size: 20))
                        PhoneNumberListView()
                        Divider().foregroundColor(Color(.gray))
                    }
                    Spacer()
                }.padding()
                
                
            }.navigationBarTitle("\(data.name)")
                .navigationBarItems(trailing: Button(action: {
                    self.isUpdateContactViewShowing = true
                }, label: {
                    Text("Edit")
                }).sheet(isPresented: $isUpdateContactViewShowing, content: {
                    UpdateContactView(isPresented: self.$isUpdateContactViewShowing, data: self.data)
                })
            )
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView()
    }
}

struct PhoneNumberListView: View {
    @EnvironmentObject var data : ContactVO
    var body: some View {
        ForEach(data.phoneNumbers, id: \.id, content: { item in
            Button(action: {
                
            }, label: {
                Text("\(item.number)")
            })
        })
    }
}

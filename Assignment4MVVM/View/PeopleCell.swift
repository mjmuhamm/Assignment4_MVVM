//
//  PeopleCell.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//

import SwiftUI

struct PeopleCell: View {
    let person : People
    var body: some View {
        
        NavigationLink {
            PersonDetailScreen(person: person)
        } label: {
            
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: person.avatar)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .frame(width: 100, height: 100)
                } placeholder: {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading) {
                    Text(person.firstName)
                    Text(person.lastName)
                }
            }.padding(10)
        }
    }
}

#Preview {
    PeopleCell(person: People(createdAt: "", firstName: "Malik", avatar: "https://randomuser.me/api/portraits/women/21.jpg", lastName: "Muhammad", email: "tc", jobtitle: "Android", favouriteColor: "", id: ""))
}

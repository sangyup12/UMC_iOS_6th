//
//  LoginView.swift
//  week9
//
//  Created by 이상엽 on 6/2/24.
//

import Foundation
import SwiftUI

//사용자 목록 뷰
struct userListView: View {
    
    @State var users : [UserData] = [UserData(id: 0, name: "Hong", email: "HGD@email.com", avatar: "aaa"),UserData(id: 1, name: "Hong", email: "HGD@email.com", avatar: "aaa"),
                                     UserData(id: 2, name: "Hong", email: "HGD@email.com", avatar: "aaa")
    ]
    
    var body: some View {
        List(users){ aUser in
            NavigationLink(destination: OtherUserProfileView(userData: aUser), label: {
                HStack{
                    AsyncImage(url: URL(string: aUser.avatar)!){ phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 120, height: 120, alignment: .center)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120, alignment: .center)
                        case .failure:
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 120, height: 120, alignment: .center)
                        @unknown default:
                            EmptyView()
                                .frame(width: 120, height: 120, alignment: .center)
                            
                        }
                    }
                    Spacer()
                    VStack(alignment:.leading){
                        Text(aUser.name).font(.title3)
                        Text(aUser.email).font(.callout)
                    }
                    Spacer()
                }
            })
            
        }
        .navigationTitle("사용자 목록")//VStack
    }
}

#if DEBUG
struct userListView_Previews: PreviewProvider {
    static var previews: some View {
        userListView()
    }
}
#endif

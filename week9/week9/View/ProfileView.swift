//
//  LoginView.swift
//  week9
//
//  Created by 이상엽 on 6/2/24.
//

import Foundation
import SwiftUI


struct ProfileView: View {
    
    @State var id: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var avatarImg: String = ""

    
    var body: some View {
        VStack{
            Form{
                Section{
                    HStack{
                        Spacer()
                        if !avatarImg.isEmpty{
                            AsyncImage(url: URL(string: avatarImg)!){ phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .failure:
                                    Image(systemName: "person.fill.questionmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(width: 250, height: 250, alignment: .center)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                    
                                }
                            }

                        }else{
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 250, height: 250, alignment: .center)
                        }
                        Spacer()
                    }
                }
                Section{
                    Text("아이디: \(id)")
                    Text("이름: \(name)")
                    Text("이메일: \(email)")

                }
                Section{
                    Button{
                        print("새로고침 버튼 클릭")
                    }label: {
                        Text("새로고침")
                    }
                }
            }
        }.navigationTitle("내 프로필")//VStack
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif

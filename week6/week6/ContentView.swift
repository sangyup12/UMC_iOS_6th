//
//  ContentView.swift
//  week6
//
//  Created by 이상엽 on 5/15/24.
//

import SwiftUI



struct ContentView: View {
    @State private var searchText = ""
    @State private var ButtonSize = 110.0
    @State private var ButtonSizeMini = 40.0
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                
                    RoundedRectangle(cornerRadius:15)
                        .fill(Color(red: 0.37, green: 0.746, blue: 0.733))
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.13)
                    
                    VStack(){
                        
                        HStack{
                            Spacer()
                                .frame(width: 20)
                            Text("우리집")
                                .foregroundColor(Color.white)
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.white)
                            Spacer()
                            Image(systemName: "square.grid.2x2")
                                .foregroundColor(Color.white)
                            Image(systemName: "bell")
                                .foregroundColor(Color.white)
                            Image(systemName: "cart")
                                .foregroundColor(Color.white)
                            Spacer()
                                .frame(width: 20)
                        }
                        
                        HStack{
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.white)
                            TextField(" 배고프니까 일단 검색!!", text: $searchText)
                                .frame(minHeight: 35)
                                .background(Color(.white))
                                .cornerRadius(5)
                                .overlay(
                                    Image(systemName:"xmark.circle.fill")
                                        .padding()
                                        .offset(x: 10), alignment: .trailing
                                )
                            Spacer()
                        }
                        
                    }.padding(.top, 0) // 여기에서 위쪽에 20 포인트의 간격을 추가합니다.
                
            }//ZStack
            Spacer()
            
            
        //광고배너 1
                RoundedRectangle(cornerRadius:15)
                    .stroke( // 테두리를 그라디언트로 설정
                                            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing), // 선형 그라디언트 적용
                                            lineWidth: 4 // 테두리 두께 설정
                                            )
                    .fill(Color.white)
                    .frame(width: 350, height: 90)
                    .overlay( // overlay 모디파이어를 사용하여 내용을 덮어씁니다.
                        
                        Image("banner") // 여기에 이미지 이름을 입력하세요.
                                        .resizable() // 이미지 크기를 조정할 수 있게 합니다.
                                        .aspectRatio(contentMode: .fit) // 이미지의 비율을 유지하면서 적절히 맞춥니다.
                                    )
            Spacer()
                
        //평행 버튼 3개
                HStack{
                        //버튼 1
                                RoundedRectangle(cornerRadius:15)
                                    .fill(Color.white)
                                    .frame(width: ButtonSize, height: ButtonSize)
                                    .overlay( // overlay 모디파이어를 사용하여 내용을 덮어씁니다.
                                        Image("button1") // 여기에 이미지 이름을 입력하세요.
                                                        .resizable() // 이미지 크기를 조정할 수 있게 합니다.
                                                        .aspectRatio(contentMode: .fit)
                                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    )
                        //버튼 2
                                RoundedRectangle(cornerRadius:15)
                                    .fill(Color.white)
                                    .frame(width: ButtonSize, height: ButtonSize)
                                    .overlay( // overlay 모디파이어를 사용하여 내용을 덮어씁니다.
                                        Image("button2") // 여기에 이미지 이름을 입력하세요.
                                                        .resizable() // 이미지 크기를 조정할 수 있게 합니다.
                                                        .aspectRatio(contentMode: .fit)
                                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    )
                        //버튼 3
                                RoundedRectangle(cornerRadius:15)
                                    .fill(Color.white)
                                    .frame(width: ButtonSize, height: ButtonSize)
                                    .overlay( // overlay 모디파이어를 사용하여 내용을 덮어씁니다.
                                        Image("button3") // 여기에 이미지 이름을 입력하세요.
                                                        .resizable() // 이미지 크기를 조정할 수 있게 합니다.
                                                        .aspectRatio(contentMode: .fit)
                                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    )
                            }
            Spacer()
            
        //메뉴버튼 10개 배경
            ZStack{
                RoundedRectangle(cornerRadius:15)
                    .fill(Color.white)
                    .ignoresSafeArea()
                    .frame(width: 350, height: 180)
                VStack{
                    //텍스트 / 버튼
                    HStack{
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color.white)
                            .frame(width: 280, height: 30)
                            .overlay( // overlay 모디파이어를 사용하여 내용을 덮어씁니다.
                                Image("menu2") // 여기에 이미지 이름을 입력하세요.
                                                .resizable() // 이미지 크기를 조정할 수 있게 합니다.
                                                .aspectRatio(contentMode: .fit)
                                )
                        Spacer()
                        Image(systemName: "chevron.right")
                        Spacer()
                        
                    }//Hstack
                    
                    //버튼 첫번째 라인
                    HStack{
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal2")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal3")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal4")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal5")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        
                    }//Hstack
                    
                    // 텍스트 첫번째 라인
                                        HStack{
                                            Spacer()
                                            Text("족발")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("회")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("피자")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("중식")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("치킨")
                                                .font(.system(size: 15))
                                            Spacer()
                                            
                                        }//Hstack
                    
                    //버튼 두번째 라인
                    HStack{
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal6")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal7")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal8")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal9")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                        RoundedRectangle(cornerRadius:15)
                            .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                            .frame(width: ButtonSizeMini, height: ButtonSizeMini)
                            .overlay(
                                Image("baedal10")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                )
                        Spacer()
                    }//Hstack
                    //텍스트 두번째 라인
                                        HStack{
                                            Spacer()
                                            Text("버거")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("분식")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("디저트")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("찜·찌개")
                                                .font(.system(size: 15))
                                            Spacer()
                                            Text("전체")
                                                .font(.system(size: 15))
                                            Spacer()
                                            
                                        }//Hstack
                    
                }//Vstack
            }//ZStack
            Spacer()
            
        //광고배너 2
                RoundedRectangle(cornerRadius:15)
                .fill(Color(red: 0.01, green: 0.192, blue: 0.12))
                    .frame(width: 350, height: 90)
                    .overlay( // overlay 모디파이어를 사용하여 내용을 덮어씁니다.
                        Image("adv") // 여기에 이미지 이름을 입력하세요.
                                        .resizable() // 이미지 크기를 조정할 수 있게 합니다.
                                        .aspectRatio(contentMode: .fit) // 이미지의 비율을 유지하면서 적절히 맞춥니다.
                                    )
            Spacer()
            
        //하단바
            ZStack{
                            RoundedRectangle(cornerRadius:15)
                                .fill(Color.white)
                                .ignoresSafeArea()
                                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.13)
                                .shadow(color: .gray, radius: 5, x: 5, y: -5)
                
        //하단바 버튼 이미지
                            VStack(spacing: 5){
                                Spacer()
                                    .frame(height: 30)
                                HStack{
                                    Spacer()
                                        .frame(width: 40)
                                    Image(systemName: "magnifyingglass")
                                        .resizable() // 이미지를 크기 조정 가능하게 만듭니다.
                                        .aspectRatio(contentMode: .fill) // 내용의 비율을 유지하면서 프레임에 맞게 조정합니다. 필요에 따라 .fit으로 변경할 수 있습니다.
                                        .frame(width: 25, height: 25) // 원하는 너비와 높이로 설정하세요.
                                        .clipped() // 프레임 바깥으로 나가는 이미지 부분을 잘라냅니다.
                                        .foregroundColor(Color.gray)
                                        //.padding(13)
                                    Spacer()
                                    Image(systemName: "bag")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Image(systemName: "flame")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Image(systemName: "doc.plaintext")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .foregroundColor(Color.gray)
                                        .frame(width: 25, height: 25)
                                    Spacer()
                                    Image(systemName: "face.smiling")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color.gray)
                                        .clipped()
                                    Spacer()
                                        .frame(width: 40)
                                    
                                }
            //하단바 버튼 텍스트
                                HStack{
                                    Spacer()
                                    Text("검색")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("배민스토어")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("찜")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("주문내역")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("my배민")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    
                                }//Hstack
                            }.padding(.top, -50) // 여기에서 위쪽에 20 포인트의 간격을 추가합니다. VStack
                        }//ZStack
            
        }.background(Color.gray.opacity(0.15)) //VStack
        
    }
    
}

#Preview {
    ContentView()
}

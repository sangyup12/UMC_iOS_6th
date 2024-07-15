//
//  ContentView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 0) {
            
            TopView()
            
            ZStack(alignment: .bottomTrailing) {
                
                ScrollView{
                    
                    TopButtonView()
                    firstProductView()
                    HorizontalTextButtonView()
                    HorizontalScrollView()
                    secondProductView()
                    
                }//scrollView
                
                FixedButtonView()
                
            }//ZStack
            
            Spacer()
            BottomTabView()
            
        }//VStack
        .padding()
    }
}

#Preview {
    ContentView()
}

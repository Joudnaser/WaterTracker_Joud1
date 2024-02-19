//
//  SwiftUIView.swift
//  water_tracker
//
//  Created by joud alkahtany on 18/02/2024.
//

import SwiftUI

struct SplashScreen: View {
        @State private var logoScale: CGFloat = 1.0
    @State private var navigateToContentView = false
 
        var body: some View {
            ZStack {
                
                
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10) //  initial size of the logo
                    .scaleEffect(logoScale)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            self.logoScale = 10 // final scale of the logo
                        }
                        navigateToContentView = true
                    }
            
                
            } .frame(width: 1000, height: 1000)
            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                EmptyView()
            }
            
        }
    }

   


#Preview {
    SplashScreen()
}

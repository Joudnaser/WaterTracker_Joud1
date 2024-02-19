//
//  NotificationPreferencesView.swift
//  water_tracker
//
//  Created by joud alkahtany on 19/02/2024.
//

import SwiftUI

struct NotificationPreferencesView: View {
    @State private var isWaterTrackerPageActive = false

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            isWaterTrackerPageActive = true
            
      
        }) {
            Text("go to the next page")
                .frame(width: 350, height: 50)
                .background(Color.blue01)
                .foregroundColor(Color.N_10)
                .cornerRadius(10)
            
        }
    }
}

#Preview {
    NotificationPreferencesView()
}

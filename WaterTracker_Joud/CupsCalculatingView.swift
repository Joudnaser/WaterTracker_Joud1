import SwiftUI

struct CupsCalculatingView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
     
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    
                    Text("Today's Water Intake")
                        .foregroundColor(.gray)
                    Text("2 cups / 20 cups")
                        .bold()
                        .font(.title)
                }
                .padding(.horizontal,-180)
            }
            
            VStack(spacing:70){
                
                HStack(spacing:30){
                    Image("logo")
                    
                    Image("logo")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
                HStack(spacing:30){
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
                HStack(spacing:30){
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
                HStack(spacing:30){
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
            }
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onEnded { value in
                        if value.translation.width < 0 { // Left swipe detected
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
            ) .navigationBarBackButtonHidden(true)
    }
        
        // Customize the rest of your view as needed
    }

#Preview {
    CupsCalculatingView()
}

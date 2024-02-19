import SwiftUI

struct WaterTrackerView: View {
    // Replace these with your actual data and methods
    @State private var currentIntake: Double = 0.0
   
   
    @State private var progress: Double = 0.0
    
    
    @State private var navigateToCupsCalculating = false
    
    
    @Binding var waterIntakeRecommendation : Double
  
    
  

    var body: some View {
       
        NavigationView {
           
            VStack(alignment: .leading ,spacing: 30)
            {
                Text("Today's Water Intake")
                 
                    .font(.system(size: 20))
                  
                    .foregroundStyle(.gray)

                Text(String(format: "%.1f liter / %.1f liter", currentIntake, waterIntakeRecommendation))
                    .font(.title.bold())
                
                // Water intake progress display view
                
                progressView
                    .padding(.all, 30.0)
                ///=========================//
               
                
                // buttons view
                intakeButtonView
                ///=========================//

                
                // swipe
                
                swipeGesture
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.gray)
                ///=========================//
              
                }
            }
        NavigationLink(destination: CupsCalculatingView(), isActive: $navigateToCupsCalculating) {
                EmptyView()
          .hidden()
            .padding(.all)// end of vstack
            
            
            
            
            
        }             .navigationBarBackButtonHidden(true)
// end of navigation view
        
        
        
    } // end of body struct
    
    
   
    
    //                       functions                       //
    func changeWaterIntake(by amount: Double) {
        
        currentIntake += amount
        currentIntake = min(max(currentIntake, 0), waterIntakeRecommendation)
        progress = currentIntake / waterIntakeRecommendation
    }
   
    
    // end of function
    
  
    
    
    func emojiForProgress(_ progress: Double) -> String {
        switch progress {
        case 0.0..<0.25:
            return "😴"
        case 0.25..<0.5:
            return "😐"
        case 0.5..<0.75:
            return "🙂"
        case 0.75..<1.0:
            return "😄"
        default:
            return "🎉"
        }
    }
    
    
    // end of function
    
    
   
    
  
    
    
    
    
//                       views                       //

    private var progressView: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 50)
                .opacity(0.3)
                .foregroundColor(.blue02)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue01)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
                .overlay(
            Text(emojiForProgress(progress))
            
                .font(.system(size: 40))
                .padding(-20)
               // .rotationEffect(.degrees(390 * progress - 80), anchor: .top)
                .offset(y: -(UIScreen.main.bounds.width /  2 + 102) / 2)
                .rotationEffect(.degrees((360 * progress - 0)))
            )
        }
    }
    
    //end of progress view
    
    
    
    
    
    
    
    private var intakeButtonView : some View{
        HStack {
            Button(action: {
                // Decrement action
                self.changeWaterIntake(by: -0.1)
            }) {
                Image(systemName: "minus")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue01)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(.N_40)
                            .frame(width: 50, height: 50)
                    )
            }
            
            .buttonStyle(PlainButtonStyle())
            
            
            
            Spacer()
            
            Text("\(String(format: "%.1f", currentIntake))")
                .font(.title)
                .bold()
            
            Spacer()
            
            Button(action: {
                self.changeWaterIntake(by: 0.1)
            }) {
                
                Image(systemName: "plus")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue01)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(.N_40)
                            .frame(width: 50, height: 50)
                    )
                
            }
            .buttonStyle(PlainButtonStyle())
        }
    } 
    
    // end of intakeButtonView
   
    
    
    
    
    
    
    private var swipeGesture: some View {
        Text("Swipe right for cups calculating")
            .gesture(
            DragGesture(minimumDistance: 50, coordinateSpace: .local)
                                .onEnded { value in
                                    if value.translation.width > 0 { // Right swipe detected
                                        navigateToCupsCalculating = true
                                    }
                                }
                        )
    
                         
        
      } //end of swipeGesture
    
    
    
    
}          // end of view struct







#Preview {
    WaterTrackerView(waterIntakeRecommendation: .constant(0.00))
}





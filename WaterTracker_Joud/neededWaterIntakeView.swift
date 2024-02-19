import SwiftUI

struct neededWaterIntakeView: View {
    var calculatedWeight: Double?
    var calculatedCups:Int?
    @State private var isSecondPageActive = false

               
    init(calculatedWeight: Double?,calculatedCops:Int?) {
          self.calculatedWeight = calculatedWeight
        self.calculatedCups = calculatedCops
          
      }
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing: 30){
                Spacer()
                
                VStack(alignment:.leading ,spacing: 15){
                    Text("The needed water intake").bold().font(.system(size: 25))
                    Text("Your body needs \(calculatedWeight ?? 0.0, specifier: "%.2f") liters of hydration, which is equivalent to \(calculatedCups ?? 0) cups")
.foregroundStyle(.gray)
                }.padding()
                
                HStack(spacing:20){
                    
                    if let calculatedWeight = calculatedWeight ,let calculatedCops = calculatedCups  {
                        VStack(spacing:-8){
                            Image(systemName: "takeoutbag.and.cup.and.straw.fill")   .foregroundStyle(Color.blue01)
                                .font(.largeTitle)
                            HStack(){
                                Text("\(calculatedCops ?? Int(0.0))")
                                    .bold()
                                Text("Cups").foregroundStyle(.gray).offset(x:-5)
                            }.padding()
                        }.padding().cornerRadius(8).frame(width: 150, height:150).background(Color.N_40).cornerRadius(8)
                        
                        
                        VStack(spacing:-8){
                            Image(systemName: "waterbottle")
                                .font(.largeTitle)
                                .foregroundStyle(Color.blue01)
                            HStack(){
                                Text("\(calculatedWeight ?? 0.0, specifier: "%.2f")")
                                Text("L").foregroundStyle(.gray).offset(x:-5)
                                
                            }.padding()
                        }.padding().cornerRadius(8).frame(width: 150, height:150).background(Color.N_40) .cornerRadius(8)
                        
                    }
                    
                    
                    
                    
                    
                }.padding()
                Spacer()
                
                Button(action: {
                    isSecondPageActive = true
                    
              
                }) {
                    Text("Set the notification")
                        .frame(width: 350, height: 50)
                        .background(Color.blue01)
                        .foregroundColor(Color.N_10)
                        .cornerRadius(10)
                    
                }
                NavigationLink(
                    destination: NotificationPreferencesView(),isActive:$isSecondPageActive
                ) {
                    EmptyView()
                }

                
                Spacer()
                
            }.padding()
            
        }.navigationBarBackButtonHidden(true)
        
       
    }
}

#Preview {
    neededWaterIntakeView(calculatedWeight: 0.0, calculatedCops: 0)
}

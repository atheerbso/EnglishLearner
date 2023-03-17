//
//  ContentView.swift
//  LearnEnglish
//
//  Created by ِatheer on 24/08/1444 AH.
//

import SwiftUI


struct WelcomePage: View {

        @State var isActive : Bool = false
        var body: some View {
            
            VStack {
                
                if self.isActive {
                   ChatPage()
                }
                else
                
                {
                    Text("Let's Start To Learn English ! ".capitalized)
                        .foregroundColor(.gray)
                        .font(.system(size: 20 , weight: .bold , design: .serif))
                        .multilineTextAlignment(.center)
                        .padding(20)
                     Image("Img1")
                           .resizable()
                           .scaledToFit()
                           
                }
                
            }
            .padding(.bottom ,100)
            .onAppear {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
                          withAnimation {
                              self.isActive = true
                              
                          }
                        }
                       }
        }
    }


struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}

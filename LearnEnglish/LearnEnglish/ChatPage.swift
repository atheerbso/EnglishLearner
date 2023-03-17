//
//  ChatPage.swift
//  LearnEnglish
//
//  Created by ِatheer on 24/08/1444 AH.
//

import SwiftUI
import OpenAISwift


struct ChatPage: View {
    
    @State var MessageText = ""
    @State var BotMessages : [String] = ["WELCOME 👋🏻"]
    
    var body: some View {
        
        VStack{
            HStack{
                Text("English learner ")
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .font(.largeTitle)
                Image("bot")
                    .resizable()
                    .frame(width: 50 , height: 50)
            }
            //end of header section
            
            ScrollView{
                ForEach(BotMessages , id: \.self){ index in
                    if index.contains("USER"){
                        let msg = index.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                            Text(msg)
                                .padding()
                                .foregroundColor(.white)
                                .background(.red.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal ,16)
                                .padding(.bottom ,10)
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30 , height: 30)
                                .padding(.bottom ,15)
                        }
                    }
                    else
                    {
                        HStack{
                            Image("bot")
                                .resizable()
                                .frame(width: 50 , height: 50)
                                .padding(.bottom ,15)
                            Text(index)
                                .padding()
                                .foregroundColor(.red)
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal ,16)
                                .padding(.bottom ,10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(.gray.opacity(0.10))
            
            HStack{
                TextField("Ask Me ", text: $MessageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        anmationSendMessage(message: MessageText)
                    }
                
                Button {
                    anmationSendMessage(message: MessageText)
                }
            label:{
                ZStack{
                    Color.gray.opacity(0.1)
                        .frame(width: 50 , height: 50)
                        .cornerRadius(50)
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.red)
                        .rotationEffect(Angle(degrees: 250.0))
                       
                        
                }
            }
            .font(.system(size: 26))
            .padding(.horizontal ,10)
            }//end of text fild section
            .padding()

        
            
        }
        
    }
    
    //Messages
    func getBotReplies(message : String) -> String{
        let tempMessages = message.lowercased()
        
        if tempMessages.contains("hello")
        {
            return "Hi"
        }
     
        if tempMessages.contains("can you teach me english?")
        {
            return "Yes of course"
        }
     
        
        else {
            return "GoodBuy See You Later !"
        }
    }


func anmationSendMessage(message : String ) {
    withAnimation {
        BotMessages.append("[USER]" + message)
        self.MessageText = ""
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
        withAnimation {
            BotMessages.append(getBotReplies(message: message))
        }
    }
}

}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}

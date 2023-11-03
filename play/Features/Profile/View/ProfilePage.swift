//
//  ProfilePage.swift
//  play
//
//  Created by Dhruv on 02/11/23.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var verifyVM: VerifyPhoneViewModel
    var body: some View {
        ZStack{
            
            Color(AppColors.black.rawValue)
            VStack{
                
                switch verifyVM.status {
                       case .success:
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("User").font(.custom(Fonts.archivoBold, size: 16)).foregroundColor(.white)
                                
                                Text(verifyVM.id ).font(.custom(Fonts.archivoBold, size: 16)).foregroundColor(.white)
                            }
                           
                            
                            Spacer()
                        }
                        Spacer()
                    }
                    
                       case .loading:
                    ProgressView().controlSize(.large).scaleEffect(1.74).progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                       case let .error(message):
                    Text(message ?? "").foregroundColor(.white)
                       default:
                    ProgressView().controlSize(.large).scaleEffect(1.74).progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                       }
               
                
                    
                
               
                
                
                
            }.padding(.horizontal,16).padding(.vertical,10)
            
        }.background(Color(AppColors.black.rawValue))
            
        
            
        
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            ProfilePage()
        }.environmentObject(VerifyPhoneViewModel(phoneService: PhoneService(networkManager: NetworkManager.shared)))
       
    }
}

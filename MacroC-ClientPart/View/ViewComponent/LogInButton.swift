//
//  LogInButton.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import SwiftUI

struct LogInButton: View {
    //MARK: -1.PROPERTY
    
    var LogoName: String = "KakaoLogo"
    var ButtonText: String = "Kakao로 로그인하기"
    
    //MARK: -2.BODY
    var body: some View {
        HStack {
            Image(LogoName)
                .resizable()
                .scaledToFit()
                .frame(width: 46)
                .padding(.horizontal)
            Spacer()
            Text(ButtonText)
                .fontWeight(.black)
                .foregroundColor(.white)
                .font(.callout)
            Spacer()
            Spacer()
        }
        .padding(.vertical, 8)
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}

    //MARK: -3.PREVIEW
struct LogInButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInButton()
    }
}

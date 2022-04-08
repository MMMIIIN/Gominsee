//
//  QuestionSub2.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/07.
//

import SwiftUI

struct QuestionSub2: View {
    var body: some View {
        VStack {
            Image("ManUser")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("작성 완료!")
                .font(.title2)
                .padding()
            
            Text("스스로에게 한발짝 더 다가갔군요?")
                .font(.subheadline)
            Text("보관함에 내가 쓴 질문이 한개 더 쌓였네요!")
                .font(.subheadline)
            
            Button(action: {
                //버튼을 클릭했을 때 실행되는 코드
                
            }){
                //버튼의 보여지는 UI 코드
                
                Text("보관함으로 가볼래요?")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .background(Color.primaryColor)
                    .cornerRadius(10)
            }
            
        }
    }
}

struct QuestionSub2_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSub2()
    }
}

// 수정1. "보관함으로 가볼래요 텍스트 박스를 버튼으로 수정 "

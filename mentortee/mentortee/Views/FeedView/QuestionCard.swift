import SwiftUI

struct QuestionCard: View {

    @State private var isReport = false
    @State private var isShowingConfirmation = false
    @State private var showModal = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    @State private var showQuestionDetailview = false

    @State var questionData: QuestionData
    @Binding var currentIdx: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(questionData.category)
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)

                Spacer()

                Button(action: {
                    isShowingConfirmation = true
                }) {
                    Image(systemName: IconName.ellipsis)
                        .foregroundColor(Color.black)
                        .rotationEffect(Angle(degrees: 90))
                }
                .confirmationDialog("수정/삭제", isPresented: $isShowingConfirmation) {
                    if(questionData.myName == questionData.nickname) {
                        Button("\(TextName.editText)") {
                        }
                        Button("\(TextName.deleteText)", role: .destructive) {
                            showingDeleteAlert = true
                        }
                    }
                    else {
                        Button("\(TextName.reportText)", role: .destructive) {
                            showingReportAlert = true
                        }
                    }
                }
                .alert("\(TextName.deleteBoard)", isPresented: $showingDeleteAlert) {
                    Button("\(TextName.deleteText)", role: .destructive) { }
                    Button("\(TextName.closeText)", role: .cancel) { }
                } message: {
                    Text("\(TextName.checkDeleteText)")
                }
                .confirmationDialog("\(TextName.selectReport)", isPresented: $showingReportAlert, titleVisibility: .visible) {
                    ForEach(ReportDialog.allCases, id: \.self) { word in
                        Button(word.rawValue){
                            isReport = true
                        }
                    }
                }
                .alert("\(TextName.checkReport)", isPresented: $isReport) {
                    Button("\(TextName.yesText)", role: .destructive) { }
                    Button("\(TextName.noText)", role: .cancel) { }
                } message: {
                    Text("\(TextName.checkReportText)")
                }
            }
            .padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
            
            VStack(alignment: .leading) {
                Text(questionData.question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)
                
                Button(action: {
                    showModal = true
                }) {
                    Text("\(TextName.writeThink)")
                        .padding(5)
                        .foregroundColor(.white)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                }
                .sheet(isPresented: self.$showModal) {
                    AnswerModalSheet(feedQuestion: questionData.question)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))
            
            Divider()
            
            HStack {
                HStack(spacing: 0) {
                    Text(questionData.questionOwner)
                        .font(.system(size: 16)).bold()
                    Text("의 질문")
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                NavigationLink(destination: QuestionDetailView(nickname: "노엘")
                    .navigationBarHidden(true)) {
                        VStack {
                            Text(questionData.otherThoughts)
                                .padding()
                        }
                    }
            }
            .padding(.leading,20)
        }
        .frame(width: 350, height: 200)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

//struct QuestionCard_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionCard(category: "가치관", otherThoughts: "다른생각", question: "오늘은 어떤 음식을 먹을까요", questionOwner: "브라운", nickname: "브라운")
//    }
//}

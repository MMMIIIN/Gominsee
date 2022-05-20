import SwiftUI

struct QuestionDetailView: View {
    @State private var isShowingConfirmation = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    @State private var showDialog = false
    @Environment(\.dismiss) private var dismiss

    var nickname: String
    // MARK: - 수정필요
    var myName: String = "meenu"

    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    QuestionView().padding(.top, -40)
                    AnswerDetailView()
                }
                    .navigationBarItems(leading: Button(action: {
                    dismiss()
                }) {
                        // MARK: - 수정완료
                        Image(systemName: IconName.backward)
                            .imageScale(.large)
                            .foregroundColor(.mainBlack)
                    }, trailing: Button(action: {
                        isShowingConfirmation = true
                    }) {
                        // MARK: - 수정완료
                        Image(systemName: IconName.ellipsis)
                            .imageScale(.large)
                            .foregroundColor(.mainBlack)
                            .rotationEffect(Angle(degrees: 90))
                    }
                    // MARK: - 수정완료
                    .confirmationDialog(TextName.selectAct, isPresented: $isShowingConfirmation) {
                        if(myName == nickname) {
                            Button(TextName.editText) {
                            }
                            Button(TextName.deleteText, role: .destructive) {
                                self.showingDeleteAlert = true
                            }
                        }
                        else {
                            Button(TextName.reportText, role: .destructive) {
                                showingReportAlert = true
                            }
                        }
                    }
                    // MARK: - 수정완료
                        .alert(TextName.deleteBoard, isPresented: $showingDeleteAlert) {
                        Button("삭제", role: .destructive) { }
                        Button("취소", role: .cancel) { }
                    } message: {
                        Text("게시글을 삭제하시면 복구할 수 없어요ㅠ^ㅠ 신중하게 생각하고 선택해주세요.")
                    }
                        .confirmationDialog("게시글 신고 사유를 선택해주세요", isPresented: $showingReportAlert, titleVisibility: .visible) {
                        // MARK: - 수정필요
                        Button("스팸") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("성적인 발언") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("마음에 들지 않습니다") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("혐오 발언") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("사기 또는 거짓") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("따돌림 또는 괴롭힘") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("폭력 또는 위험한 단체") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("지식 재산권 침해") {
                            //신고 누르면 카운트 기능?
                        }
                        Button("기타") {
                            //신고 누르면 카운트 기능?
                        }
                    }
                )
            }
        }
            .onTapGesture {
            hideKeyboard()
        }
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(nickname: "noel")
    }
}

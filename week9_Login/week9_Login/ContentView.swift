import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("🎊UMC🎊")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)

                TextField("이메일을 입력하세요", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .frame(height: 40)

                SecureField("비밀번호를 입력하세요", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .frame(height: 40)
                    .padding(.top, 20)

                Button(action: loginButtonTapped) {
                    Text("로그인")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(9)
                }
                .padding(.horizontal, 50)
                .padding(.top, 20)

                Button(action: signUpButtonTapped) {
                    Text("회원가입")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(9)
                }
                .padding(.horizontal, 50)
                .padding(.top, 20)

                NavigationLink(destination: UserListView(users: loadUsers())) {
                    Text("회원 목록")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(9)
                }
                .padding(.horizontal, 50)
                .padding(.top, 20)

                Spacer()
            }
            .padding(.top, 50)
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("알림"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
            }
        }
    }

    func loginButtonTapped() {
        let savedUsers = loadUsers()
        if let user = savedUsers.first(where: { $0.email == email }) {
            if user.password == password {
                alertMessage = "로그인 성공"
            } else {
                alertMessage = "비밀번호 불일치"
            }
        } else {
            alertMessage = "존재하지 않는 ID"
        }
        showAlert = true
    }

    func signUpButtonTapped() {
        var savedUsers = loadUsers()
        if savedUsers.contains(where: { $0.email == email }) {
            alertMessage = "이미 존재하는 아이디입니다."
        } else {
            let newUser = User(email: email, password: password)
            savedUsers.append(newUser)
            saveUsers(users: savedUsers)
            alertMessage = "회원가입 성공"
        }
        showAlert = true
    }

    func loadUsers() -> [User] {
        guard let data = UserDefaults.standard.data(forKey: "users"),
              let users = try? JSONDecoder().decode([User].self, from: data) else {
            return []
        }
        return users
    }

    func saveUsers(users: [User]) {
        guard let data = try? JSONEncoder().encode(users) else { return }
        UserDefaults.standard.set(data, forKey: "users")
    }
}

struct User: Codable, Identifiable {
    let id = UUID()
    let email: String
    let password: String
}

struct UserListView: View {
    let users: [User]

    var body: some View {
        List(users) { user in
            Text(user.email)
        }
        .navigationTitle("회원 목록")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

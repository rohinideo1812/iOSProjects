import Foundation


class LoginPresenter {
    private let loginService:LoginService
    weak private var loginView : LoginView?

    
    init(loginService:LoginService){
        self.loginService = loginService
    }
    
    func attachView(view:LoginView){
        loginView = view
    }
    
    func detachView() {
        loginView = nil
    }

    
    func login(email : String,password : String){
        if email.isEmpty || password.isEmpty{
            self.loginView?.showMessage(message: "Email or password can't be blanked")
        }else{
        self.loginView?.startLoading()
        loginService.checkUser(email: email, password: password){ [weak self] isavailable,message in
            self?.loginView?.finishLoading()
            if isavailable{
               // self?.loginView?.messageAfterRegistration(message: message)
                self?.loginView?.openDashBoard()
            }
            else{
                self?.loginView?.showMessage(message:message)
            }
           
            }
        }
    }
    
    
    func loginWith(email:String,password:String){
        if email.isEmpty || password.isEmpty{
            self.loginView?.showMessage(message: "Email or password can't be blanked")
        }else{
            self.loginView?.startLoading()
            loginService.loginWith(email: email, password: password, callback: { [weak self]
                isavailable,message in
                self?.loginView?.finishLoading()
                if isavailable {
                    self?.loginView?.openDashBoard()

                }
                else{
                    self?.loginView?.showMessage(message:message)

                }
                
            })
    }
        }
}

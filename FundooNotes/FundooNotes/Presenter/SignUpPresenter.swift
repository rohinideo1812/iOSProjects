import Foundation


class SignUpPresenter {
    private let signUpService:SignUpService
    weak private var signUpView : SignUpView?
    
    
    init(signUpService:SignUpService){
        self.signUpService = signUpService
    }
    
    func attachView(view:SignUpView){
        signUpView = view
    }
    
    func detachView() {
        signUpView = nil
    }
    
    func signUp(object : UserModel?){
        if object?.email == "" ||  object?.password == "" ||  object?.firstName == "" ||  object?.lastName == "" {
            signUpView?.showMessage(message: "All fields are mandatory.")
        }else{
            let providedEmailAddress = object?.email
            let isEmailValid = ValidationUtil.shared.isValidEmailAddress(emailAddressString: providedEmailAddress!)
            if isEmailValid == true {
                self.signUpView?.startLoading()
                signUpService.signUp(userObject: object, callback: {result,message in
                    self.signUpView?.finishLoading()

                    if result == false{
                        self.signUpView?.showMessage(message: message)
                       
                    }else{
                         self.signUpView?.messageAfterRegistration(message : message)
                    }
                            }
                )}else{
                signUpView?.showMessage(message: "Enter emailId in proper format")
            }
}
}
}

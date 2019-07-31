import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userTephoneNumber: UITextField!
    @IBOutlet var userPassword: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loadingDotOne: UIImageView!
    @IBOutlet var loadingDotTwo: UIImageView!
    @IBOutlet var loadingDotThree: UIImageView!
    @IBOutlet var userLoginButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideLoginKeyboardGR = UITapGestureRecognizer(target: self, action: #selector(hideLoginKeyboard))
        scrollView.addGestureRecognizer(hideLoginKeyboardGR)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginKeyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginKeyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        loadingDotOneAnimation()
    }
    
    @objc private func loginKeyboardWasShown(notification: Notification) {
        let info = notification.userInfo as NSDictionary?
        let loginKeyboardSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: loginKeyboardSize.height, right: 0)
        
        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    @objc func loginKeyboardWasHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    @objc func hideLoginKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue"{
            userTephoneNumber.text = ""
            userPassword.text = ""
        }
    }
    
    
    func loadingDotOneAnimation(){
        UIView.transition(with: loadingDotOne, duration: 0.5, options: [UIView.AnimationOptions.transitionCrossDissolve, ], animations: {
            if self.loadingDotOne.image == UIImage(named: "Unfilled Dot 50"){
                self.loadingDotOne.image = UIImage(named: "Filled Dot 50")
            } else {
                self.loadingDotOne.image = UIImage(named: "Unfilled Dot 50")
            }
        }, completion: { animateDot in
            self.loadingDotTwoAnimation()
        })
    }
    
    func loadingDotTwoAnimation(){
        UIView.transition(with: loadingDotTwo, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            if self.loadingDotTwo.image == UIImage(named: "Unfilled Dot 50"){
                self.loadingDotTwo.image = UIImage(named: "Filled Dot 50")
            } else {
                self.loadingDotTwo.image = UIImage(named: "Unfilled Dot 50")
            }
        }, completion: { animateDot in
            self.loadingDotThreeAnimation()
        })
    }
    
    func loadingDotThreeAnimation(){
        UIView.transition(with: loadingDotThree, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            if self.loadingDotThree.image == UIImage(named: "Unfilled Dot 50"){
                self.loadingDotThree.image = UIImage(named: "Filled Dot 50")
            } else {
                self.loadingDotThree.image = UIImage(named: "Unfilled Dot 50")
            }
        }, completion: { animateDot in
            self.loadingDotOneAnimation()
        })
    }
}

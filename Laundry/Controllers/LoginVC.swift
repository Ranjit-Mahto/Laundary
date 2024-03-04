//
//  ViewController.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var apiServiceHelper : APIServiceHelper = APIServiceHelper()
    var userAccessToken = ""
    private var gradient: CAGradientLayer!
    
    @IBOutlet weak var loginBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtEmailId:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    @IBOutlet weak var loginImageView:UIImageView!
    @IBOutlet weak var btnSignUp:UIButton!
    @IBOutlet weak var btnLogIn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        addKeyboardListeners()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .top, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func addKeyboardListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        loginBottomConstraint.constant = 160
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        loginBottomConstraint.constant = 40
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func setUpViews () {
        
        gradient = CAGradientLayer()
        gradient.frame = loginImageView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        loginImageView.layer.mask = gradient
        
        txtEmailId.designTextField(imageName:"icPhone")
        txtPassword.designTextField(imageName:"icPhone")
        
        btnLogIn.designButton()
        btnSignUp.designButton2()
        
        txtEmailId.delegate = self
        txtPassword.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = loginImageView.bounds
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        guard let email = txtEmailId.text, !email.isEmpty else {
            showAlert(message:"Enter user email id")
            return
        }

        guard let pass = txtPassword.text, !pass.isEmpty else {
            showAlert(message:"Enter user password")
            return
        }

        self.loginUser(userId: email, userPass: pass)
        self.view.endEditing(true)
    }
    
    @IBAction func btnSingInTapped(_ sender: Any) {
        print("button Tapped")
    }
}

extension LoginVC {
    
    func loginUser(userId:String, userPass:String) {
        
        let loginURL = URL(string: endpoints.registerUser)!
        
        let request = UserLoginRequest(userEmail:"employee9@gmail.com", userPass:"sasidal@123")
        //let request = UserLoginRequest(userEmail:userId, userPass:userPass)
        
        do {
            let loginRequestBody = try JSONEncoder().encode(request)
            apiServiceHelper.postData(requestUrl: loginURL, requestBody: loginRequestBody, resultType: UserLoginResponse.self) { loginResponse in
                
                if( loginResponse.message == "Login Success") {
                    self.userAccessToken = loginResponse.token?.access ?? "No token found"
                    debugPrint(self.userAccessToken)
                    self.getUserProfile()
                }else{
                    DispatchQueue.main.async {
                        self.showAlert(message: "Please check your email and password")
                    }
                }
            }
        } catch let error {
            debugPrint("ERROR==>", error.localizedDescription)
        }
    }
    
    func getUserProfile() {
        let requestedURL = URL (string: endpoints.profile)!
        apiServiceHelper.getData(requestUrl: requestedURL, token: userAccessToken, resultType: UserProfileResponse.self) { profileResponse in
            
            let fName = profileResponse.firstName ?? "No Name Found"
            let lName = profileResponse.lastName ?? "No Name Found"
            debugPrint("USER_INFO===> \(fName) \(lName)")
            
            let defaults = UserDefaults.standard
            defaults.set(fName, forKey: "userFirstName")
            defaults.set(lName, forKey: "userLastName")
            defaults.synchronize()

            DispatchQueue.main.async {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UITabBarController") as? UITabBarController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
}


extension LoginVC {
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


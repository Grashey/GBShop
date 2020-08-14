//
//  UserLoginController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 10.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserLoginController: ScrollableViewController {
    
    @IBOutlet var userLoginView: UserLoginView!
    let userSession = UserSession.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = userLoginView.scrollView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIBarButtonItem) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "UserRegistrationController") as! UserRegistrationController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let requestFactory = userSession.requestFactory
        let auth = requestFactory.makeAuthRequestFactory()
        if let name = userLoginView.loginTextField.text,
            let password = userLoginView.passwordTextField.text {
                auth.login(userName: name, password: password) { response in
                    switch response.result {
                        case .success(let answer):
                            if let id = answer.user?.id,
                                let name = answer.user?.name,
                                let surname = answer.user?.lastname {
                                self.userSession.id = id
                                self.userSession.name = name + " " + surname
                            }
                        DispatchQueue.main.async {
                            let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailController") as! UserDetailController
                            self.navigationController?.pushViewController(destinationVC, animated: true)
                            self.userLoginView.passwordTextField.text = ""
                        }
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
        }
    }
}

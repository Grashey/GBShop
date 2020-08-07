//
//  UserDetailController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 10.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserDetailController: ScrollableViewController {
    
    @IBOutlet var userDetailView: UserDetailView!
    let userSession = UserSession.instance
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = userDetailView.scrollView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        let requestFactory = userSession.requestFactory
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        auth.logout(id: id) { response in
            switch response.result {
                case .success(let answer):
                    print("logout", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

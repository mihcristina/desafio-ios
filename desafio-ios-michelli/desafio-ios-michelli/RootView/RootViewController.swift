//
//  RootViewController.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 25/07/24.
//

import UIKit

class RootViewController: UIViewController {

    var rootView: RootView?

    override func loadView() {
        rootView = RootView()
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView?.delegate = self
    }

}

extension RootViewController: RootViewDelegate {

    func registerButton() {
        
    }
    
    func loginButton() {
        let vc = LoginCPFViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

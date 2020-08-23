//
//  OnBoardingViewController.swift
//  TheIcon
//
//  Created by Brena Amorim on 22/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {

    lazy var onBoardingView: OnBoardingView = {
        let view = OnBoardingView()
        view.dismissAction = {
            self.dismiss(animated: true, completion: nil)
        }
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = onBoardingView
    }

}

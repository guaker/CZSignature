//
//  ViewController.swift
//  CZSignature
//
//  Created by guaker on 2019/11/12.
//  Copyright © 2019 giantcro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SignatureDrawingViewControllerDelegate {

    private var signatureVC: SignatureDrawingViewController!
    private var completeButton: UIButton!
    private var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signatureVC = SignatureDrawingViewController()
        self.signatureVC.delegate = self
        self.signatureVC.view.backgroundColor = .white
        self.signatureVC.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(self.signatureVC)
        self.view.addSubview(signatureVC.view)
        self.signatureVC.didMove(toParent: self)
        
        self.completeButton = UIButton(type: .custom)
        self.completeButton.setTitle("完成", for: .normal)
        self.completeButton.setTitleColor(.black, for: .normal)
        self.completeButton.addTarget(self, action: #selector(didComplete), for: .touchUpInside)
        self.completeButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.completeButton)
        
        self.resetButton = UIButton(type: .custom)
        self.resetButton.setTitle("重置", for: .normal)
        self.resetButton.setTitleColor(.black, for: .normal)
        self.resetButton.addTarget(self, action: #selector(didReset), for: .touchUpInside)
        self.resetButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.resetButton)
        
        //设置autoLayout
        let viewsDictionary: [String: UIView] = ["signatureView": self.signatureVC.view,
                                                 "completeButton": self.completeButton,
                                                 "resetButton": self.resetButton]
        
        //horizontal
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[signatureView]|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:[completeButton(50)]-10-|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-10-[resetButton(50)]",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        //vertical
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:[signatureView(500)]|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        self.view.addConstraints(
        NSLayoutConstraint.constraints(
            withVisualFormat: "V:[completeButton(50)]-450-|",
            options: [],
            metrics: nil,
            views: viewsDictionary))
        
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:[resetButton(50)]-450-|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
    }
    
    
    // MARK: SignatureDrawingViewControllerDelegate
    func signatureDrawingViewControllerIsEmptyDidChange(controller: SignatureDrawingViewController, isEmpty: Bool) {
        
    }
    
    @objc func didComplete() {
        
    }
    
    @objc func didReset() {
        self.signatureVC.reset()
    }

}


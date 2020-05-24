//
//  ViewController.swift
//  BasicAnimations
//
//  Created by Ben Gohlke on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        configureLabel()
        configureButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Places label in middle of view container (both x and y axis)
        label.center = view.center
    }
    
    private func configureLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.layer.borderWidth = 8
        label.backgroundColor = .white
        label.layer.cornerRadius = 8
        label.text = "💩"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
        
        view.addSubview(label)
        
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
    }
    
    
    private func configureButtons() {
        let rotateButton = UIButton(type: .system)
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        rotateButton.tintColor = .black
        
        let springButton = UIButton(type: .system)
        springButton.translatesAutoresizingMaskIntoConstraints = false
        springButton.setTitle("Spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        springButton.tintColor = .black
        
        let keyButton = UIButton(type: .system)
        keyButton.translatesAutoresizingMaskIntoConstraints = false
        keyButton.setTitle("Key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        keyButton.tintColor = .black
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(keyButton)
        NSLayoutConstraint.activate(
            [
                stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ]
        )
    }
    
    @objc private func rotateButtonTapped() {
        label.center = view.center
        UIView.animate(withDuration: 2.0, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: .pi / 4)
        }) { (_) in
            UIView.animate(withDuration: 2.0){
                self.label.transform = .identity
            }
        }
    }
    
    @objc private func springButtonTapped() {
        label.center = view.center
        label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.label.transform = .identity
        }, completion: nil)
    }
    
    @objc private func keyButtonTapped() {
        label.center = view.center
        
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
            
        }, completion: nil)
        
    }
    
    @objc private func squashButtonTapped() {
        
    }
    
    @objc private func anticipationButtonTapped() {
        
    }
}

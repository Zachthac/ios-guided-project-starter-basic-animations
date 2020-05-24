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
        
        let squashButton = UIButton(type: .system)
        squashButton.translatesAutoresizingMaskIntoConstraints = false
        squashButton.setTitle("Squash", for: .normal)
        squashButton.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        squashButton.tintColor = .black
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(keyButton)
        stackView.addArrangedSubview(squashButton)
        
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
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.label.transform = CGAffineTransform(rotationAngle: .pi/4)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5) {
                self.label.transform = CGAffineTransform(translationX: 0, y: -50)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.label.transform = .identity
            }
            
        }, completion: nil)
        
    }
    
    @objc private func squashButtonTapped() {
        label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let animationBlock = {
            //DROP
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                self.label.center = self.view.center
            }
            //SQUASH
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            }
            //STRETCH
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            }
            //RETURN STRETCH
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15) {
                self.label.transform = CGAffineTransform(translationX: 1.11, y: 0.9)
            }
            //FINISH
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15) {
                self.label.transform = .identity
            }
            
        }
        UIView.animateKeyframes(withDuration: 1.5,
                       delay: 0,
                       options: [],
                       animations: animationBlock,
                       completion: nil)
    }
        
            
            @objc private func anticipationButtonTapped() {
                
            }
}

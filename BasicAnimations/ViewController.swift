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
        label.layer.cornerRadius = 12
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
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(rotateButton)
        
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
        UIView.animate(withDuration: 2.0, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
    @objc private func springButtonTapped() {
        
    }
    
    @objc private func keyButtonTapped() {
        
    }
    
    @objc private func squashButtonTapped() {
        
    }
    
    @objc private func anticipationButtonTapped() {
        
    }
}

//
//  ViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 24.01.23.
//

import UIKit

class StartViewController: UIViewController {
    
    let startLabel = UILabel(text: "My Awesome Game")
    
    let startGameButton = UIButton(title: "Start New Game")
    
    let EnterNumberVC = EnterNumberViewController()
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setups
        setupConstraints()
        view.backgroundColor = .white
        
        //Buttons
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startGameButtonTapped() {
        present(EnterNumberVC, animated: true)
    }
    
}

//MARK: - Setup constraints

extension StartViewController {
    
    private func setupConstraints() {
        
        //tAMIC
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubviews
        view.addSubview(startLabel)
        view.addSubview(startGameButton)
        
        //Consttaints
        NSLayoutConstraint.activate([
            startLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameButton.widthAnchor.constraint(equalToConstant: 340),
            startGameButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}

//MARK: - SwiftUI

import SwiftUI

struct StartVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = StartViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<StartVCProvider.ContainerView>) -> StartViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: StartVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<StartVCProvider.ContainerView>) {
            
        }
    }
}

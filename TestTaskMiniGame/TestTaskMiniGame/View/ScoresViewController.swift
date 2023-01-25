//
//  ScoresViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class ScoresViewController: UIViewController {
    
    let scoresTitleLabel = UILabel(text: "Scores:")
    let userScoreLabel = UILabel(text: "aaa")
    let computerScoreLabel = UILabel(text: "bbb")
    let resultGameLabel = UILabel(text: "QQQQQ")
    
    let goToMainButton = UIButton(title: "Main Menu")
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setups
        view.backgroundColor = .systemBackground
        setupConstraints()
        
    }
}

//MARK: - Setup constraints

extension ScoresViewController {
    
    private func setupConstraints() {
        
        let resultScoresStackView = UIStackView(arrangedSubviews: [userScoreLabel, computerScoreLabel],
                                                axis: .vertical,
                                                spacing: 36)
        
        //tAMIC
        scoresTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultScoresStackView.translatesAutoresizingMaskIntoConstraints = false
        resultGameLabel.translatesAutoresizingMaskIntoConstraints = false
        goToMainButton.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubviews
        view.addSubview(scoresTitleLabel)
        view.addSubview(resultScoresStackView)
        view.addSubview(resultGameLabel)
        view.addSubview(goToMainButton)
        
        //Constraints
        NSLayoutConstraint.activate([
            scoresTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            scoresTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            resultScoresStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            resultScoresStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            goToMainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            goToMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToMainButton.widthAnchor.constraint(equalToConstant: 340),
            goToMainButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
            resultGameLabel.bottomAnchor.constraint(equalTo: goToMainButton.topAnchor, constant: -80),
            resultGameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - SwiftUI

import SwiftUI

struct ScoresVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ScoresViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ScoresVCProvider.ContainerView>) -> ScoresViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ScoresVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ScoresVCProvider.ContainerView>) {
            
        }
    }
}

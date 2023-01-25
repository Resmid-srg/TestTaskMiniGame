//
//  ComputerGuessingViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class ComputerGuessingViewController: UIViewController {
    
    let tryNumberLabel = UILabel(text: "Try № ")
    let compGuessingLabel = UILabel(text: "Computer is guessing")
    let yourNumberIsLabel = UILabel(text: "Your number is - ")
    let myNumberIs = UILabel(text: "My number is ...")
    
    let lessButton = UIButton()
    let equalsButton = UIButton()
    let moreButton = UIButton()
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //Setups
        setupConstraints()
        
    }
}

//MARK: - Setup constraints

extension ComputerGuessingViewController {
    
    private func setupConstraints() {
        
        let headerStackView = UIStackView(arrangedSubviews: [tryNumberLabel, compGuessingLabel],
                                          axis: .vertical,
                                          spacing: 20,
                                          alignment: .center)
        let buttonsStackView = UIStackView(arrangedSubviews: [lessButton, equalsButton, moreButton],
                                           axis: .horizontal,
                                           spacing: 0)
        let bottomStackView = UIStackView(arrangedSubviews: [myNumberIs, buttonsStackView],
                                          axis: .vertical,
                                          spacing: 0)
        bottomStackView.backgroundColor = .blue
        
        //tAMIC
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        yourNumberIsLabel.translatesAutoresizingMaskIntoConstraints = false
        myNumberIs.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubviews
        view.addSubview(headerStackView)
        view.addSubview(yourNumberIsLabel)
        view.addSubview(bottomStackView)
        
        //Constraints
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            yourNumberIsLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 80),
            yourNumberIsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - SwiftUI

import SwiftUI

struct ComputerGuessingVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ComputerGuessingViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ComputerGuessingVCProvider.ContainerView>) -> ComputerGuessingViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ComputerGuessingVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ComputerGuessingVCProvider.ContainerView>) {
            
        }
    }
}

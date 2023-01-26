//
//  ComputerGuessingViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class ComputerGuessingViewController: UIViewController {
    
    private let viewModel = ComputerGuessingViewModel()
    
    let tryNumberLabel = UILabel(text: "Try № 1")
    let compGuessingLabel = UILabel(text: "Computer is guessing")
    let yourNumberIsLabel = UILabel(text: "Your number is - ")
    let myNumberIs = UILabel(text: "My number is ...")
    
    let lessButton = UIButton(title: "<",
                              titleColor: .label,
                              backgroundColor: .systemBackground,
                              borderColor: UIColor.label.cgColor)
    let equalsButton = UIButton(title: "=",
                                titleColor: .label,
                                backgroundColor: .systemBackground,
                                borderColor: UIColor.label.cgColor)
    let moreButton = UIButton(title: ">",
                              titleColor: .label,
                              backgroundColor: .systemBackground,
                              borderColor: UIColor.label.cgColor)
    
    var tapGestureRecognizer = UIGestureRecognizer()

    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setups
        view.backgroundColor = .systemBackground
        yourNumberIsLabel.numberOfLines = 0
        yourNumberIsLabel.textAlignment = .center
        
        bindViewModel()
        setupConstraints()
        viewModel.startGame()
        
        //Buttons and GestureRecognizer
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        equalsButton.addTarget(self, action: #selector(equalsButtonTapped), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        tapGestureRecognizer.isEnabled = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
        
    //MARK: - ButtonsActions and TapAction
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        let userGuessingVC = UserGuessingViewController()
        userGuessingVC.modalPresentationStyle = .fullScreen
        present(userGuessingVC, animated: true)
    }
    
    @objc func lessButtonTapped () {
        viewModel.userButtonTapped(result: "<")
    }
    
    @objc func equalsButtonTapped() {
        viewModel.userButtonTapped(result: "=")
    }
    
    @objc func moreButtonTapped() {
        viewModel.userButtonTapped(result: ">")
    }
    
    //MARK: - Binding ViewModel
    
    func bindViewModel() {
        viewModel.userNumberIs.bind({ [weak self] userNumberIs in
            DispatchQueue.main.async {
                self?.yourNumberIsLabel.text = userNumberIs
            }
        })
        
        viewModel.tryNumber.bind({ [weak self] tryNumber in
            DispatchQueue.main.async {
                self?.tryNumberLabel.text = tryNumber
            }
        })
        
        viewModel.buttonAccessibility.bind({ [weak self] buttonAccessibility in
            DispatchQueue.main.async {
                self?.lessButton.isEnabled = buttonAccessibility
                self?.equalsButton.isEnabled = buttonAccessibility
                self?.moreButton.isEnabled = buttonAccessibility
                self?.tapGestureRecognizer.isEnabled = !buttonAccessibility
            }
        })
    }
}

//MARK: - Setup constraints

extension ComputerGuessingViewController {
    
    private func setupConstraints() {
        
        let headerStackView = UIStackView(arrangedSubviews: [tryNumberLabel, compGuessingLabel],
                                          axis: .vertical,
                                          spacing: 16,
                                          alignment: .center)
        let buttonsStackView = UIStackView(arrangedSubviews: [lessButton, equalsButton, moreButton],
                                           axis: .horizontal,
                                           spacing: 16)
        let bottomStackView = UIStackView(arrangedSubviews: [myNumberIs, buttonsStackView],
                                          axis: .vertical,
                                          spacing: 16)
        
        buttonsStackView.distribution = .fillEqually
        
        //tAMIC
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        yourNumberIsLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubviews
        view.addSubview(headerStackView)
        view.addSubview(yourNumberIsLabel)
        view.addSubview(bottomStackView)
        
        //Constraints
        NSLayoutConstraint.activate([
            lessButton.widthAnchor.constraint(equalToConstant: 60),
            lessButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            yourNumberIsLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 46),
            yourNumberIsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            yourNumberIsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
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

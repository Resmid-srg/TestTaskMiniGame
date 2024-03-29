//
//  UserGuessingViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class UserGuessingViewController: UIViewController {

    private let viewModel = UserGuessingViewModel()

    let tryNumberLabel = UILabel(text: "Try № 1")
    let youGuessingLabel = UILabel(text: "You are guessing")
    let compNumberIsLabel = UILabel()
    let userAnswerTextField = UITextField(textPlaceholder: "Enter the Number",
                                          borderStyle: .roundedRect,
                                          textAlignment: .center)

    let guessButton = UIButton(title: "Guess")

    var tapGestureRecognizer = UIGestureRecognizer()

    var userScore = 0
    var computerScore = 0
    var wonOrLoose = ""

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        userAnswerTextField.delegate = self

        // Setups
        view.backgroundColor = .systemBackground
        setupConstraints()
        bindViewModel()
        viewModel.startGame()

        // Buttons and GestureRecognizer
        guessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)

        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        tapGestureRecognizer.isEnabled = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    // MARK: - Buttons Action and TapActions

    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        print(userScore, computerScore, wonOrLoose)
        let scoresVC = ScoresViewController(userScore: userScore, computerScore: computerScore, winOrLoose: wonOrLoose)
        scoresVC.modalPresentationStyle = .fullScreen
        present(scoresVC, animated: true)
    }

    @objc func guessButtonTapped() {
        viewModel.userGuessButtonTapped(text: userAnswerTextField.text!)
        userAnswerTextField.text = ""
        viewModel.resultsOfGame()
    }
}

// MARK: - Binding viewModel

extension UserGuessingViewController {

    func bindViewModel() {
        viewModel.tryNumber.bind({ [weak self] tryNumber in
            DispatchQueue.main.async {
                self?.tryNumberLabel.text = tryNumber
            }
        })

        viewModel.computerNumberIs.bind({ [weak self] computerNumberIs in
            DispatchQueue.main.async {
                self?.compNumberIsLabel.pushUpTransition(0.3)
                self?.compNumberIsLabel.text = computerNumberIs
            }
        })

        viewModel.tapRecognizerAccessibility.bind({ [weak self] accessibilityIs in
            DispatchQueue.main.async {
                self?.tapGestureRecognizer.isEnabled = accessibilityIs
                self?.guessButton.isEnabled = false
            }
        })

        viewModel.resultScore.bind({ [weak self] resultScore in
            DispatchQueue.main.async {
                self?.userScore = resultScore.0
                self?.computerScore = resultScore.1
                self?.wonOrLoose = resultScore.2
            }
        })
    }
}

// MARK: - Setup constraints

extension UserGuessingViewController {

    private func setupConstraints() {

        let headerStackView = UIStackView(arrangedSubviews: [tryNumberLabel, youGuessingLabel],
                                          axis: .vertical,
                                          spacing: 20,
                                          alignment: .center)
        let mainStackView = UIStackView(
            arrangedSubviews: [headerStackView, userAnswerTextField, guessButton, compNumberIsLabel],
            axis: .vertical,
            spacing: 40,
            alignment: .center)

        // tAMIC
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        // addSubviews
        view.addSubview(mainStackView)

        // Constraints
        NSLayoutConstraint.activate([
            userAnswerTextField.widthAnchor.constraint(equalToConstant: 340),
            userAnswerTextField.heightAnchor.constraint(equalToConstant: 46)
        ])

        NSLayoutConstraint.activate([
            guessButton.widthAnchor.constraint(equalToConstant: 340),
            guessButton.heightAnchor.constraint(equalToConstant: 46)
        ])

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - Keyboard setup

extension UserGuessingViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

// MARK: - SwiftUI

import SwiftUI

struct UserGuesVCProv: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = UserGuessingViewController()

        func makeUIViewController(
            context: UIViewControllerRepresentableContext<UserGuesVCProv.ContainerView>) -> UserGuessingViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UserGuesVCProv.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<UserGuesVCProv.ContainerView>) {

        }
    }
}

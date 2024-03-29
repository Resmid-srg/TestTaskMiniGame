//
//  EnterNumberViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class EnterNumberViewController: UIViewController {

    private let viewModel = EnterNumberViewModel()

    let validationInputText = UILabel(text: "Enter a number from 1 to 100")
    let guessTheNumberTextField = UITextField(textPlaceholder: "Guess the Number",
                                              borderStyle: .roundedRect,
                                              textAlignment: .center)

    let enterTheNumberButton = UIButton(title: "Enter the Number", isEnabled: false, alpha: 0.5)

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        guessTheNumberTextField.delegate = self

        // Setups
        view.backgroundColor = .systemBackground
        bindViewModel()
        setupConstraints()

        // Buttons and TextField targets
        enterTheNumberButton.addTarget(self, action: #selector(enterTheNumberButtonTapped),
                                       for: .touchUpInside)

        guessTheNumberTextField.addTarget(self, action: #selector(guessTheNumberTextFieldDidChange),
                                          for: .editingChanged)
    }

    // MARK: - ButtonsAction and TextFieldAction

    @objc private func enterTheNumberButtonTapped() {
        guard let strHuddenNumber = guessTheNumberTextField.text else {
            return print("enterTheNumberTapped --- User-entered text is nil")}
        guard let hiddenNumber = Int(strHuddenNumber) else {
            return print("enterTheNumberTapped --- User-entered text is not converted Int") }

        viewModel.userButtonTapped(number: hiddenNumber)

        let compGuessingVC = ComputerGuessingViewController()
        compGuessingVC.modalPresentationStyle = .fullScreen
        present(compGuessingVC, animated: true)
    }

    @objc private func guessTheNumberTextFieldDidChange(_ textField: UITextField) {
        viewModel.userDidChangedTextField(text: textField.text!)
    }

    // MARK: - Binding ViewModel

    func bindViewModel() {
        viewModel.validationInputText.bind({ [weak self] validationInputText in
            DispatchQueue.main.async {
                self?.validationInputText.fadeTransition(0.4)
                self?.validationInputText.text = validationInputText
            }
        })

        viewModel.colorValidationText.bind({ [weak self] colorValidationText in
            DispatchQueue.main.async {
                self?.validationInputText.textColor = UIColor(named: colorValidationText)
            }
        })

        viewModel.buttonAccessibility.bind({ [weak self] buttonAccessibility in
            DispatchQueue.main.async {
                self?.enterTheNumberButton.isEnabled = buttonAccessibility
                self?.enterTheNumberButton.alpha = buttonAccessibility ? 1 : 0.5
            }
        })
    }
}

// MARK: - Setup constraints

extension EnterNumberViewController {

    private func setupConstraints() {

        // tAMIC
        guessTheNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        validationInputText.translatesAutoresizingMaskIntoConstraints = false
        enterTheNumberButton.translatesAutoresizingMaskIntoConstraints = false

        // addSubviews
        view.addSubview(guessTheNumberTextField)
        view.addSubview(validationInputText)
        view.addSubview(enterTheNumberButton)

        // Constraints
        NSLayoutConstraint.activate([
            guessTheNumberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            guessTheNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guessTheNumberTextField.widthAnchor.constraint(equalToConstant: 340),
            guessTheNumberTextField.heightAnchor.constraint(equalToConstant: 46)
        ])

        NSLayoutConstraint.activate([
            validationInputText.topAnchor.constraint(equalTo: guessTheNumberTextField.bottomAnchor, constant: 16),
            validationInputText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            enterTheNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            enterTheNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterTheNumberButton.widthAnchor.constraint(equalToConstant: 340),
            enterTheNumberButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension EnterNumberViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

// MARK: - SwiftUI

import SwiftUI

struct EnterNumVCProv: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = EnterNumberViewController()

        func makeUIViewController(
            context: UIViewControllerRepresentableContext<EnterNumVCProv.ContainerView>) -> EnterNumberViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: EnterNumVCProv.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<EnterNumVCProv.ContainerView>) {

        }
    }
}

//
//  UserGuessingViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class UserGuessingViewController: UIViewController {
    
    let tryNumberLabel = UILabel(text: "Try № ")
    let youGuessingLabel = UILabel(text: "You are guessing")
    let compNumberIsLabel = UILabel(text: " 1 1 1 1 ")
    let userAnswerTextField = UITextField(textPlaceholder: "Enter the Number",
                                          borderStyle: .roundedRect,
                                          textAlignment: .center)

    let guessButton = UIButton(title: "Guess")
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegates
        userAnswerTextField.delegate = self

        //Setups
        view.backgroundColor = .white
        setupConstraints()
        
        //Buttons
        guessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Buttons Action
    
    @objc func guessButtonTapped() {
        
    }
}

//MARK: - Setup constraints

extension UserGuessingViewController {
    
    private func setupConstraints() {
        
        let headerStackView = UIStackView(arrangedSubviews: [tryNumberLabel, youGuessingLabel],
                                          axis: .vertical,
                                          spacing: 20,
                                          alignment: .center)
        let mainStackView = UIStackView(arrangedSubviews: [headerStackView, userAnswerTextField, guessButton, compNumberIsLabel],
                                        axis: .vertical,
                                        spacing: 60,
                                        alignment: .center)
        
        //tAMIC
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubviews
        view.addSubview(mainStackView)
        
        //Constraints
        NSLayoutConstraint.activate([
            guessButton.widthAnchor.constraint(equalToConstant: 340),
            guessButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - Keyboard setup

extension UserGuessingViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //Show and Hidding
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = self.view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY < keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            self.view.frame.origin.y = newFrameY
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

//MARK: - SwiftUI

import SwiftUI

struct UserGuessingVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = UserGuessingViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserGuessingVCProvider.ContainerView>) -> UserGuessingViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UserGuessingVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserGuessingVCProvider.ContainerView>) {
            
        }
    }
}

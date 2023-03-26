//
//  ScoresViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

class ScoresViewController: UIViewController {

    let userScore: Int
    let computerScore: Int
    let winOrLoose: String

    let scoresTitleLabel = UILabel(text: "Scores:")
    let userScoreLabel = UILabel(text: "You'r tries count: ")
    let computerScoreLabel = UILabel(text: "Computer's tries count: ")
    let resultGameLabel = UILabel(text: "")

    let goToMainButton = UIButton(title: "Main Menu")

    // MARK: - init

    init(userScore: Int, computerScore: Int, winOrLoose: String) {
        self.userScore = userScore
        self.computerScore = computerScore
        self.winOrLoose = winOrLoose
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setups
        view.backgroundColor = .systemBackground
        setupConstraints()

        userScoreLabel.text! += String(userScore)
        computerScoreLabel.text! += String(computerScore)
        resultGameLabel.text = winOrLoose

        // Buttons
        goToMainButton.addTarget(self, action: #selector(goToMainButtonTapped), for: .touchUpInside)
    }

    // MARK: - ButtonsAction

    @objc func goToMainButtonTapped() {
        let startVC = StartViewController()
        startVC.modalPresentationStyle = .fullScreen
        present(startVC, animated: true)
    }
}

// MARK: - Setup constraints

extension ScoresViewController {

    private func setupConstraints() {

        let resultScoresStackView = UIStackView(arrangedSubviews: [userScoreLabel, computerScoreLabel],
                                                axis: .vertical,
                                                spacing: 36)

        // tAMIC
        scoresTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultScoresStackView.translatesAutoresizingMaskIntoConstraints = false
        resultGameLabel.translatesAutoresizingMaskIntoConstraints = false
        goToMainButton.translatesAutoresizingMaskIntoConstraints = false

        // addSubviews
        view.addSubview(scoresTitleLabel)
        view.addSubview(resultScoresStackView)
        view.addSubview(resultGameLabel)
        view.addSubview(goToMainButton)

        // Constraints
        NSLayoutConstraint.activate([
            scoresTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scoresTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            resultScoresStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            resultScoresStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            goToMainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            goToMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToMainButton.widthAnchor.constraint(equalToConstant: 340),
            goToMainButton.heightAnchor.constraint(equalToConstant: 46)
        ])

        NSLayoutConstraint.activate([
            resultGameLabel.bottomAnchor.constraint(equalTo: goToMainButton.topAnchor, constant: -48),
            resultGameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

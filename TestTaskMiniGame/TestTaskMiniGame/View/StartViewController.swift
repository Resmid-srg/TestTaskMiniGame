//
//  ViewController.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 24.01.23.
//

import UIKit

class StartViewController: UIViewController {

    var viewModel = ViewModel()
    
    let label = UILabel(text: "My Awesome Game")
    
    let buttonStartGame = UIButton(title: "Start New Game")
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupConstraints()
        //setupButtons()
        view.backgroundColor = .blue
    }

    func bindViewModel() {
        viewModel.statusText.bind({statusText in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        })
    }
    

}

//MARK: - Setup constraints

extension StartViewController {
    
    private func setupConstraints() {
        
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

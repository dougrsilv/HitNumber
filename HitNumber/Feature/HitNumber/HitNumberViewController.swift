//
//  HitNumberViewController.swift
//  HitNumberViewController
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import UIKit

class HitNumberViewController: UIViewController {
    
    // MARK: Properties
    
    let hitNumberView = HitNumberView()
    let viewModel: HitNumberViewModel
    var num = ""
    var round = 0
    
    // MARK: Lifecycle
    
    init(viewModel: HitNumberViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = hitNumberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hitNumberView.delegate = self
        num = viewModel.luckyNumber()
    }
    
    // MARK: - Properties
    
    func alertNumber(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(.init(title: Strings.buttonAlert, style: .default))
        present(controller, animated: true)
    }
}

// MARK: - HitNumberViewDelegate

extension HitNumberViewController: HitNumberViewDelegate {
    func startNumber() {
        num = viewModel.luckyNumber()
        round = 0
        hitNumberView.numberOfAttempts.text =  Strings.attempts + "" + "\(round)/3"
        hitNumberView.startButton.isEnabled = true
        hitNumberView.startButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        hitNumberView.luckyNumber.text = ""
    }
    
    func resultNumber() {
        
        guard let luckyNumber = hitNumberView.luckyNumber.text else { return }
        
        switch viewModel.checkValue(num: luckyNumber, numberSorte: num, cout: round) {
        case "Acertou":
            alertNumber(title: Strings.titleHitAlert, message: Strings.messageHitAlert)
            hitNumberView.startButton.isEnabled = false
            hitNumberView.startButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        case "Errou":
            alertNumber(title: Strings.titleErrorAlert, message: Strings.messageTryAgain)
            round += 1
            hitNumberView.numberOfAttempts.text = Strings.attempts + "" + "\(round)/3"
        case "Passou":
            alertNumber(title: Strings.titleErrorAlert, message: Strings.messageErrorAlert)
            hitNumberView.startButton.isEnabled = false
            hitNumberView.startButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
            hitNumberView.numberOfAttempts.text = Strings.attemptsTree
        case "Invalido":
            alertNumber(title: Strings.titleRestrictAlert, message: Strings.messageRestrictAlert)
        default:
            break
        }
    }
}

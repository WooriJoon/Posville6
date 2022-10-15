//
//  LoserSettingViewController.swift
//  Posville6
//
//  Created by Chicken on 2022/10/15.
//

import UIKit

class LoserSettingViewController: UIViewController {

    @IBOutlet weak var player0Image: UIImageView!
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    @IBOutlet weak var player3Image: UIImageView!
    @IBOutlet weak var player4Image: UIImageView!
    @IBOutlet weak var player5Image: UIImageView!
    @IBOutlet weak var loserCountSheet: UIView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var loserCountLabel: UILabel!
    
    var category: Category = .all
    var gameMode: GameMode = .normal
    var playerIndex: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
//        [player0Image, player1Image, player2Image, player3Image, player4Image, player5Image]
//        [0, 2, 4, 5]
    }
    
    func setupUI() {
        categoryLabel.text = "\(category.rawValue) - \(gameMode.rawValue)"
        loserCountLabel.text = "탈락자 수 1명"
        
        
        loserCountSheet.layer.shadowOpacity = 0.3
        loserCountSheet.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        loserCountSheet.layer.shadowRadius = 4
        loserCountSheet.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
    }
    
    func imageSetup() {
        
    }
    
    @IBAction func loserCountStepperTapped(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        
        switch gameMode {
        case .normal:
            sender.maximumValue = Double(self.playerIndex!.count) - 1
            loserCountLabel.text = "탈락자 수 \(currentValue)명"
        case .fever:
            sender.maximumValue = Double(10)
            loserCountLabel.text = "사이클 수 \(currentValue)번"
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // TODO: currentValue 넘기기, 3초 셀때 문제 가져오기
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
}

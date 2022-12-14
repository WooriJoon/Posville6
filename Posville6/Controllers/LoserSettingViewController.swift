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
    @IBOutlet weak var valueStepper: UIStepper!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var loserCountLabel: UILabel!
    
    lazy var playerImages: [UIImageView] = [
        player0Image, player1Image, player2Image, player3Image, player4Image, player5Image
    ]
    
    var category: Category = .all
    var gameMode: GameMode = .normal
    var playerIndex: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameVC" {
            let gameVC = segue.destination as! GameViewController
            gameVC.category = category
            gameVC.gameMode = gameMode
            gameVC.playerIndex = playerIndex?.sorted()
            gameVC.loserCount = Int(valueStepper.value)
        }
    }
}

// MARK: UI Setup related Methods.
// 초기설정과 관련된 메서드들입니다.
private extension LoserSettingViewController {
    func setupUI() {
        sheetSetup()
        imageSetup()
        stepperSetup()
    }
    
    func sheetSetup() {
        categoryLabel.text = "\(category.rawValue) - \(gameMode.rawValue)"
        loserCountLabel.text = gameMode == .normal ? "탈락자 수 1명" : "사이클 수 1번"
        
        loserCountSheet.layer.shadowOpacity = 0.3
        loserCountSheet.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        loserCountSheet.layer.shadowRadius = 4
        loserCountSheet.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
    }
    
    // 선택된 플레이어의 자리에만 플레이어 이미지를 보여줍니다
    func imageSetup() {
        for idx in playerIndex! {
            playerImages[idx].image = UIImage(named: "player\(idx)")
        }
    }
    
    func stepperSetup() {
        switch gameMode {
        case .normal:
            valueStepper.maximumValue = Double(self.playerIndex!.count) - 1
        case .fever:
            valueStepper.maximumValue = Double(10)
        }
    }
    
}

// MARK: IBAction Methods.
// 버튼 액션과 관련된 메서드들입니다.
extension LoserSettingViewController {
    
    // 세그먼티드 컨트롤 눌렸을때
    @IBAction func loserCountStepperTapped(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        switch gameMode {
        case .normal:
            loserCountLabel.text = "탈락자 수 \(currentValue)명"
        case .fever:
            loserCountLabel.text = "사이클 수 \(currentValue)번"
        }
    }
    
    // 이전 버튼
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // TODO: currentValue 넘기기, 3초 셀때 문제 가져오기
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
    }
    
}

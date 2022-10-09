//
//  GameSettingView.swift
//  Posville6
//
//  Created by kimhyeongmin on 2022/10/09.
//

import UIKit

enum GameMode {
    case all
    case grammar
    case krHistory
    case proverb
    case character
    case science
}

class GameSettingViewController: UIViewController {
	
//	lazy var players = [player0, player1, player2, player3, player4, player5]
	
	@IBOutlet var player0Button: MyBtn!
	@IBOutlet var player1Button: MyBtn!
	@IBOutlet var player2Button: MyBtn!
	@IBOutlet var player3Button: MyBtn!
	@IBOutlet var player4Button: MyBtn!
	@IBOutlet var player5Button: MyBtn!
	
	@IBOutlet var playerButtons: [UIButton]!
	
    @IBOutlet weak var gameModeLabel: UILabel!
    
    var buttonAction : ((Bool) -> Void)?
    var gameMode: GameMode?
    
	override func viewDidLoad() {
        setupUI()
	}
    
    func setupUI() {
        switch gameMode {
        case .all:
            gameModeLabel.text = "전체 - 일반모드"
        case .grammar:
            gameModeLabel.text = "맞춤법 - 일반모드"
        case .krHistory:
            gameModeLabel.text = "한국사 - 일반모드"
        case .proverb:
            gameModeLabel.text = "속담/사자성어 - 일반모드"
        case .character:
            gameModeLabel.text = "기호 - 일반모드"
        case .science:
            gameModeLabel.text = "과학상식 - 일반모드"
        default:
            gameModeLabel.text = "전체 - 일반모드"
        }
    }

	@IBAction func onButtonClicked(_ sender: MyBtn) {
		sender.isActivated.toggle()
	}
    
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

class MyBtn: UIButton {
	
	var isActivated: Bool = false {
		didSet {
			animate()
		}
	}
	
	lazy var playerIcon: UIImage! = UIImage(named: "player\(self.tag)")
	let basicButton:UIImage! = UIImage(named: "basicButton")
	
	fileprivate func animate(){
		UIView.animate(withDuration: 0.1, animations: { [weak self] in
			guard let self = self else { return }
			
			let newImage = self.isActivated ? self.playerIcon : self.basicButton
			//1. 클릭 되었을때 쪼그라 들기 - 스케일 즉 크기 변경 -> 50퍼센트로 1초동안
			self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
			self.setImage(newImage, for: .normal)
		}, completion: { _ in
			//2. 원래 크기로 돌리기 1초동안
			UIView.animate(withDuration: 0.1, animations: {
				self.transform = CGAffineTransform.identity
			})
		})
	}
}

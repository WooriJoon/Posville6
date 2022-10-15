//
//  GameSettingView.swift
//  Posville6
//
//  Created by kimhyeongmin on 2022/10/09.
//

import UIKit

final class PlayerSettingViewController: UIViewController {
    
    @IBOutlet weak var gameModeLabel: UILabel!
    @IBOutlet weak var playerCountSheet: UIView!
    
	@IBOutlet var player0Button: MyBtn!
	@IBOutlet var player1Button: MyBtn!
	@IBOutlet var player2Button: MyBtn!
	@IBOutlet var player3Button: MyBtn!
	@IBOutlet var player4Button: MyBtn!
	@IBOutlet var player5Button: MyBtn!
    
    var category: Category = .all
    var gameMode: GameMode = .normal
    
    lazy var buttons: [MyBtn] = [
        player0Button, player1Button, player2Button, player3Button, player4Button, player5Button
    ]
    
    // playerIndex와 currentIndex 조합으로 현재 버튼에 접근을 함.
    // ex) buttons[playerIndex[currentIndex]]
    var playersIndex: [Int] = []
    var currentIndex = 0
    
	override func viewDidLoad() {
        setupUI()
	}
    
    func setupUI() {
        gameModeLabel.text = "\(category.rawValue) - \(gameMode.rawValue)"
        
        playerCountSheet.layer.shadowOpacity = 0.3
        playerCountSheet.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        playerCountSheet.layer.shadowRadius = 4
        playerCountSheet.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
    }

	@IBAction func onButtonClicked(_ sender: MyBtn) {
		sender.isActivated.toggle()
        
        // isOn되면 playersIndex에 넣고, 꺼지면 뺀다.
        if sender.isActivated {
            playersIndex.append(sender.tag)
        } else {
            let index = playersIndex.firstIndex(of: sender.tag)!
            playersIndex.remove(at: index)
        }
	}
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // TODO: 플레이어 수가 2명 미만일 때 다음버튼 눌렀을때 Alert 창을 띄워야함
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if playersIndex.count < 2 {
            return false
        }
        return true
    }
}

class MyBtn: UIButton {
	
	var isActivated: Bool = false {
		didSet {
			animate()
		}
	}
    
    var isBorder: Bool = false {
        didSet {
            if isBorder {
                self.imageView?.layer.cornerRadius = 40
                self.imageView?.layer.borderWidth = 3
                self.imageView?.layer.borderColor = UIColor.blue.cgColor
            } else {
                self.imageView?.layer.borderWidth = 0
                self.imageView?.layer.borderColor = UIColor.clear.cgColor
            }
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

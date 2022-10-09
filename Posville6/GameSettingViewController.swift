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
    
    @IBOutlet weak var secondSheet: UIView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var gameModeLabel: UILabel!
    @IBOutlet weak var loserCountLabel: UILabel!
    @IBOutlet weak var playerCountSheet: UIView!
    
	@IBOutlet var player0Button: MyBtn!
	@IBOutlet var player1Button: MyBtn!
	@IBOutlet var player2Button: MyBtn!
	@IBOutlet var player3Button: MyBtn!
	@IBOutlet var player4Button: MyBtn!
	@IBOutlet var player5Button: MyBtn!
    
    var gameMode: GameMode?
    
    lazy var buttons: [MyBtn] = [
        player0Button,player1Button,player2Button,player3Button,player4Button,player5Button
    ]
    
    // playerIndex와 currentIndex 조합으로 현재 버튼에 접근을 함.
    // ex) buttons[playerIndex[currentIndex]]
    var playersIndex: [Int] = []
    var currentIndex = 0
    var loserCount = 1
    
	override func viewDidLoad() {
        stepper.value = 1
        loserCountLabel.text = "탈락자 수 \(Int(stepper.value))명"
        
        popSecondSheet()
        setupUI()
	}
    
    func stackSecondSheet() {
        secondSheet.alpha = 1
        secondSheet.isUserInteractionEnabled = true
    }
    
    func popSecondSheet() {
        secondSheet.alpha = 0
        secondSheet.isUserInteractionEnabled = false
        stepper.value = 1
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
        
        playerCountSheet.layer.shadowOpacity = 0.3
        playerCountSheet.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        playerCountSheet.layer.shadowRadius = 4
        playerCountSheet.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        
//        secondSheet.layer.shadowOpacity = 0.3
//        secondSheet.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
//        secondSheet.layer.shadowRadius = 2
//        secondSheet.layer.shadowColor = UIColor.black.cgColor
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
    
    // 인원 누른 후에, "다음 버튼"이 눌릴 때 호출될 함수.
    @IBAction func playerCountSelected(_ sender: UIButton) {
        playersIndex.sort()
        
        guard playersIndex.count >= 2 else {
            print("2명 이상이어야함.")
            return
        }
        
        // 일단 이제 전체버튼들 다 안눌려야함.
        // 선택안된자리는 안 보이게.
        for button in buttons {
            if !button.isActivated {
                button.alpha = 0
            }
            button.isUserInteractionEnabled = false
        }
        
        // MARK: 1번. 현재 시트 -> 탈락자 고르는 시트로 UIView 전환.
        stackSecondSheet()
    }
    
    // "이전 버튼" 눌렸을 때, 다시 버튼 잠긴 거 풀어주는 함수.
    func backButtonTapped() {
        for button in buttons {
            button.alpha = 1
            button.isUserInteractionEnabled = true
        }
    }
    
    // MARK: 2번. Stepper에서 설정할 예정.
    // 탈락 최소인원 1명, 최대는 playerIndex.count - 1.
    // 위에 적당한 변수하나 만들기 loserCount 등.
    
    
    
    // MARK: 3번. Stepper 시트에서 다음 누르면, loserCount에 할당하면서
    // 이 함수를 호출.
    // 시작버튼 눌릴 때, 선 정하는 거 3초동안.
    func selectFirstPlayer() {
        // 이 함수 호출될 때, 3,2,1 하는 애를 부르는 함수도 같이 호출되야함.
        
        var time: Double = 0.0
        
        let startIndex = (0...playersIndex.count-1).randomElement()
        currentIndex = startIndex ?? 0
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            // next함수 호출
            self.firstNext()
            time += 0.2
            if time > 3.0 {
                timer.invalidate()
                
                // MARK: 이 타이밍에 타이머 프로그래스바 시작하고, 문제 풀기 시작.
                // 선으로 골라진 사람 잠깐 바운싱해주는 것. 너가 선이다. 이런 느낌.
                // 그 조건을 풀어줌. 문제 풀 수 있도록. false to true.
            }
        }
    }
    
    func firstNext() {
        // 이동 전 지금 버튼의 border를 제거.
        buttons[playersIndex[currentIndex]].isBorder = false
        currentIndex = (currentIndex + 1) % playersIndex.count
        buttons[playersIndex[currentIndex]].isBorder = true
    }
    
    // 다음 문제 이동.
    // 호출되는 경우. 1. 처음 시작, 2. 선택지 중 아무거나 눌렀을 때, 3. 시간초과.
    func nextQuiz() {
        // 이동 전 지금 버튼의 border를 제거.
        buttons[playersIndex[currentIndex]].isBorder = false
        currentIndex = (currentIndex + 1) % playersIndex.count
        buttons[playersIndex[currentIndex]].isBorder = true
        
        // 조건 하나 있어야함.
        // 문제 전환. pop하거나 그런식으로.
        
        // 따로 함수로 빼거나 안 빼거나.
        // 현재의 playersIndex[currentIndex] 이 값에다가 /4해서 0이면 시트 위로보는, 1이면 아래로 보게하는 sheet전환함수 구현.
        
        // 탈락자 로직...
        
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        popSecondSheet()
        backButtonTapped()
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        selectFirstPlayer()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.maximumValue = Double(self.playersIndex.count) - 1
        loserCountLabel.text = "탈락자 수 \(Int(sender.value))명"
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

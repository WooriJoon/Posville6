//
//  GameViewController.swift
//  Posville6
//
//  Created by kimhyeongmin on 2022/10/15.
//

import UIKit
import CoreGraphics

class GameViewController: UIViewController {
    
    var quizManager = QuizManager.shared
    var quizzes: [Quiz] = []
    var quiz: Quiz?
    
    @IBOutlet weak var player0Image: UIImageView!
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    @IBOutlet weak var player3Image: UIImageView!
    @IBOutlet weak var player4Image: UIImageView!
    @IBOutlet weak var player5Image: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var threeButtonView: UIView!
    @IBOutlet weak var twoButtonView: UIView!
    @IBOutlet weak var button2_1: UIButton!
    @IBOutlet weak var button2_2: UIButton!
    @IBOutlet weak var button3_1: UIButton!
    @IBOutlet weak var button3_2: UIButton!
    @IBOutlet weak var button3_3: UIButton!

    // 게임 시작 전에 카운트다운할때 사용
    @IBOutlet weak var countTextLabel: UILabel!
    @IBOutlet weak var countDownView: UIView!
    
    var category: Category = .all
    var gameMode: GameMode = .normal
    var playerIndex: [Int]?
    var loserCount: Int = 0
    var currentLoserCount: Int = 0
    var currentPlayerIndex: Int?
    
    lazy var playerImages: [UIImageView] = [
        player0Image, player1Image, player2Image, player3Image, player4Image, player5Image
    ]
    var currentPlayers: [UIImageView] = [] // current Players's imageView
    var isFirst: Bool = true
    var isReversed: Bool = false {
        didSet {
            if oldValue != isReversed && !isFirst {
                flipByPlayerLocation()
            }
        }
    }
    
    @IBOutlet weak var timeBar: UIProgressView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeBar.progress = 0.0
        setupQuiz()
        setupQuestionView()
        imageSetup()
        selectFirstPlayer()
        setupUI() // 여기서 순서 이동시키지 마십시오. selectFirstPlayer에서 현재 인덱스가 정해지면, 그 값 사용합니다.
    }
    
    func setupUI() {
        // 문제를 띄워주는 view에 그림자 효과
        questionView.layer.shadowOpacity = 0.3
        questionView.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        questionView.layer.shadowRadius = 4
        questionView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        
        // 초기 QuestionView 방향 설정.
        if currentPlayerIndex! < 3 {
            questionView.transform = CGAffineTransform(scaleX: -1, y: -1)
            isReversed = true
        }
        isFirst = false
    }
    
    func setupQuiz() {
        // 카테고리에 맞는 퀴즈 배열을 셔플하여 가져옵니다
        quizzes = quizManager.fetchQuizzes(category: category).shuffled()
    }
    
    func setupQuestionView() {
        // 배열의 마지막 퀴즈를 꺼냅니다
        guard let quiz = quizzes.popLast() else {
            print("Quiz Error")
            return
        }
        
        self.quiz = quiz
        
        // 퀴즈의 선택지의 갯수에 따라 설정을 다르게 합니다
        switch quiz.options.count {
        case 2:
            changeToTwoButtonView()
            
            if quiz.question == "" {
                questionLabel.text = "다음 중 맞는 것은?"
            } else {
                questionLabel.text = quiz.question
            }
            
            let options = quiz.options.shuffled()
            setAnswerButton(option: options[0], button: button2_1)
            setAnswerButton(option: options[1], button: button2_2)
            
        case 3:
            changeToThreeButtonView()
            
            if quiz.question == "" {
                questionLabel.text = "다음 중 맞는 것은?"
            } else {
                questionLabel.text = quiz.question
            }
            
            let options = quiz.options.shuffled()
            setAnswerButton(option: options[0], button: button3_1)
            setAnswerButton(option: options[1], button: button3_2)
            setAnswerButton(option: options[2], button: button3_3)
            
        default:
            print("Quiz options Error")
            return
        }
        //        view.setNeedsLayout()
    }
    
    // 선택된 플레이어의 자리에만 플레이어 이미지를 보여줍니다. 유지.
    func imageSetup() {
        guard let playerIndex = playerIndex else { return }
        for idx in playerIndex {
            playerImages[idx].image = UIImage(named: "player\(idx)")
            playerImages[idx].layer.borderWidth = 3
            playerImages[idx].layer.cornerRadius = 30
            playerImages[idx].layer.borderColor = UIColor.clear.cgColor
            currentPlayers.append(playerImages[idx])
        }
    }
    
    func setAnswerButton(option: String, button: UIButton) {
        button.setTitle(option, for: .normal)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
    }
    
    // 선택지가 2개인 문제로 바뀔때 뷰를 그립니다
    func changeToTwoButtonView() {
        twoButtonView.alpha = 1
        twoButtonView.isUserInteractionEnabled = true
        threeButtonView.alpha = 0
        threeButtonView.isUserInteractionEnabled = false
    }
    
    // 선택지가 3개인 문제로 바뀔때 뷰를 그립니다
    func changeToThreeButtonView() {
        twoButtonView.alpha = 0
        twoButtonView.isUserInteractionEnabled = false
        threeButtonView.alpha = 1
        threeButtonView.isUserInteractionEnabled = true
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        // 맞았는지 틀렸는지 검사
        if sender.currentTitle == quiz?.rightAnswer {
            // 맞았다 표시하고 잠깐 쉬기
            // 다음 사람으로 인덱스 넘기기
            // 반대편 사람이면 플립
            moveBorder()
            
            // 새로운 문제로 갈아끼움
            setupQuestionView()
        } else {
            // 틀렸다 표시하고 잠깐 쉬기
            // 다음 사람으로 인덱스 넘어감
            moveAfterFail()
            
            currentLoserCount += 1
            // 세팅된 탈락자 수와 현재 탈락자 수가 같으면 게임 종료
            if loserCount == currentLoserCount {
                performSegue(withIdentifier: "toEndVC", sender: self)
            }

            // 반대편 사람이면 플립
            // 새로운 문제로 갈아끼움
            setupQuestionView()
        }
        
        if currentPlayerIndex! < 3 {
            isReversed = true
        } else {
            isReversed = false
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toEndVC" {
//            let endVC = segue.destination as! EndViewController
//        }
//    }
    
}

// MARK: Progress Bar
extension GameViewController {
	
	// TODO: button3_2 버튼을 눌렀을 때 액션이 되게 임시로 설정해놨는데 추후 뷰가 변경되었을 때 액션하도록 변경
	@IBAction func buttonPressForTest(_ sender: Any) {
		progressBar()
	}
	
	func progressBar() {
		var progress: Float = 0.0
		timeBar.progress = progress
		
		// withTimeInterval로 시간 변경
		// TODO: 임시로 설정해 놓은 withTimeInterval 파라미터 0.01을 추후 교체
		timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
			progress += 0.01
			self.timeBar.progress = progress
			
			if self.timeBar.progress == 1.0 {
				self.timeBar.progress = 0.0
				timer.invalidate()
			}
		})
	}
}

// MARK: Pause
extension GameViewController {
	
	@IBAction func pauseButtonTapped(_ sender: UIButton) {
		if gameMode == .normal {
			pauseForNormal()
		} else {
			pauseForFever()
		}
	}
	
	func pauseForNormal() {
		let alert = UIAlertController(title: "일시정지", message: "게임에서 정말 나가시겠습니까?", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "나가기", style: .default, handler: { exitAction in
			self.navigationController?.popToRootViewController(animated: true)
		}))
		alert.addAction(UIAlertAction(title: "취소", style: .cancel))
		
		present(alert, animated: true)
	}
	
	func pauseForFever() {
		let alert = UIAlertController(title: "일시정지", message: "야레야레, 피버모드는 나가기따윈 없다구?", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "취소", style: .default))
		alert.addAction(UIAlertAction(title: "취소", style: .default))
		
		present(alert, animated: true)
	}
}

// MARK: Timer
extension GameViewController {
    
    // 첫번째 플레이어를 선택합니다.
    func selectFirstPlayer() {
        let startIndex = (0...currentPlayers.count-1).randomElement()
        currentPlayerIndex = startIndex ?? 0
        fastTimer()
    }
    
    // 가장 빠른 타이머(0.2초 마다 타겟 변경)
    func fastTimer() {
        var time: Double = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            self.moveBorder()
            time += 0.3
            if time > 2.0 {
                timer.invalidate()
                self.normalTimer()
            }
        }
    }
    
    // 중간 빠르기 타이머(0.5초 마다 타겟 변경)
    func normalTimer() {
        var time: Double = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.moveBorder()
            time += 0.5
            if time >= 1.6{
                timer.invalidate()
                self.slowTimer()
            }
        }
    }
    
    // 느린 빠르기 타이머(1.0초 마다 타겟 변경)
    func slowTimer() {
        var time: Double = 0.0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.moveBorder()
            time += 1.0
            if time >= 1.0 {
                timer.invalidate()
                self.countTextLabel.text = "3"
                self.countTextLabel.font = UIFont.systemFont(ofSize: 200)
                self.countDown()
            }
        }
    }
    
    // 카운트 다운
    // 선 플레이어를 선택한 이후에 카운트 다운을 하는 함수
    func countDown() {
        var time: Int = 3
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            time -= 1
            self.countTextLabel.text = "\(time)"
            
            if time == 0 {
                self.countTextLabel.text = "시작"
                self.countTextLabel.font = UIFont.systemFont(ofSize: 120)
            } else if time < 0 {
                timer.invalidate()
                self.countDownView.removeFromSuperview()
            }
        }
    }
    
    // 다음 플레이어로 테두리 옮겨준다
    func moveBorder() {
        // 이동 하기 전에 현재 위치의 테두리를 제거
        currentPlayers[currentPlayerIndex!]
            .layer.borderColor = UIColor.clear.cgColor
        // 다음 플레이어로 이동
        currentPlayerIndex = (currentPlayerIndex! + 1) % currentPlayers.count
        // 이동한 플레이어 위치에 테두리를 추가
        currentPlayers[currentPlayerIndex!]
            .layer.borderColor = UIColor.blue.cgColor
    }
    
    func moveAfterFail() {
        // 이동 하기 전에 현재 위치의 alpha를 0
        // 배열에서 제거
        currentPlayers[currentPlayerIndex!].alpha = 0
        currentPlayers.remove(at: currentPlayerIndex!)
        // 그 자리 플레이어 제거했으니 index 안바꿔도됨.
        // 하지만 currentPlayer의 마지막 인덱스보다 현재 인덱스가 크다면 0으로 전환.
        if currentPlayerIndex! > currentPlayers.count - 1 {
            currentPlayerIndex = 0
        }
        // 이동한 플레이어 위치에 테두리를 추가
        currentPlayers[currentPlayerIndex!]
            .layer.borderColor = UIColor.blue.cgColor
    }
}


/*
 1. imageSetup 함수 안에서 초기 세팅하고, currentPlayers 배열 완성.
 2. selectFirstPlayer 로직에서 currentPlayers 중심으로 로직을 수정.
 */

//MARK: Card Flip Animation
extension GameViewController {
	func flipByPlayerLocation() {
		// 플레이어의 위 아래 위치에 따라 플립 로직 추가
        if isReversed {
            downQuestionView()
        } else {
            upQuestionView()
        }
	}
	
	func downQuestionView() {
		UIView.transition(with: questionView, duration: 0.5, options: .transitionFlipFromTop) {
            self.questionView.transform = CGAffineTransform(scaleX: 1, y: -1)
		}
		questionView.transform = CGAffineTransform(scaleX: -1, y: -1)
	}
	func upQuestionView() {
		UIView.transition(with: questionView, duration: 0.5, options: .transitionFlipFromBottom) {
			self.questionView.transform = CGAffineTransform(scaleX: -1, y: 1)
		}
		questionView.transform = CGAffineTransform(scaleX: 1, y: 1)
	}
}


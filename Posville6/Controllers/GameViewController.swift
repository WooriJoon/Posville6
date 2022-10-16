//
//  GameViewController.swift
//  Posville6
//
//  Created by kimhyeongmin on 2022/10/15.
//

import UIKit

class GameViewController: UIViewController {
	
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
    
    var quizManager = QuizManager.shared
    var quizzes: [Quiz] = []
    
    var category: Category = .all
    var gameMode: GameMode = .normal
    var playerIndex: [Int]?
    var loserCount: Int?
    var currentLoserCount: Int?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
        setupQuiz()
        setupQuestionView()
    }
    
    func setupQuiz() {
        quizzes = quizManager.fetchQuizzes(category: category).shuffled()
//        print(quizzes)
    }
    
    func setupQuestionView() {
        guard let quiz = quizzes.popLast() else {
            print("Quiz Error")
            return
        }
        switch quiz.options.count {
        case 2:
            threeButtonView.alpha = 0
            threeButtonView.isUserInteractionEnabled = false
            
            let options = quiz.options.shuffled()
            button2_1.titleLabel!.text = options[0]
            button2_2.titleLabel!.text = options[1]
        case 3:
            twoButtonView.alpha = 0
            twoButtonView.isUserInteractionEnabled = false
            
            let options = quiz.options.shuffled()
            button3_1.titleLabel!.text = options[0]
            button3_2.titleLabel!.text = options[1]
            button3_3.titleLabel!.text = options[2]
        default:
            print("Quiz options Error")
            return
        }
    }
	
	func setupUI() {
		
		questionView.layer.shadowOpacity = 0.3
		questionView.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
		questionView.layer.shadowRadius = 4
		questionView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
	}
    
    // TODO: 일시정지 버튼 Alert 구현
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
//        let alert = UIAlertController(title: "일시정지", message: "게임에서 정말 나가시겠습니까?", preferredStyle: .alert)
//        let cancel = UIAlertAction(title: "취소", style: .default)
//        let exit = UIAlertAction(title: "나가기", style: .cancel)
//        alert.addAction(exit)
//        alert.addAction(cancel)
//        present(alert, animated: true)
    }
    
}

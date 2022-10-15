//
//  HomeViewController.swift
//  Posville6
//
//  Created by SeongHoon Jang on 2022/10/09.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var gameMode: GameMode = .normal
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var grammarButton: UIButton!
    @IBOutlet weak var korHistoryButton: UIButton!
    @IBOutlet weak var proverbButton: UIButton!
    @IBOutlet weak var characterButton: UIButton!
    @IBOutlet weak var scienceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // segue를 이용해 다음 뷰로 넘어갈때 어떤 정보를 넘겨야할지 준비하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gameSettingVC = segue.destination as! PlayerSettingViewController
        
        gameSettingVC.gameMode = gameMode
        
        switch segue.identifier {
        case "toGameSettingView0":
            gameSettingVC.category = .all
        case "toGameSettingView1":
            gameSettingVC.category = .grammar
        case "toGameSettingView2":
            gameSettingVC.category = .krHistory
        case "toGameSettingView3":
            gameSettingVC.category = .proverb
        case "toGameSettingView4":
            gameSettingVC.category = .character
        case "toGameSettingView5":
            gameSettingVC.category = .science
        default:
            gameSettingVC.category = .all
        }
        
        switch gameMode {
        case .normal:
            gameSettingVC.gameMode = .normal
        case .fever:
            gameSettingVC.gameMode = .fever
        }
    }
    
    // 모드 변경 세그먼티드 컨트롤을 탭했을때 불리는 메소드
    @IBAction func modeChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gameMode = .normal
            setupNormalMode()
        } else {
            gameMode = .fever
            setupFeverMode()
        }
    }
    
    func setupNormalMode() {
        self.view.backgroundColor = UIColor(named: "BG")
        
        descriptionLabel.text = "친구들과 짜릿한 퀴즈 서바이벌을 즐겨보세요!"
        descriptionLabel.textColor = .black
        
        allButton.setBackgroundImage(UIImage(named: "homeAll"), for: .normal)
        grammarButton.setBackgroundImage(UIImage(named: "homeGrammar"), for: .normal)
        korHistoryButton.setBackgroundImage(UIImage(named: "homeKorHistory"), for: .normal)
        proverbButton.setBackgroundImage(UIImage(named: "homeProv"), for: .normal)
        characterButton.setBackgroundImage(UIImage(named: "homeChar"), for: .normal)
        scienceButton.setBackgroundImage(UIImage(named: "homeScience"), for: .normal)
    }
    
    func setupFeverMode() {
        self.view.backgroundColor = UIColor(named: "feverBackground")
        
        descriptionLabel.text = "끝나지 않는 지옥의 레이스를 즐겨보세요!"
        descriptionLabel.textColor = .white
        
        allButton.setBackgroundImage(UIImage(named: "homeFeverAll"), for: .normal)
        grammarButton.setBackgroundImage(UIImage(named: "homeFeverGrammar"), for: .normal)
        korHistoryButton.setBackgroundImage(UIImage(named: "homeFeverKorHistory"), for: .normal)
        proverbButton.setBackgroundImage(UIImage(named: "homeFeverProv"), for: .normal)
        characterButton.setBackgroundImage(UIImage(named: "homeFeverChar"), for: .normal)
        scienceButton.setBackgroundImage(UIImage(named: "homeFeverScience"), for: .normal)
    }
    
}

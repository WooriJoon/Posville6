//
//  HomeViewController.swift
//  Posville6
//
//  Created by SeongHoon Jang on 2022/10/09.
//

import UIKit

enum GameMode {
    case normal
    case fever
}

class HomeViewController: UIViewController {
    
    var gameMode: GameMode = .normal
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var grammarButton: UIButton!
    @IBOutlet weak var korHistoryButton: UIButton!
    @IBOutlet weak var proverbButton: UIButton!
    @IBOutlet weak var characterButton: UIButton!
    @IBOutlet weak var scienceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
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
    }
    
    @IBAction func modeChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gameMode = .normal
        } else {
            gameMode = .fever
            setupFeverMode()
        }
    }
    
    func setupFeverMode() {
        self.view.backgroundColor = UIColor(named: "feverBackground")
        allButton.setBackgroundImage(UIImage(named: "homeFeverAll"), for: .normal)
        
    }
    
}

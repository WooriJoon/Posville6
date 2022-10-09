//
//  HomeViewController.swift
//  Posville6
//
//  Created by SeongHoon Jang on 2022/10/09.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let GameSettingVC = segue.destination as! GameSettingViewController
        
        switch segue.identifier {
        case "toGameSettingView0":
            GameSettingVC.gameMode = .all
        case "toGameSettingView1":
            GameSettingVC.gameMode = .grammar
        case "toGameSettingView2":
            GameSettingVC.gameMode = .krHistory
        case "toGameSettingView3":
            GameSettingVC.gameMode = .proverb
        case "toGameSettingView4":
            GameSettingVC.gameMode = .character
        case "toGameSettingView5":
            GameSettingVC.gameMode = .science
        default:
            GameSettingVC.gameMode = .all
        }
    }
    
    @IBAction func allButtonTapped(_ sender: UIButton) {
        
        
        
    }
    
}

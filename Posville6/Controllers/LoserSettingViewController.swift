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
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var loserCountLabel: UILabel!
    
    var category: Category?
    var playerCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func loserCountStepperTapped(_ sender: UIStepper) {
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
    }
    
}

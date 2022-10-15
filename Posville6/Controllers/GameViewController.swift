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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
    }
	
	
	func setupUI() {
		
		questionView.layer.shadowOpacity = 0.3
		questionView.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
		questionView.layer.shadowRadius = 4
		questionView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
	}
}

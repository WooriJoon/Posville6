//
//  EndViewController.swift
//  Posville6
//
//  Created by Chicken on 2022/10/16.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var player0Image: UIImageView!
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    @IBOutlet weak var player3Image: UIImageView!
    @IBOutlet weak var player4Image: UIImageView!
    @IBOutlet weak var player5Image: UIImageView!
    @IBOutlet weak var endView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        endView.layer.shadowOpacity = 0.3
        endView.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        endView.layer.shadowRadius = 4
        endView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        
    }
    
}

//
//  ViewControllerCafe.swift
//  Cafe
//
//  Created by Andriu on 28.02.2022.
//

import UIKit

class ViewControllerCafe: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
        imageView.layer.cornerRadius = 50
         }
    }
    
    //Градієнт
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    //Тінь кнопки
    @IBOutlet weak var button: UIButton! {
        didSet{
            button.layer.cornerRadius = 20
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width,
                                     height: self.view.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    
}


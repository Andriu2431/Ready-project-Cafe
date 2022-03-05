//
//  ViewControllerEnd.swift
//  Cafe
//
//  Created by Andriu on 28.02.2022.
//

import UIKit

 class ViewControllerEnd: UIViewController, CAAnimationDelegate  {
     
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

     @IBOutlet weak var label: UILabel!
     @IBOutlet weak var labelEnd: UILabel!
     @IBOutlet weak var imageView: UIImageView!{
         didSet{
             imageView.layer.cornerRadius = imageView.frame.size.height / 2
             imageView.layer.masksToBounds = true
             let borderColor = UIColor.white
             imageView.layer.borderColor = borderColor.cgColor
             imageView.layer.borderWidth = 10
             
         }
         
     }
     
     @IBOutlet weak var tappedOutlet: UIButton! {
         didSet{
             tappedOutlet.layer.cornerRadius = 10
             tappedOutlet.layer.shadowOffset = CGSize(width: 0, height: 5)
             tappedOutlet.layer.shadowOpacity = 0.5
             tappedOutlet.layer.shadowRadius = 5
         }
     }
     
     var trackTitle = ""
     
     //Створення анімації
     var shapeLayer: CAShapeLayer! {
         didSet {
             shapeLayer.lineWidth = 20
             shapeLayer.lineCap = .round
             shapeLayer.fillColor = nil
             shapeLayer.strokeEnd = 1
             shapeLayer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
         }
     }
     
     //Створюєм 2 такий же елемент для того щоб зробити візуалізацію(другий буде перекривати перший):
     var overShapeLayer: CAShapeLayer! {
         didSet {
             overShapeLayer.lineWidth = 20
             overShapeLayer.lineCap = .round
             overShapeLayer.fillColor = nil
             overShapeLayer.strokeEnd = 0
             overShapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
         }
     }
     
     override func viewDidLayoutSubviews() {
         
         configShapeLayer(shapeLayer)
         configShapeLayer(overShapeLayer)
         
         gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width,
                                      height: self.view.bounds.height)
     }
     
     //Створення фігури
     func configShapeLayer(_ shapeLayer: CAShapeLayer) {
         shapeLayer.frame = view.bounds
         let path = UIBezierPath()
         path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 + 150))
         path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2 + 150))
         shapeLayer.path = path.cgPath
     }
  

     override func viewDidLoad() {
         super.viewDidLoad()
         
         imageView.image = UIImage(named: trackTitle)
         label.text = "Ви вибрали \(trackTitle)!"
         label.numberOfLines = 0
         
         labelEnd.isHidden = true
     
         shapeLayer = CAShapeLayer()
         view.layer.addSublayer(shapeLayer)
         
         overShapeLayer = CAShapeLayer()
         view.layer.addSublayer(overShapeLayer)
         
         gradientLayer = CAGradientLayer()
         view.layer.insertSublayer(gradientLayer, at: 0)
     }
     
     //Створення анімації
     @IBAction func tapped(_ sender: UIButton) {
         
         tappedOutlet.isHidden = true
         
         //Робимо анімацію:
         let animation = CABasicAnimation(keyPath: "strokeEnd")
         animation.toValue = 1
         animation.duration = 5

         animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
         animation.fillMode = CAMediaTimingFillMode.both
         animation.isRemovedOnCompletion = false

         animation.delegate = self

         overShapeLayer.add(animation, forKey: nil)

     }

     func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
         labelEnd.isHidden = false
     }

 
     
 }


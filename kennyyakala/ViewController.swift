//
//  ViewController.swift
//  kennyyakala
//
//  Created by Muhammet Taha Bilecen on 1.06.2021.
//

import UIKit

class ViewController: UIViewController {
    var sscore = 0;
    var ttime = 30;
    var timer = Timer()
    var hideTimer = Timer()
    var highscoredeger = 0
    @IBOutlet weak var kennyone: UIImageView!
    @IBOutlet weak var kennytwo: UIImageView!
    @IBOutlet weak var kennythree: UIImageView!
    @IBOutlet weak var kennyfour: UIImageView!
    @IBOutlet weak var kennyfive: UIImageView!
    @IBOutlet weak var kennysix: UIImageView!
    @IBOutlet weak var kennyseven: UIImageView!
    @IBOutlet weak var kennyeight: UIImageView!
    @IBOutlet weak var kennynine: UIImageView!
    
    @IBOutlet weak var highscore: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var kennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        score.text = "Score : \(sscore)"
        time.text = "Time : \(ttime) "
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighscore == nil {
            highscore.text = "HighScore : 0"
            highscoredeger = 0
        }
        if let newScore = storedHighscore as? Int {
            highscore.text = "HighScore : \(newScore)"
            highscoredeger = newScore
        }

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(scoruArttir))
        
        
        kennyone.isUserInteractionEnabled = true
        kennytwo.isUserInteractionEnabled = true
        kennythree.isUserInteractionEnabled = true
        kennyfour.isUserInteractionEnabled = true
        kennyfive.isUserInteractionEnabled = true
        kennysix.isUserInteractionEnabled = true
        kennyseven.isUserInteractionEnabled = true
        kennyeight.isUserInteractionEnabled = true
        kennynine.isUserInteractionEnabled = true
       
        
        kennyone.addGestureRecognizer(recognizer1)
        kennytwo.addGestureRecognizer(recognizer2)
        kennythree.addGestureRecognizer(recognizer3)
        kennyfour.addGestureRecognizer(recognizer4)
        kennyfive.addGestureRecognizer(recognizer5)
        kennysix.addGestureRecognizer(recognizer6)
        kennyseven.addGestureRecognizer(recognizer7)
        kennyeight.addGestureRecognizer(recognizer8)
        kennynine.addGestureRecognizer(recognizer9)
        
        kennyArray = [kennyone,kennytwo,kennythree,kennyfour,kennyfive,kennysix,kennyseven,kennyeight,kennynine]
        oyunaBasla();
        
    }

    @objc func oyunaBasla(){
        
       timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geriSayim), userInfo: nil, repeats: true)
        hideTimer =  Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKeny), userInfo: nil, repeats: true)
        hideKeny()

    }
    
    @objc func hideKeny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    
    @objc func geriSayim(){
        ttime -= 1
        time.text = "Time :  \(ttime)"
        if ttime == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            let alert =     UIAlertController(title: "Zaman Doldu", message: "Tekrar Oynamak İstermisiniz ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
            let yenidenButton = UIAlertAction(title: "Yeniden Dene", style: UIAlertAction.Style.default, handler:{
                (UIAlertAction) in
                self.sscore = 0
                self.score.text = "Score : \(self.sscore)"
                self.ttime = 30
                self.time.text = "Time : \(self.ttime)"
            
                self.oyunaBasla()
            })
        
                if highscoredeger < sscore {
                    UserDefaults.standard.set(self.sscore,forKey: "highscore")
                    highscore.text = "HighScore : \(self.sscore)"

                }
           
            alert.addAction(okButton)
            alert.addAction(yenidenButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func scoruArttir(){
        if ttime != 0 {
            sscore += 1
            score.text = "Score : \(sscore)"
            
        }
        
    }
}


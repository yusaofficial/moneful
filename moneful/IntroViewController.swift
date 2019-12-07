//
//  IntroViewController.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/11/22.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import EAIntroView
import EARestrictedScrollView

class IntroViewController: UIViewController, EAIntroDelegate {
    
    
    @IBOutlet weak var startButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.showIntroWithCrossDissolve()
        
        let ud = UserDefaults.standard
        let kidou = ud.string(forKey: "kidou") ?? "1"
    
        if kidou == "0" {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(IntroViewController.jmptabView), userInfo: nil, repeats: false)
            
        }else{
            ud.set("0", forKey: "kidou")
        }
        

    }
    
    @IBAction func tappedmove(_ sender: Any) {
        
        self .performSegue(withIdentifier: "toTabView", sender: nil)
    }
    
    
    @objc func jmptabView() {
        
        self .performSegue(withIdentifier: "toTabView", sender: nil)
    }
    
    func showIntroWithCrossDissolve(){
        let page1 : EAIntroPage = EAIntroPage()
           page1.title = "こんにちは"
           page1.desc = "FeedWriteであなたの毎日を良くしましょう"
           page1.bgImage = UIImage(named:"IntroViewPaper")
           page1.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
           page1.titleColor = UIColor.black
           page1.descColor = UIColor.black
           page1.descPositionY = self.view.bounds.size.height/2
        
       let page2 : EAIntroPage = EAIntroPage()
           
           page2.title = "Feedwriteについて"
           page2.desc = "Feedwriteは1日の反省を可視化し改善を促すアプリです。"
           page2.bgImage = UIImage(named:"IntroViewPaper2")
           page2.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
           page2.titleColor = UIColor.black
           page2.descColor = UIColor.black
           page2.descPositionY = self.view.bounds.size.height/2
           

       let page3 : EAIntroPage = EAIntroPage()
               
           page3.title = "では始めましょう"
           page3.desc = "おやすみ前に５分入力するだけ"
           page3.bgImage = UIImage(named:"IntroViewPaper3")
           page3.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
           page3.titleColor = UIColor.black
           page3.descColor = UIColor.black
           page3.descPositionY = self.view.bounds.size.height/2
       
           
           
       let intro : EAIntroView = EAIntroView(frame: self.view.bounds, andPages:[page1,page2,page3])
          
           intro.delegate = self
           intro.show(in: self.view, animateDuration:0.0)

    }
  
       
   
    
    

    

}

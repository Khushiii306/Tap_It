//
//  ViewController.swift
//  Tapit
//
//  Created by DCS on 06/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    var timeleft = 30
    var score = 0
    var name:String = ""
    private var timer = Timer()
    
    private let grid1:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 25, y: 80, width: 100, height: 100)
        
        return view
    }()
    
    private let grid2:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 135, y: 80, width: 100, height: 100)
        return view
    }()
    
    private let grid3:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 245, y: 80, width: 100, height: 100)
        return view
    }()
    
    private let grid4:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 25, y: 190, width: 100, height: 100)
        return view
    }()
    
    private let grid5:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 135, y: 190, width: 100, height: 100)
        return view
    }()
    
    private let grid6:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 245, y: 190, width: 100, height: 100)
        return view
    }()
    
    private let grid7:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 25, y: 300, width: 100, height: 100)
        return view
    }()
    
    private let grid8:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 135, y: 300, width: 100, height: 100)
        return view
    }()
    
    private let grid9:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.frame = CGRect(x: 245, y: 300, width: 100, height: 100)
        return view
    }()
    
    
    private let timerlabel : UILabel = {
        let label = UILabel()
        label.text = "30"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.frame = CGRect(x: 200, y: 430, width: 80, height: 50)
        return label
    }()
    
    private let lbl : UILabel = {
        let label = UILabel()
        label.text = "Timer :"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.frame = CGRect(x: 130, y: 430, width: 80, height: 50)
        return label
    }()
    
   
    
   
    
    
    private let score_lbl : UILabel = {
        let score = UILabel()
        score.text = "Score :  "
        score.textColor = .black
        score.textAlignment = .center
        score.shadowColor = .darkGray
        score.font = .boldSystemFont(ofSize: 20)
        score.frame = CGRect(x: 125, y: 470, width: 80, height: 50)
        return score
    }()
    
    
    
    @objc private let Score : UILabel = {
        let sc = UILabel()
        sc.text = "0"
        sc.textColor = .black
        sc.textAlignment = .center
        sc.shadowColor = .darkGray
        sc.font = .boldSystemFont(ofSize: 20)
        sc.frame = CGRect(x: 180, y: 470, width: 80, height: 50)
        return sc
    }()
    
    
    
    private let stop : UIButton = {
        let strt = UIButton()
        strt.setTitle("Start", for: .normal)
        strt.addTarget(self, action: #selector(starttimer), for: .touchUpInside)
        strt.backgroundColor = .black
        strt.setTitleColor(.white, for: .normal)
        strt.layer.cornerRadius = 25
        strt.frame = CGRect(x: 130, y: 520, width: 120, height: 60)
        return strt
    } ()
    
    private let leaderboard : UIButton = {
        let strt = UIButton()
        strt.setTitle("Leaderboard", for: .normal)
        strt.addTarget(self, action: #selector(lead), for: .touchUpInside)
        strt.backgroundColor = .gray
        strt.setTitleColor(.white, for: .normal)
        strt.layer.cornerRadius = 25
        strt.frame = CGRect(x: 130, y: 500, width: 120, height: 60)
        return strt
    } ()
    
    
    @objc private func lead(){
        let ld = LeaderboardVC()
        navigationController?.pushViewController(ld, animated: true)
    }
    
    @objc private func starttimer()
    {
        
       
        stop.isHidden = true
        
        score_lbl.isHidden = false
        Score.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Timerstart), userInfo: .none, repeats: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("run")
        title = "Tap it"
       
        view.addSubview(grid1)
        view.addSubview(grid2)
        view.addSubview(grid3)
        view.addSubview(grid4)
        view.addSubview(grid5)
        view.addSubview(grid6)
        view.addSubview(grid7)
        view.addSubview(grid8)
        view.addSubview(grid9)
        view.addSubview(timerlabel)
        view.addSubview(lbl)
        view.addSubview(score_lbl)
        view.addSubview(Score)
        view.addSubview(stop)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sm.jpg")!)
        
        let alert = UIAlertController(title: "Rules", message: "Tap On Highlighted Box To Earn +10 Point, If tap On Wrong Box Then lose -5 Point, Tap Within Given Time, Click Start To Begin", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    
        
        
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didtapgrid1))
        tapgesture.numberOfTapsRequired = 1
        tapgesture.numberOfTouchesRequired = 1
        
        let tapgesture2 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid2))
        tapgesture2.numberOfTapsRequired = 1
        tapgesture2.numberOfTouchesRequired = 1
        
        let tapgesture3 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid3))
        tapgesture3.numberOfTapsRequired = 1
        tapgesture3.numberOfTouchesRequired = 1
        
        let tapgesture4 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid4))
        tapgesture4.numberOfTapsRequired = 1
        tapgesture4.numberOfTouchesRequired = 1
        
        let tapgesture5 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid5))
        tapgesture5.numberOfTapsRequired = 1
        tapgesture5.numberOfTouchesRequired = 1
        
        let tapgesture6 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid6))
        tapgesture6.numberOfTapsRequired = 1
        tapgesture6.numberOfTouchesRequired = 1
        
        let tapgesture7 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid7))
        tapgesture7.numberOfTapsRequired = 1
        tapgesture7.numberOfTouchesRequired = 1
        
        let tapgesture8 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid8))
        tapgesture8.numberOfTapsRequired = 1
        tapgesture8.numberOfTouchesRequired = 1
        
        let tapgesture9 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid9))
        tapgesture9.numberOfTapsRequired = 1
        tapgesture9.numberOfTouchesRequired = 1
        
        
        grid1.addGestureRecognizer(tapgesture)
        grid2.addGestureRecognizer(tapgesture2)
        grid3.addGestureRecognizer(tapgesture3)
        grid4.addGestureRecognizer(tapgesture4)
        grid5.addGestureRecognizer(tapgesture5)
        grid6.addGestureRecognizer(tapgesture6)
        grid7.addGestureRecognizer(tapgesture7)
        grid8.addGestureRecognizer(tapgesture8)
        grid9.addGestureRecognizer(tapgesture9)
        
        
    }
    
    
   
}

extension ViewController{
    
    @objc private func didtapgrid1(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid1.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
            }
            else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    
    @objc private func didtapgrid2(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid2.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid3(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid3.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    @objc private func didtapgrid4(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid4.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid5(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid5.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid6(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid6.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid7(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid7.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid8(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid8.backgroundColor!.isEqual(UIColor.gray))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid9(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid9.backgroundColor!.isEqual(UIColor.gray))
        {
            //print("yes")
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    
    
    
    @objc private func Timerstart(){
        self.timeleft -= 1
        self.timerlabel.text = String(self.timeleft)
        let randomInt = Int.random(in: 1..<10)
        if( randomInt == 1)
        {
            grid1.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
            
        }
        else if(randomInt == 2)
        {
            grid2.backgroundColor = .gray
            grid1.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 3)
        {
            grid3.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid1.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 4)
        {
            grid4.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid1.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 5)
        {
            grid5.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid1.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 6)
        {
            grid6.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid1.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 7)
        {
            grid7.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid1.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 8)
        {
            grid8.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid1.backgroundColor = .black
            grid9.backgroundColor = .black
        }
        else if(randomInt == 9)
        {
            grid9.backgroundColor = .gray
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid1.backgroundColor = .black
        }
        
        if(self.timeleft==0){
            timer.invalidate()
            grid1.backgroundColor = .black
            grid2.backgroundColor = .black
            grid3.backgroundColor = .black
            grid4.backgroundColor = .black
            grid5.backgroundColor = .black
            grid6.backgroundColor = .black
            grid7.backgroundColor = .black
            grid8.backgroundColor = .black
            grid9.backgroundColor = .black
            
            let alert = UIAlertController(title: "Username", message: "Please Enter Your Name", preferredStyle: .alert)
            alert.addTextField { (tf) in tf.placeholder = "Enter Your Name"}
            
            let action = UIAlertAction(title: "submit", style: .default) { (_) in
                self.name = (alert.textFields?.first?.text)!
                UserDefaults.standard.setValue("sessionkey", forKey: "UserToken")
                UserDefaults.standard.setValue(self.name, forKey: "Name")
                UserDefaults.standard.setValue(self.score, forKey: "Score")
                let vc = LeaderboardVC()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            alert.addAction(action)
            present(alert , animated: true , completion: nil)
        }
    }
}

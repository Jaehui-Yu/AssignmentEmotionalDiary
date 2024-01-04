//
//  ViewController.swift
//  AssignmentEmotionalDiary
//
//  Created by Jaehui Yu on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slimeButton: [UIButton]!
    @IBOutlet var slimeLabel: [UILabel]!
    
    var imageList = ["slime1", "slime2", "slime3", "slime4", "slime5", "slime6", "slime7", "slime8", "slime9"]
    var textList = ["행복해", "좋아해", "사랑해", "짜증나", "그냥 그래", "졸려", "당황했어", "언짢아", "슬퍼"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let countArray = UserDefaults.standard.array(forKey: Key.slime.rawValue) {
            for i in 0..<imageList.count {
                slimeButton[i].setImage(UIImage(named: imageList[i]), for: .normal)
            }
            
            for i in 0..<textList.count {
                slimeLabel[i].text = "\(textList[i]) \(countArray[i])"
                slimeLabel[i].textAlignment = .center
            }
        } else {
            print("error")
        }
        
    }
    
    @IBAction func slimeButtonTapped(_ sender: UIButton) {
        let number = sender.tag
        
        if var countArray = UserDefaults.standard.array(forKey: Key.slime.rawValue) as? [Int]{
            countArray[number] += 1
            UserDefaults.standard.set(countArray, forKey: Key.slime.rawValue)
            slimeLabel[number].text = "\(textList[number]) \(countArray[number])"
        } else {
            print("error")
        }
    }
}

enum Key: String {
    case slime
}


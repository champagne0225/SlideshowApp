//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 関智矢 on 2020/12/31.
//  Copyright © 2020 tomoya.seki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // タイマー
    var timer: Timer!
    
    // インデックス
    var currentIndex: Int = 0
    
    // 画像の配列
    var images = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.currentIndex = self.currentIndex
    }

    @IBAction func tapAction(_ sender: Any) {
    }
    
    @objc func changeImage(_ timer: Timer) {
        self.currentIndex += 1
        
        if currentIndex == images.count {
            currentIndex = 0
        }
        
        imageView.image = images[currentIndex]
    }
    
    @IBAction func startSlideshow(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage(_:)), userInfo: nil, repeats: true)
            
            startButton.setTitle("停止", for: .normal)
            
            self.nextButton.isEnabled = false
            self.prevButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            startButton.setTitle("再生", for: .normal)

            self.nextButton.isEnabled = true
            self.prevButton.isEnabled = true
        }
    }
    
    @IBAction func nextSlideshow(_ sender: Any) {
        self.currentIndex += 1
        
        if currentIndex == images.count {
            currentIndex = 0
        }
        
        imageView.image = images[currentIndex]
    }
    
    @IBAction func prevSlideshow(_ sender: Any) {
        self.currentIndex -= 1
        
        if currentIndex == -1 {
            currentIndex = 2
        }
        
        imageView.image = images[currentIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきたときに呼ばれる
    }
}


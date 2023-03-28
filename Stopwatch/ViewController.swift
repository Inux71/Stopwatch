//
//  ViewController.swift
//  Stopwatch
//
//  Created by Kacper Grabiec on 22/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    private var timer = Timer()
    private var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeLabel.text = "00:00:00"
        pauseButton.isEnabled = false
    }

    private func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func pauseTimer() {
        timer.invalidate()
    }
    
    private func stopTimer() {
        timer.invalidate()
        
        counter = 0
        timeLabel.text = "00:00:00"
        pauseButton.isEnabled = false
    }
    
    @objc private func updateTimer() {
        counter += 1

        let hours = counter / 3600
        let minutes = counter / 60 % 60
        let seconds = counter % 60
        
        timeLabel.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        startTimer()
        startButton.isEnabled = false
        pauseButton.isEnabled = true
    }
    
    
    @IBAction func pauseButtonClicked(_ sender: Any) {
        pauseTimer()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        stopTimer()
        startButton.isEnabled = true
    }
}

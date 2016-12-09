//
//  ViewController.swift
//  TareaAudio
//
//  Created by Gonzalo Linares N on 6/12/16.
//  Copyright © 2016 Gonzalo Linares N. All rights reserved.
//

/*
 
 Please use iphone 5S to simulate this project. Thanks.
 
*/

import UIKit
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var songCoverImageView: UIImageView!
    @IBOutlet weak var currentSongLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var songs:[String] = []
    fileprivate var imagesSongs:[String] = []
    
    fileprivate var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.songs = ["One-Metallica",
                      "Phantom_Opera-Nightwish",
                      "Stairway_To_Heaven-Led",
                      "We_Will_Rock_You-Queen",
                      "Dear_You-Higurashi"]
        
        self.imagesSongs = ["one.jpg",
                            "po.jpg",
                            "stairway.jpg",
                            "queen.jpg",
                            "dearyou.jpg"]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self;
        
        self.currentSongLabel.text = ""
        self.songCoverImageView.image = nil
        self.songCoverImageView.layer.cornerRadius = self.songCoverImageView.frame.size.width/2
        self.songCoverImageView.clipsToBounds = true
        self.songCoverImageView.contentMode = UIViewContentMode.scaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "SongsTableViewCell", for: indexPath) as! SongsTableViewCell
        
        cell.songLabel.text = self.songs[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentRow = indexPath.row
        
        let soundURL = Bundle.main.url(forResource: self.songs[currentRow], withExtension: "mp3")
        
        var flat:Bool = false
        
        do{
            
            try self.player = AVAudioPlayer(contentsOf: soundURL!)
            flat = true
            
        }catch{
            
            print("Error connection")
            flat = false
        }
        
        if flat {
            
            self.songCoverImageView.image = UIImage(named: self.imagesSongs[currentRow])
            
            self.currentSongLabel.text = self.songs[currentRow]
            
            self.playButton(UIButton())
            
        }
        
        print(indexPath.row)
    }
    
    
    //Buttons actions
    
    @IBAction func playButton(_ sender: UIButton) {
        
        if !self.player.isPlaying{
            
            self.player.play()
        }
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        
        if self.player.isPlaying{
            
            self.player.pause()
        }
        
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        if self.player.isPlaying{
            
            self.player.stop()
            self.player.currentTime = 0.0
        }
    }
    
    @IBAction func shuffleButton(_ sender: AnyObject) {
        
        let random:Int = Int(arc4random_uniform(5))
        print(random)
        
        self.tableView(self.tableView, didSelectRowAt: IndexPath.init(row: random, section: 1))
    }
    
    //slider action
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        print(sender.value)
        
        if self.player.isPlaying{
            
            self.player.volume = sender.value
        }
    }
}


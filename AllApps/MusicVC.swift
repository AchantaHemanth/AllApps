//
//  ViewController.swift
//  MusicApp
//
//  Created by Hemanth on 25/12/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

import UIKit
import AVFoundation

class MusicVC: UIViewController {
var player = AVAudioPlayer()
    
    let playerList = ["Yeda Poyinado","Anaganaganaga","Peniviti","Reddy Ikkada Soodu","Reddamma Thalli","Reddamma Thalli (Female)"]
    let castCrew = ["Jr.NTR & Pooja Hedge"]
    let lyrics = ["Sirivennela Seetharama Sastry, Ramajogayya Sastry & Penchal Das"]
    let director = ["Trivikram Srinivas"]
    let producer = ["S Radha Krishna"]
    let singers = ["Yeda Poyinado":"Nikhita Srivalli & Kailash Kher","Anaganaganaga":"Armaan Malik","Peniviti":"Kaala Bhairava","Reddy Ikkada Soodu":"Daler Mehendi & Anjana Soumya","Reddamma Thalli":"Penchal Das","Reddamma Thalli (Female)":"Mohana Bhogaraju"]
    var currentSongName = String()
    var songDetails = [String:String]()
    
    @IBOutlet var songNameLbl: UILabel!
    @IBOutlet var castLbl: UILabel!
    @IBOutlet var lyricsLbl: UILabel!
    @IBOutlet var directorLbl: UILabel!
    @IBOutlet var producerLbl: UILabel!
    @IBOutlet var singersLbl: UILabel!
    
    var currentSong = Int()
    var isSongPlaying = false
    
    @IBOutlet var pauseBtn: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print(singers.count)
    }

    @IBAction func playAction(_ sender: UIButton)
    {
        currentSong = 0
        isSongPlaying = true
        playSong(currentSong: playerList[currentSong], type: "mp3")
        currentSongName = playerList[currentSong]
        songDetails["songName"] = playerList[currentSong]
        songDetails["crewName"] = castCrew[currentSong]
        songDetails["lyricsName"] = lyrics[currentSong]
        songDetails["directorName"] = director[currentSong]
        songDetails["producerName"] = producer[currentSong]
        songDetails["singerName"] = singers[currentSongName]
        getSongDetails(details: songDetails)
    }
    
    @IBAction func previousAction(_ sender: UIButton)
    {
        currentSong = currentSong - 1
        print(currentSong)
        if currentSong > -1
        {
            
            
            playSong(currentSong: playerList[currentSong], type: "mp3")
            currentSongName = playerList[currentSong]
            songDetails["songName"] = playerList[currentSong]
            songDetails["crewName"] = castCrew[0]
            songDetails["lyricsName"] = lyrics[0]
            songDetails["directorName"] = director[0]
            songDetails["producerName"] = producer[0]
            songDetails["singerName"] = singers[currentSongName]
            getSongDetails(details: songDetails)
        }
        else
        {
           
            let alert = UIAlertController.init(title: "Alert", message: "No Songs To Play In List", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            player.stop()
        }
      
    }
    
    @IBAction func pauseAction(_ sender: UIButton)
    {
        if isSongPlaying == true
        {
            player.pause()
            pauseBtn.setImage(UIImage(named: "play.png"), for: .normal)
            isSongPlaying = false
        }
        else
        {
            player.play()
            pauseBtn.setImage(UIImage(named: "pause.png"), for: .normal)
            isSongPlaying = true
        }
        
    }
    
    @IBAction func nextBtn(_ sender: UIButton)
    {
       currentSong = currentSong + 1
        print(currentSong)
        if currentSong < playerList.count
        {
            playSong(currentSong: playerList[currentSong], type: "mp3")
            currentSongName = playerList[currentSong]
            songDetails["songName"] = playerList[currentSong]
            songDetails["crewName"] = castCrew[0]
            songDetails["lyricsName"] = lyrics[0]
            songDetails["directorName"] = director[0]
            songDetails["producerName"] = producer[0]
            songDetails["singerName"] = singers[currentSongName]
            getSongDetails(details: songDetails)
        }
        else
        {
            let alert = UIAlertController.init(title: "Alert", message: "No Songs To Play In List", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            player.stop()
            currentSong = 5
        }
      }
    
    @IBAction func stopAction(_ sender: UIButton)
    {
        player.stop()
    }
    
    @IBAction func volIncrease(_ sender: UIButton)
    {
       player.volume = player.volume + 1
       //print(player.volume)
    }
    @IBAction func volDecrease(_ sender: UIButton)
    {
        player.volume = player.volume - 1
    }
    
    func playSong(currentSong:String,type:String)
    {
        print(currentSong)
        let playBtn = URL(fileURLWithPath: Bundle.main.path(forResource: currentSong, ofType: type)!)
        do
        {
            player = try AVAudioPlayer(contentsOf: playBtn)
            player.play()
        }
        catch
        {
            
        }
    }
    
    func getSongDetails(details:[String:String])
    {
        //print(details)
        songNameLbl.text = details["songName"]
        castLbl.text = details["crewName"]
        lyricsLbl.text = details["lyricsName"]
        directorLbl.text = details["directorName"]
        producerLbl.text = details["producerName"]
        singersLbl.text = details["singerName"]
    }
    
}


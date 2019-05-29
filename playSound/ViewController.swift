//
//  ViewController.swift
//  playSound
//
//  Created by Mickey on 2019/5/24.
//  Copyright © 2019 Mickey. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox //內建音效函式庫
import MapKit

class ViewController: UIViewController {

//    var myPlayer: AVAudioPlayer?
    var myPlayer = AVAudioPlayer()
    
    @IBOutlet weak var faButton: UIButton!
    @IBOutlet weak var GifView: UIImageView!
    
    
    //    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faButton.clipsToBounds = true
        faButton.layer.cornerRadius = 25
        
        
        GifView.loadGif(name:"money")
        //找出檔案路徑
        if let path = Bundle.main.path(forResource: "發大財", ofType: "mp3"){
            //找出檔案URL
            let url = URL(fileURLWithPath: path)
            do{
                myPlayer = try AVAudioPlayer(contentsOf: url)
                myPlayer.volume = 1.2
                myPlayer.enableRate = true
                myPlayer.rate = 1.2
            }catch{
                print(error.localizedDescription)
            }
        }
        
//        //經緯度 25.043289 , 121.535279
//        let lat:CLLocationDegrees = 25.043289
//        let long:CLLocationDegrees = 121.535279
//
//        // 產生座標
//        let coordinate = CLLocationCoordinate2DMake(lat, long)
//
//        //直向縮放 橫向縮放
//        let latDelta:CLLocationDegrees = 0.01
//        let longDelta:CLLocationDegrees = 0.01
//        //產生縮放範圍
//        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//
//       let region =  MKCoordinateRegion(center: coordinate , span: span)
//
//        mapView.setRegion(region, animated: true)
//
    
        
    }

    @IBAction func playSound(_ sender: UIButton) {
        myPlayer.stop()
        myPlayer.currentTime = 0
        myPlayer.prepareToPlay()
        myPlayer.play()
    
    }
    
}


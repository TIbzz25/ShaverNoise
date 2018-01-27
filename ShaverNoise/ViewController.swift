//
//  ViewController.swift
//  ShaverNoise
//
//  Created by Tam Ibz on 25/01/2018.
//  Copyright © 2018 tamibzz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var OnButtonEdit: UIButton!
    @IBOutlet weak var StopButtonEdit: UIButton!
    @IBOutlet weak var onLight: UIView!
    @IBOutlet weak var ShaverImage: UIButton!
    @IBOutlet weak var upButtonEdit: UIButton!
    @IBOutlet weak var ColourView: UIView!
    @IBOutlet weak var downArrowEdit: UIButton!
    @IBOutlet weak var GreenEdit: UIButton!
    @IBOutlet weak var redEdit: UIButton!
    @IBOutlet weak var blueEdit: UIButton!
    @IBOutlet weak var ResetButtonEdit: UIButton!

      var Sound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    func setup() {
        onLight.layer.cornerRadius = 12
        GreenEdit.layer.cornerRadius = 25
        redEdit.layer.cornerRadius = 25
        blueEdit.layer.cornerRadius = 25
    }
    override func viewWillAppear(_ animated: Bool) {
        downArrowEdit.isHidden = true
        ColourView.isHidden = true
        GreenEdit.isHidden = true
        redEdit.isHidden = true
        blueEdit.isHidden = true
        ResetButtonEdit.isHidden = true


    }

    @IBAction func ShaverButtonTapped(_ sender: UIButton) {

        let path = Bundle.main.path(forResource: "RazorSound", ofType: "wav")!
        let url = URL(fileURLWithPath: path)

        do {
            Sound = try AVAudioPlayer(contentsOf: url)
            Sound?.play()
        } catch {
            print("Didnt Work For Some Reason...")
        }
        onLight.backgroundColor = .green
        ShaverImage.backgroundColor = .green


    }
    @IBAction func StopButtonAction(_ sender: UIButton) {
        Sound?.stop()
        onLight.backgroundColor = .red

//        if OnButtonEdit.isSelected == true || StopButtonEdit.isSelected == false{
//            onLight.backgroundColor = .white
//        }
//        if OnButtonEdit.isSelected == false || StopButtonEdit.isSelected == true {
//            onLight.backgroundColor = .red
//        }

//        if OnButtonEdit.isSelected == false {
//            StopButtonEdit.isEnabled = false
//        }
//        if OnButtonEdit.isSelected == true {
//            StopButtonEdit.isEnabled = true
//        }
    }
    @IBAction func UpButtonAction(_ sender: UIButton) {
        upButtonEdit.isHidden = true
        ColourView.isHidden = false
        downArrowEdit.isHidden = false
        GreenEdit.isHidden = false
        redEdit.isHidden = false
        blueEdit.isHidden = false
        ResetButtonEdit.isHidden = false
    }

    @IBAction func DownArrowAction(_ sender: Any) {
        downArrowEdit.isHidden = true
        ColourView.isHidden = true
        upButtonEdit.isHidden = false
        GreenEdit.isHidden = true
        redEdit.isHidden = true
        blueEdit.isHidden = true
        ResetButtonEdit.isHidden = true

    }
    @IBAction func GreenActionBtn(_ sender: UIButton) {
        ShaverImage.setImage(#imageLiteral(resourceName: "green"), for: .normal)
    }
    
    @IBAction func RedActionBtn(_ sender: UIButton) {
        ShaverImage.setImage(#imageLiteral(resourceName: "red"), for: .normal)
    }
    @IBAction func BlueAcctionBtn(_ sender: UIButton) {
        ShaverImage.setImage(#imageLiteral(resourceName: "blue"), for: .normal)
    }
    @IBAction func resetButtonAction(_ sender: UIButton) {
        ShaverImage.setImage(#imageLiteral(resourceName: "ShaverImage"), for: .normal)
        onLight.backgroundColor = .white
        Sound?.stop()
    }
}


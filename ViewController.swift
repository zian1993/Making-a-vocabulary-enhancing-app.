//
//  ViewController.swift
//  VocabularyGame
//
//  Created by Hassan Khan on 10/2/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Declaring all my Interface Builder Variables.
    //Declaring the buttons first:
    @IBOutlet private var img1 : UIButton!
    @IBOutlet private var img2 : UIButton!
    @IBOutlet private var img3 : UIButton!
    @IBOutlet private var nextbutton : UIButton!
    @IBOutlet private var repeatbutton : UIButton!
    
    //Declaring the UI slider:
    @IBOutlet private var slider: UISlider!
    
    //Now declaring the two UI labels to be used.
    @IBOutlet private var correctlabel : UILabel!
    @IBOutlet private var incorrectlabel: UILabel!
    
    //Declaring my private data fields
    private var rand1: Int
    private var rand2: Int
    private var vocab: VocabGenerator
    private var tempimgs: [UIImage]
    private var mainimg: UIImage
    private var buttonnum : Int
    private var mainname: String
    
    //Declaring the sound player variable
    private var player : AVPlayer?
    
    required  init?(coder aDecoder: NSCoder)
    {
        
        //Initialize any non IBOutlets here
        
        rand1 = 0
        rand2 = 0
        tempimgs = [UIImage]()
        mainimg = UIImage()
        buttonnum = 0
        mainname = String()
        
        vocab = VocabGenerator()
        
        super.init(coder: aDecoder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Setting the slider to 0.1 initially.
        slider.value = 0.1
        
        wholeapp()
    }
    
    @IBAction func all(sender: AnyObject, forEvent event: UIEvent)
    {
        //Typecast before using
        //Setting up the images that the user might press
        if (sender is UIButton)
        {
                //Resetting the labels first
                correctlabel.isHidden = true
                incorrectlabel.isHidden = true
            
        
            if (sender as! UIButton == img1)
            {
                if (buttonnum==1)
                {
                correctlabel.isHidden = false
                }
                
                else
                {
                    incorrectlabel.isHidden = false
                }
            }
            
            if (sender as! UIButton == img2)
            {
                if (buttonnum==2)
                {
                    correctlabel.isHidden = false
                }
                    
                else
                {
                    incorrectlabel.isHidden = false
                }
            }
            
            if (sender as! UIButton == img3)
            {
                if (buttonnum==3)
                {
                    correctlabel.isHidden = false
                }
                    
                else
                {
                    incorrectlabel.isHidden = false
                }
            }
            
            if (sender as! UIButton == nextbutton)
            {
                //If user presses next button, we just repeat the
                //functionalities of the app
                //Therefore we call our wholeapp function
                resetvar()
                wholeapp()
            }
            
            if (sender as! UIButton == repeatbutton)
            {
                //Playing the sound again.
                soundman()
            }

            

        }
        
        else if (sender is UISlider)
        {
            //slider.value
            player?.volume = (slider.value)
        }
    }
    
    public func resetvar()
    {
        rand1 = 0
        rand2 = 0
        tempimgs = [UIImage]()
        mainimg = UIImage()
        buttonnum = 0
        mainname = String()
        
        vocab = VocabGenerator()
    }
    
    public func soundman()
    {
        let path = Bundle.main.path(forResource: mainname, ofType: "mp3");
        let url = URL(fileURLWithPath: path!);
        player = AVPlayer(url:url);
        player?.play()
    }
    
    public func wholeapp()
    {
        
        //First hiding both the labels
        correctlabel.isHidden = true
        incorrectlabel.isHidden = true
        
        //Generating the random numbers
        rand1 = Int(arc4random_uniform(45))
        rand2 = Int(arc4random_uniform(2))+1
        
        //Passing the random numbers into the Vocabgenerator.
        mainimg = vocab.imagereturn(rand1, rand2)
        
        //Setting the background images of the buttons
        
        //Randonly generating the button number that will hold
        //the image for which the sound will be played.
        buttonnum = Int(arc4random_uniform(3))+1
        
        //Generating the other two random images and saving them.
        tempimgs = vocab.randimagesreturn()
        
        //If else statements to assign the right, randomly generated
        //button to the main image
        if (buttonnum==1)
        {
            img1.setBackgroundImage(mainimg, for: .normal)
            img2.setBackgroundImage(tempimgs[0], for: .normal)
            img3.setBackgroundImage(tempimgs[1], for: .normal)
            
        }
            
        else if (buttonnum==2)
        {
            img2.setBackgroundImage(mainimg, for: .normal)
            img1.setBackgroundImage(tempimgs[0], for: .normal)
            img3.setBackgroundImage(tempimgs[1], for: .normal)
        }
            
        else
        {
            img3.setBackgroundImage(mainimg, for: .normal)
            img1.setBackgroundImage(tempimgs[0], for: .normal)
            img2.setBackgroundImage(tempimgs[1], for: .normal)
        }
        
        //Getting the name of the main image that was displayed,
        //so that the corresponding sound can be played
        mainname = vocab.nametoplay()
        
        //Playing the sound
        soundman()

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


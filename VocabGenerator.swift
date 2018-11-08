//
//  VocabGenerator.swift
//  VocabularyGame
//
//  Created by Hassan Khan on 10/3/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import Foundation
import UIKit

public class VocabGenerator{
    
    //The array containing all the images
    private var allimages: [UIImage]
    
    //Temporary variables
    private var tempimage: UIImage
    private var tempimage2: UIImage
    private var tempstring: String
    private var returnimgint: Int
    private var tempint1: Int
    private var tempint2: Int
    private var returnrandimages : [UIImage]
    private var namenum : Int
    private var nametoreturn: String
    
    //The array of all names
    private var namearray: [String]
    
    
    //Initializer for the class, it takes in two integers,
    //which are generated in the viewdidload.
    public init ()
    {
        //Initializing my private variables.
        namearray = [String]()
        namearray = ["TV", "arm", "bag", "ball", "beer", "boat", "box", "brain", "bus", "cat" ,"christmas" ,"clothes" ,"dress","eight" ,"feet" ,"fish" ,"gas" ,"gold" ,"hat" ,"horse" ,"hospital" ,"ice" ,"key", "letter" ,"meeting" ,"mouth","nose" ,"paper" ,"park" ,"plane" ,"present" ,"radio" ,"ring" ,"road" ,"rock" ,"seven" ,"shoes" ,"sun","tea" ,"train" ,"tree" ,"truck" ,"wall" ,"wedding" ,"window"]
        
        allimages = [UIImage]()
        
        //Temp variables init
        returnimgint = 0
        tempint1 = 0
        tempint2 = 0
        returnrandimages = [UIImage]()
        tempstring = ""
        tempimage = UIImage()
        tempimage2 = UIImage()
        namenum = 0
        nametoreturn = ""
        
        //Generating my images array when the initializer is called
        generateimages()
        
    }
    
    private func generateimages()
    {
        //Generating the array of UI images:
        for a in 0...44
        {
            tempstring = namearray[a]+"\(1)"+".jpeg"
            tempimage = UIImage(named: tempstring)!
            allimages.append(tempimage)
            tempstring = namearray[a]+"\(2)"+".jpeg"
            tempimage = UIImage(named: tempstring)!
            allimages.append(tempimage)
        }
    }
    
    public func imagereturn (_ rand: Int,_ rand2: Int) -> UIImage
    {
        //Getting the index for the name array first.
        namenum = rand
        
        //Getting the name of the image from the namearray,
        //based on the random numbers passed into the function.
        
        tempimage2 = UIImage(named: (namearray[namenum] + "\(rand2)"+".jpeg"))!
        
        returnimgint = allimages.index(of: tempimage2)!
        
        //Returning the image from the image array that is to be displayed.
        return allimages[returnimgint]
    }
    
    //This function will return the name of the image that is being
    //displayed, whose sound is to be played.
    public func nametoplay () -> String
    {
       nametoreturn = namearray[namenum]
        return (nametoreturn)
    }
    
    public func randimagesreturn () -> [UIImage]
    {
        //Creating two random numbers while they are not equal to one
        //another, or the the actual image whose sound will be played,
        //or the second version of the actual image whose sound will be
        //played.
        
        repeat{
            tempint1 = Int(arc4random_uniform(90))
            tempint2 = Int(arc4random_uniform(90))
        }while ((tempint1==tempint2)||(tempint1 == returnimgint)||(tempint2 == returnimgint)||(tempint1 == returnimgint-1)||(tempint2 == returnimgint-1)||(tempint1 == returnimgint+1)||(tempint2 == returnimgint+1))
        
        //||(tempint1 == returnimgint+1)||(tempint2 == returnimgint+1)||(tempint1 == returnimgint-1)||(tempint2 == returnimgint-1))
        
        //Returning the two random images
        returnrandimages.append(allimages[tempint1])
        returnrandimages.append(allimages[tempint2])
        
        return returnrandimages
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


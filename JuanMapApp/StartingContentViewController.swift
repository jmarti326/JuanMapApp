//
//  StartingContentViewController.swift
//  JuanMapApp
//
//  Created by Juan Marti on 8/23/15.
//  Copyright (c) 2015 Juan Marti. All rights reserved.
//

import UIKit

class StartingContentViewController: UIViewController {
    @IBOutlet weak var presentationImage: UIImageView!;
    @IBOutlet weak var presentationTitle: UILabel!;
    @IBOutlet weak var presentationDescription: UILabel!;
    @IBOutlet weak var presentationContinueBtn: UIButton!;
    @IBOutlet weak var presentationPageControl: UIPageControl!;
    
    var index : Int = 0;
    var heading : String = "";
    var descrip : String = "";
    var image : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentationTitle.text = heading;
        presentationDescription.text = descrip;
        presentationImage.image = UIImage(named: image);
        presentationPageControl.currentPage = index;
        
        presentationContinueBtn.hidden = (index == 2) ? false : true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePresentantion(sender: AnyObject){
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setBool(true, forKey: "hasViewedWalkthrough");
        
        dismissViewControllerAnimated(true, completion: nil);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

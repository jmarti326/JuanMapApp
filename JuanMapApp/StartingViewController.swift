//
//  StartingViewController.swift
//  JuanMapApp
//
//  Created by Juan Marti on 8/23/15.
//  Copyright (c) 2015 Juan Marti. All rights reserved.
//

import UIKit

class StartingViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var titleList = ["Welcome", "How to use", "Enjoy!"];
    
    var descriptionList = ["","Just move the map, and see the coordinate.",""];

    var imageNameList = ["Image1","Image2","Image3"];

    override func viewDidLoad() {
        super.viewDidLoad()

        //Set the data source to itself.
        dataSource = self;
        
        if let startingViewController = self.viewControllerAtIndex(0){
            setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! StartingContentViewController).index;
        
        index++;
        
        return self.viewControllerAtIndex(index);
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! StartingContentViewController).index;
        
        index--;
        
        return self.viewControllerAtIndex(index);
    }

    
    func viewControllerAtIndex(index: Int) -> StartingContentViewController? {
        
        if index == NSNotFound || index < 0 || index >= self.titleList.count {
            return nil;
        }
        
        // Create a new view controller and pass suitable data.
        if let startingContentViewController = storyboard?.instantiateViewControllerWithIdentifier("StartingContentViewController") as? StartingContentViewController {
            
            
            startingContentViewController.heading = titleList[index];
            startingContentViewController.descrip = descriptionList[index];
            startingContentViewController.image = imageNameList[index];
            startingContentViewController.index = index;
            
            return startingContentViewController;
        }
        
        return nil;
    }
    
    func forward(index: Int) {
        
        if let nextViewController = self.viewControllerAtIndex(index + 1) {
            setViewControllers([nextViewController], direction: .Forward, animated: true, completion: nil)
        }
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

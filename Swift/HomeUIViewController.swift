//
//  HomeUIViewController.swift
//  SwiftApp
//
//  Created by 朱佩 on 16/6/8.
//  Copyright © 2016年 朱佩. All rights reserved.
//

import UIKit
import QorumLogs
class HomeUIViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    var array:[String] = [
            "Label",
            "TextView",
            "TextField",
            "Table View",
            "Image View",
            "Segmented Control",
            "Button",
            "Slider",
            "Switch",
            "Progress View",
            "Page Control",
            "Stepper",
            "WebView",
            "Scroll View",
            "Date Picker",
            "Picker View"
        ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //init table view with nibName and cell id ""
        self.tableView.registerNib(UINib(nibName: "TableViewCell",bundle: nil), forCellReuseIdentifier: "viewTableCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        QL2("row : \(indexPath.row)")
        //the only id of cell
        let initIdentifier = "viewTableCell"

        let cell:TableViewCell =  tableView.dequeueReusableCellWithIdentifier(initIdentifier, forIndexPath: indexPath) as! TableViewCell
    
        //view name setter
        cell.viewName?.text = array[indexPath.row]
        return cell

    }
    
    //return the exactly
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        QL2("selected row is at \(indexPath.row)")
        let row = indexPath.row
        
//        let alertView:UIAlertView = UIAlertView.init(title: "Selected Line", message: "U had selected line at \(indexPath.row)", delegate: nil, cancelButtonTitle: "Cancel") //had been replaced by follows:
        
        let selectedViewName = array[row]
        
        QL2("is tha true? \("Label" == selectedViewName)")
        
        if "Label" == selectedViewName{
            
            /** 1. not work **/
            //self.navigationController?.pushViewController(labelController, animated: true)
            /** 2. working**/
            let labelController = LabelStudyViewController()
            self.presentViewController(labelController, animated: true,completion: nil)
            //**3. not working ** /
            
            //  故事版跳转的画必须View controller 添加到故事版
            /**
            let myStoryBoard = self.storyboard
            QL2("myStoryBoard is \(myStoryBoard)")
            let anotherView:LabelStudyViewController =  (myStoryBoard?.instantiateViewControllerWithIdentifier("labelViewController") as! LabelStudyViewController)
            self.presentViewController(anotherView, animated: true, completion: {})
 
            **/
            
            //let labelController = LabelStudyViewController()
            //self.view.window?.addSubview(labelController.view)

            
        }
        
        /** test of click event
        let alertView:UIAlertController = UIAlertController.init(title: "Selected Line", message: "U had selected line at \(array[row])", preferredStyle: UIAlertControllerStyle.Alert)
        
        let alertAction:UIAlertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.Default,handler:{ action in
            QL3("U click ok Btn")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {action in
            QL3("U click Cancel Btn")
        })
        
        alertView.addAction(alertAction)
        alertView.addAction(cancelAction)

        self.presentViewController(alertView, animated: true) { 
            QL2("alertAction handler")
        }
        **/
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

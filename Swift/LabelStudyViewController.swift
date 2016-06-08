//
//  LabelStudyViewController.swift
//  SwiftApp
//
//  Created by 朱佩 on 16/6/8.
//  Copyright © 2016年 朱佩. All rights reserved.
//

import UIKit
import QorumLogs
let CLIECK_EVENT_TAG:Int = 0x12
class LabelStudyViewController: UIViewController {

    @IBOutlet weak var backLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //普通label
        let label:UILabel = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 35))
        label.text = "普通Label"
        //label.transform = CGAffineTransformMakeRotation(0.0)//角度旋转
        label.adjustsFontSizeToFitWidth = true//字体大小调整宽度
        self.view.addSubview(label)
        
        let clickLabel:UILabel = UILabel(frame: CGRect(x:50,y:100,width:100,height:35))
        clickLabel.text = "我有点击事件"
        clickLabel.adjustsFontSizeToFitWidth = true
        clickLabel.tag = CLIECK_EVENT_TAG
        
        //1 way 添加点击事件
        var tap:UITapGestureRecognizer ;
        
        //        tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.click))
        //2 way 添加点击事件
        //        tap = UITapGestureRecognizer(target: self, action:"click")
        //3 way 添加点击事件 带参
        //        tap = UITapGestureRecognizer(target: self, action:"clickWithParams:")
        tap = UITapGestureRecognizer(target: self, action:#selector(LabelStudyViewController.clickWithParams))
        clickLabel.userInteractionEnabled = true
        clickLabel.addGestureRecognizer(tap)
        
        self.view.addSubview(clickLabel)
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(LabelStudyViewController.back))
        
        backLable.userInteractionEnabled = true
        backLable.addGestureRecognizer(backGesture)
    }
    
    func clickWithParams(sender:AnyObject){
        let tap:UITapGestureRecognizer = sender as! UITapGestureRecognizer
        print("\(tap.view?.tag)")
        print("come from clickWithParams label event with tag \(sender.view.tag)")
    }
    
    func back(sender:AnyObject){
        //self.navigationController?.popViewControllerAnimated(true)
        QL2("back....")
        /* not working */
        //self.parentViewController?.dismissViewControllerAnimated(true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: {})
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

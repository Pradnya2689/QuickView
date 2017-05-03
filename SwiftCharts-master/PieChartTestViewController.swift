//
//  PieChartTestViewController.swift
//  SwiftCharts
//
//  Created by Administrator on 24/03/17.
//  Copyright © 2017 ivanschuetz. All rights reserved.
//

import UIKit
import PieCharts

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

class PieChartTestViewController: UIViewController, PieChartDelegate {
    
    var mainLegendView = UIView()
    var orintation : UIDeviceOrientation!  = UIDevice.current.orientation
    var chartView: PieChart = PieChart(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-150));
     var count = String()
    
    var valueArray = ["298,012","182,430","276,936","135,301","1,246,637"]
    var valueArray1 = ["65,887","87,910","6492","3999","10,912"]
    var labelArray = ["D2C","FUSION","METRO","OTHERS","RETAIL"]
    var colorArray = [UIColor(red: 255.0/255.0, green: 214.0/255.0, blue: 0.0/255.0, alpha: 1.0),UIColor(red: 77.0/255.0, green: 208.0/255.0, blue: 255.0/255.0, alpha: 1.0),UIColor(red: 139.0/255.0, green: 195.0/255.0, blue: 74.0/255.0, alpha: 1.0),UIColor(red: 149.0/255.0, green: 117.0/255.0, blue: 205.0/255.0, alpha: 1.0),UIColor(red: 229.0/255.0, green: 57.0/255.0, blue: 53.0/255.0, alpha: 1.0)]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(appbecmat),
//            name: .UIApplicationWillEnterForeground,
//            object: nil)
        
        //self.rotated()
    }
    func rotated(){
        
        if(orintation == UIDevice.current.orientation){
            
        }else{
        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft && count == "PotraitValid")
        {
            orintation = UIDeviceOrientation.landscapeLeft
            self.LandscapeLeft()
            
        }
        else if (UIDevice.current.orientation == UIDeviceOrientation.landscapeRight && count == "PotraitValid") {
            self.LandscapeRight()
            orintation = UIDeviceOrientation.landscapeRight
            
        }
        else if (UIDevice.current.orientation == UIDeviceOrientation.portrait && count == "PotraitValid") {
            self.Potrait()
            orintation = UIDeviceOrientation.portrait
            
        }else{
            
        }
        }
    }
    func rotated11()
    {
        if (UIDevice.current.orientation.isValidInterfaceOrientation)
        {
           // count = "PotraitValid"
        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft && count == "PotraitValid")
        {
            self.LandscapeLeft()
            
        }
        else if (UIDevice.current.orientation == UIDeviceOrientation.landscapeRight && count == "PotraitValid") {
            self.LandscapeRight()
            
        }
        else if (UIDevice.current.orientation == UIDeviceOrientation.portrait && count == "PotraitValid") {
            self.Potrait()
            
        }
        else if (UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown)
        {

        }else if (UIDevice.current.orientation == UIDeviceOrientation.unknown)
        {
            print("unknown")
             count = "PotraitInvalid"
        }
        else if (UIDevice.current.orientation == UIDeviceOrientation.faceUp)
        {
            print("faceUp")
             count = "PotraitInvalid"
        }else if (UIDevice.current.orientation == UIDeviceOrientation.faceDown)
        {
            print("faceDown")
             count = "PotraitInvalid"
        }
        else
        {
            
            print("PotraitValid")
             count = "PotraitValid"
            self.rotated()
          /*  if (UIDevice.current.orientation.isValidInterfaceOrientation)
            {
            if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft && count == "PotraitValid")
            {
                self.LandscapeLeft()
                
            }
            else if (UIDevice.current.orientation == UIDeviceOrientation.landscapeRight && count == "PotraitValid") {
                self.LandscapeRight()

                
            }
            else if (UIDevice.current.orientation == UIDeviceOrientation.portrait && count == "PotraitValid") {
              // self.Potrait()
                
            }
            }*/
           
            }
        
        }
            
        else
        {
             print("invalid")
        count = "PotraitInvalid"
           
        
        }
        
        
    }
    
    func LandscapeLeft(){
        var mainLegendView = UIView()
        chartView.removeFromSuperview()
        mainLegendView.removeFromSuperview()
        mainLegendView = UIView()
        chartView = PieChart(frame: CGRect(x: 60, y: 70, width:200, height:200));
        self.view.addSubview(chartView)
        chartView.outerRadius = 100
        chartView.innerRadius = 0
        // mainLegendView.backgroundColor = UIColor.red
        
        mainLegendView.frame = CGRect(x: 400, y:70 , width: screenWidth, height: 200)
        self.view.addSubview(mainLegendView)
        setLegend1()
        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
        chartView.delegate = self
        chartView.models = createModels()
        
    }
    func LandscapeRight(){
        var mainLegendView = UIView()
        chartView.removeFromSuperview()
        mainLegendView.removeFromSuperview()
        mainLegendView = UIView()
        chartView = PieChart(frame: CGRect(x: 60, y: 70, width:200, height:200));
        self.view.addSubview(chartView)
        chartView.outerRadius = 100
        chartView.innerRadius = 0
        // mainLegendView.backgroundColor = UIColor.red
        
        mainLegendView.frame = CGRect(x: 400, y:70 , width: screenWidth, height: 200)
        self.view.addSubview(mainLegendView)
        setLegend1()
        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
        chartView.delegate = self
        chartView.models = createModels()
    }
    func Potrait()
    {
        chartView.removeFromSuperview()
        mainLegendView.removeFromSuperview()
        mainLegendView = UIView()
        chartView = PieChart(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-150));
        self.view.addSubview(chartView)
        chartView.outerRadius = 150
        chartView.innerRadius = 0
        mainLegendView.frame = CGRect(x: 0, y: screenHeight-220, width: screenWidth, height: 10)
        self.view.addSubview(mainLegendView)
        setLegend()
        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
        chartView.delegate = self
        chartView.models = createModels()
    }


    func appbecmat()
    {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
         count = "PotraitValid"
                NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PieChartTestViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        self.navigationItem.title = "Quick View"
        self.tabBarItem.title = "LOB VOLUME"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 226.0/255.0, green: 0.0/255.0, blue: 116.0/255.0, alpha: 1.0)]
        
       // chartView.clearsContextBeforeDrawing
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft
        {
            self.LandscapeLeft()
            
            
        } else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            self.LandscapeRight()
            
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            self.Potrait()
            
        }
        else
        {
        if ( orintation == UIDeviceOrientation.landscapeLeft)
        {
        self.LandscapeLeft()
        }
           
           else if orintation == UIDeviceOrientation.landscapeRight {
                self.LandscapeRight()
                
            }
        else  if orintation == UIDeviceOrientation.portrait {
                self.Potrait()
                
            }
            else
        {
            
             self.Potrait()
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

    }
   
    
    func onSelected(slice: PieSlice, selected: Bool)
    {
        
        print("Selected: \(selected), slice: \(slice)")
        var count = slice.data.id
        var count1 = count + 10
        if let label1 = self.view.viewWithTag(count+1) as? UILabel {
            print(label1.tag)
            if selected == true{
                label1.font = UIFont(name: "MyriadPro-Bold", size: 13)
                
            }else{
                label1.font = UIFont(name: "MyriadPro-Regular", size: 13)
            }
        }
        
        if let valuelabel = self.view.viewWithTag(count1) as? UILabel {
            print(valuelabel.tag)
            if selected == true{
                valuelabel.font = UIFont(name: "MyriadPro-Bold", size: 13)
                
            }else{
                valuelabel.font = UIFont(name: "MyriadPro-Regular", size: 13)
            }
        }

    }
    
    // MARK: - Models
    
    fileprivate func createModels() -> [PieSliceModel] {
        let alpha: CGFloat = 0.5
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if(appDelegate.loadSecondSet == true)
        {
        return [
            PieSliceModel(value: 298012, color: UIColor(red: 255.0/255.0, green: 214.0/255.0, blue: 0.0/255.0, alpha: 1.0)),
            PieSliceModel(value: 182430, color: UIColor(red: 77.0/255.0, green: 208.0/255.0, blue: 255.0/255.0, alpha: 1.0)),
            PieSliceModel(value: 276936, color: UIColor(red: 139.0/255.0, green: 195.0/255.0, blue: 74.0/255.0, alpha: 1.0)),
            PieSliceModel(value: 135301, color: UIColor(red: 149.0/255.0, green: 117.0/255.0, blue: 205.0/255.0, alpha: 1.0)),
            PieSliceModel(value: 1246637, color: UIColor(red: 229.0/255.0, green: 57.0/255.0, blue: 53.0/255.0, alpha: 1.0)),
        ]
        }
        else
        {
            return [
                PieSliceModel(value: 65887, color: UIColor(red: 255.0/255.0, green: 214.0/255.0, blue: 0.0/255.0, alpha: 1.0)),
                PieSliceModel(value: 87910, color: UIColor(red: 77.0/255.0, green: 208.0/255.0, blue: 255.0/255.0, alpha: 1.0)),
                PieSliceModel(value: 6492, color: UIColor(red: 139.0/255.0, green: 195.0/255.0, blue: 74.0/255.0, alpha: 1.0)),
                PieSliceModel(value: 3999, color: UIColor(red: 149.0/255.0, green: 117.0/255.0, blue: 205.0/255.0, alpha: 1.0)),
                PieSliceModel(value: 10912, color: UIColor(red: 229.0/255.0, green: 57.0/255.0, blue: 53.0/255.0, alpha: 1.0)),
            ]
        }
    }
    func setLegend1()
    {
        self.mainLegendView.removeFromSuperview()
          mainLegendView = UIView()
        mainLegendView.frame = CGRect(x: 400, y: 80, width: screenWidth, height: 10)
        self.view.addSubview(mainLegendView)
        let alpha: CGFloat = 0.5
        var getMainViewHeight = 10.0 as! CGFloat
        var getMainViewY = screenHeight-220
        var tag = 1
        var tag1 = 10
        for i in 0 ..< labelArray.count
        {
            let label = UILabel(frame: CGRect(x: 35, y: getMainViewHeight, width: 70, height: 20))
            label.textAlignment = NSTextAlignment.left
            label.font = UIFont(name: "MyriadPro-Regular", size: 13)
            label.text = "\(self.labelArray[i])"
            label.tag = tag
            tag += 1
            
            let  imgLabel = UILabel(frame: CGRect(x: 8, y: getMainViewHeight+3, width: 13, height: 13))
            imgLabel.backgroundColor = self.colorArray[i]
            
            let valuelabel = UILabel(frame: CGRect(x: 120, y: getMainViewHeight, width: 200, height: 20))
            valuelabel.textAlignment = NSTextAlignment.left
            valuelabel.font = UIFont(name: "MyriadPro-Regular", size: 13)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            
            
            if(appDelegate.loadSecondSet == true)
            {
                valuelabel.text = "\(self.valueArray[i])"
            }
            else if(appDelegate.loadSecondSet == false)
            {
                valuelabel.text = "\(self.valueArray1[i])"
            }
            
            
            valuelabel.tag = tag1
            tag1 += 1
            //valuelabel.text = "\(self.valueArray[i])"
            
            self.mainLegendView.addSubview(imgLabel)
            self.mainLegendView.addSubview(label)
            self.mainLegendView.addSubview(valuelabel)
            getMainViewHeight = getMainViewHeight + 30.0
        }
        
        
        mainLegendView.translatesAutoresizingMaskIntoConstraints = true
        // mainLegendView.frame = CGRect(x: 0, y: screenHeight-220, width: screenWidth, height: getMainViewHeight)
        mainLegendView.frame =  CGRect(x: 400, y: 70 , width: screenWidth, height: 200)
        
    }
    func setLegend()
    {
        self.mainLegendView.removeFromSuperview()
        mainLegendView = UIView()
        mainLegendView.frame = CGRect(x: 400, y: 80, width: screenWidth, height: 10)
        self.view.addSubview(mainLegendView)
         let alpha: CGFloat = 0.5
        var getMainViewHeight = 10.0 as! CGFloat
        var getMainViewY = screenHeight-220
        var tag = 1
        var tag1 = 10
        for i in 0 ..< labelArray.count
        {
            let label = UILabel(frame: CGRect(x: 35, y: getMainViewHeight, width: 70, height: 20))
            label.textAlignment = NSTextAlignment.left
            label.font = UIFont(name: "MyriadPro-Regular", size: 13)
            label.text = "\(self.labelArray[i])"
            label.tag = tag
            tag += 1
            
           let  imgLabel = UILabel(frame: CGRect(x: 8, y: getMainViewHeight+3, width: 13, height: 13))
            imgLabel.backgroundColor = self.colorArray[i]
            
            let valuelabel = UILabel(frame: CGRect(x: 120, y: getMainViewHeight, width: 200, height: 20))
            valuelabel.textAlignment = NSTextAlignment.left
            valuelabel.font = UIFont(name: "MyriadPro-Regular", size: 13)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            
            
            if(appDelegate.loadSecondSet == true)
            {
                valuelabel.text = "\(self.valueArray[i])"
            }
            else if(appDelegate.loadSecondSet == false)
            {
               valuelabel.text = "\(self.valueArray1[i])"
            }
            
            
            valuelabel.tag = tag1
            tag1 += 1
            //valuelabel.text = "\(self.valueArray[i])"
            
            self.mainLegendView.addSubview(imgLabel)
            self.mainLegendView.addSubview(label)
            self.mainLegendView.addSubview(valuelabel)
            getMainViewHeight = getMainViewHeight + 30.0
        }
       
        
        mainLegendView.translatesAutoresizingMaskIntoConstraints = true
      mainLegendView.frame = CGRect(x: 0, y: screenHeight-220, width: screenWidth, height: getMainViewHeight)
      // mainLegendView.frame =  CGRect(x: 400, y: 70 , width: screenWidth, height: 200)
    
    }
    
    // MARK: - Layers
    
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer
    {
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 135
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
    
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 75
        textLayerSettings.hideOnOverflow = false
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
    
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            
            let container = UIView()
            container.frame.size = CGSize(width: 200, height: 60)
            container.center = center
            let view = UIImageView()
            view.frame = CGRect(x: 30, y: 0, width: 40, height: 40)
            container.addSubview(view)
            let specialTextLabel = UILabel()
            specialTextLabel.textAlignment = .center

            
            return container
        }
    }
    
    
}





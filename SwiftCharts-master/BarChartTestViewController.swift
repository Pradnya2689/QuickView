//
//  BarChartTestViewController.swift
//  SwiftCharts
//
//  Created by Administrator on 23/03/17.
//  Copyright © 2017 ivanschuetz. All rights reserved.
//

import UIKit
import SwiftCharts
import PieCharts

private struct MyItem {
    let name: String
    let quantity: MyQuantity
    let value: Int
    
    init(name: String, quantity: MyQuantity, value: Int) {
        self.name = name
        self.quantity = quantity
        self.value = value
    }
}
 var label = UILabel()

private struct MyQuantity {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}
    class BarChartTestViewController: UIViewController {
        lazy fileprivate(set) var chartFrame: CGRect! = {
        CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height - 80)
    }()
        
        
//        if (UIDevice.current.orientation.isLandscape)
//        {
//    
   let label = UILabel(frame: CGRect(x: 0, y: screenHeight-80 , width: 180, height: 21))
//        }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
    }
    func appbecomeactive(){
        
//        if (UIDevice.current.orientation.isPortrait)
//        {
//            
//            label = UILabel(frame: CGRect(x: 0, y: 600, width: 180, height: 21))
//        }
//            
//        else if (UIDevice.current.orientation.isLandscape)
//        {
//            label = UILabel(frame: CGRect(x: 200, y: 0, width: 180, height: 21))
//            
//        }
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 226.0/255.0, green: 0.0/255.0, blue: 116.0/255.0, alpha: 1.0)]
        showChart(false)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let timeString = "Inventory Value as of \(dateFormatter.string(from: Date() as Date))"
        print(timeString)
        //label.text = String(timeString)
        
        label.font = UIFont(name: label.font.familyName, size: 10)
        // label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
          if(appDelegate.loadSecondSet == true){
        label.text = String(timeString)
        //label.text = "Inventory Value as of 2017-04-03"
          }else{
             label.text = "Inventory Value as of 2017-03-31"
        }
       self.view.addSubview(label)
        self.view.bringSubview(toFront: label)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = "Quick View"
        self.tabBarItem.title = "PROD CLASS"
        self.appbecomeactive()
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    fileprivate var chart: Chart?
    
    let colorsarr :[UIColor] = [UIColor.init(red: 122/255.0, green: 0/255.0, blue: 63/255.0, alpha: 0.8),
                                UIColor.init(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 10/255.0, blue: 137/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 51/255.0, blue: 156/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 112/255.0, blue: 186/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 173/255.0, blue: 216/255.0, alpha: 0.8)]
    
    let sideSelectorHeight: CGFloat = 50
  
    fileprivate func barsChart(_ horizontal: Bool) -> Chart {
        
        let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        
        
        let quantityVeryLow = MyQuantity(number: 100, text: "Very low")
        let quantityLow = MyQuantity(number: 250, text: "low")
        let quantityAverage = MyQuantity(number: 750, text: "Average")
        let quantityHigh = MyQuantity(number: 1050, text: "High")
        let quantityVeryHigh = MyQuantity(number: 1550, text: "Very high")
        let vals: [(title: String, val: CGFloat)]
        var  item0,item1,item2,item3,item4: MyItem!
        
        if(appDelegate.loadSecondSet == true){
            vals =  [
                ("AC", 1012864),
                ("HS", 1789544),
                ("CD", 726289),
                ("DU", 86640),
                ("CO", 62482),
                //("PP", 140)
                
            ]
            
            item0 = MyItem(name: "AC", quantity: quantityVeryHigh, value:1012864)
            item1 = MyItem(name: "HS", quantity: quantityHigh, value: 1789544)
            item2 = MyItem(name: "CD", quantity: quantityAverage, value: 726289)
            item3 = MyItem(name: "DU", quantity: quantityLow, value: 86640)
            item4 = MyItem(name: "CO", quantity: quantityLow, value: 62482)
            //item5 = MyItem(name: "PP", quantity: quantityLow, value: 140)
        }else{
            vals = [
                ("AC", 518358),
                ("HS", 86000),
                ("CD", 568851),
                ("DU", 16844),
                ("CO", 8587)
                //("PP", 140)
                
            ]
            
            item0 = MyItem(name: "AC", quantity: quantityVeryHigh, value:518358)
            item1 = MyItem(name: "HS", quantity: quantityHigh, value: 871311)
            item2 = MyItem(name: "CD", quantity: quantityAverage, value: 568851)
            item3 = MyItem(name: "DU", quantity: quantityLow, value: 16844)
            item4 = MyItem(name: "CO", quantity: quantityLow, value: 8587)
            
//                        vals = [
//                            ("AC", 01),
//                            ("HS", 9),
//                            ("CD", 4),
//                            ("DU", 8),
//                            ("CO", 7)
//                            //("PP", 140)
//            
//                        ]
//            
//                        item0 = MyItem(name: "AC", quantity: quantityVeryHigh, value:1)
//                        item1 = MyItem(name: "HS", quantity: quantityHigh, value: 9)
//                        item2 = MyItem(name: "CD", quantity: quantityAverage, value: 4)
//                        item3 = MyItem(name: "DU", quantity: quantityLow, value: 8)
//                        item4 = MyItem(name: "CO", quantity: quantityLow, value: 7)
        
        }
        
        let chartPoints1: [ChartPoint] = [item0, item1, item2, item3, item4].enumerated().map {index, item in
            let xLabelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont, rotation: 45, rotationKeep: .top)
            let x = ChartAxisValueString(item!.name, order: index, labelSettings: xLabelSettings)
            let y = ChartAxisValueString(String(item!.value), order: item!.quantity.number, labelSettings: labelSettings)
            // let  y =  ChartAxisValueInt($0.1)
            return ChartPoint(x: x, y: y)
        }
        
        
        let generator : ChartAxisGeneratorMultiplier!
        //let labelsGenerator : ChartAxisLabel!
        var xValues : [ChartAxisValue]!
        var yValues : ChartAxisModel!
        
        let (minVal, maxVal): (CGFloat, CGFloat) = vals.reduce((min: CGFloat(0), max: CGFloat(0))) {tuple, val in
            (min: min(tuple.min, val.val), max: max(tuple.max, val.val))
        }
        print(minVal)
        print(maxVal)
        
        var result:Float = 0.0
        var scale :Float = 0.0
        
        if(maxVal <= 10){
            
            result = 10
            scale = 1
            
            print(result)
            print(scale)
            
        }else if(maxVal <= 1){
            
            result = 1
            scale = 0.1
            
            print(result)
            print(scale)
            
        }
        else{
        
            var maxCnt = maxVal
            var cnt = 0
            var maxValue : CGFloat = 0.0
            while (true){
                
                print(maxCnt)
                maxCnt = maxCnt / 10
                
                if(maxCnt < 1){
                    break
                }
                cnt += 1
                maxValue = CGFloat(maxCnt)
                
            }
            
            print(maxValue)
            print(cnt)
            var ceilVal = ceilf(Float(maxValue))
            print(ceilVal)
            
            var multipler = pow(10, Float(cnt)) as Float
            
            
            
            //if(maxValue > 5.0){
                
                //ceilVal = 10.0
                result = Float(ceilVal) * Float(multipler)
                
//            }else{
//                
//                ceilVal = 5.0
//                result = Float(ceilVal) * Float(multipler)
//                
//            }
            
            print(result)
            
            scale = result / 10
            
            
            print(scale)
      }

        
        
//        let axisScale = (Int(maxVal-minVal)/(vals.count))
//        print(axisScale)
//        
//        let maxNumb = Int(maxVal) + (axisScale/2)
        
//        if(appDelegate.loadSecondSet == true){
//            generator = ChartAxisGeneratorMultiplier(200000)
//            
//            let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
//                return ChartAxisLabel(text: "\(scalar)", settings: labelSettings)
//            }
//            
//            
//            xValues = [ChartAxisValueString("", order: -1)] + chartPoints1.map{$0.x} + [ChartAxisValueString("", order: 5)]
//            
//            yValues = ChartAxisModel(firstModelValue: 0, lastModelValue: 1700000, axisTitleLabels: [ChartAxisLabel(text: "Volume", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
//        }else{
            //generator = ChartAxisGeneratorMultiplier(40000)
            generator = ChartAxisGeneratorMultiplier(Double(scale))
            let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
                
                //var val = Int(scalar)
                return ChartAxisLabel(text: "\(Int(scalar))", settings: labelSettings)
            }
            
            
            xValues = [ChartAxisValueString("", order: -1)] + chartPoints1.map{$0.x} + [ChartAxisValueString("", order: 5)]
            
//            yValues = ChartAxisModel(firstModelValue: 0, lastModelValue: 1000000, axisTitleLabels: [ChartAxisLabel(text: "Volume", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
            yValues = ChartAxisModel(firstModelValue: 0, lastModelValue: Double(result), axisTitleLabels: [ChartAxisLabel(text: "Volume", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
       // }
        
        
        
        let barViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsViewsLayer, chart: Chart) -> UIView? in
            let bottomLeft = layer.modelLocToScreenLoc(x: 0, y: 0)
            
            let minBarSpacing: CGFloat = ExamplesDefaults.minBarSpacing + 16
            
            let barWidth: CGFloat = (Env.iPad ? 50 : 23)
            
            let settings = ChartBarViewSettings(animDuration: 0.5)
            
            
            let (p1, p2): (CGPoint, CGPoint) = {
                if horizontal {
                    return (CGPoint(x: bottomLeft.x, y: chartPointModel.screenLoc.y), CGPoint(x: chartPointModel.screenLoc.x, y: chartPointModel.screenLoc.y))
                } else {
                    return (CGPoint(x: chartPointModel.screenLoc.x, y: bottomLeft.y), CGPoint(x: chartPointModel.screenLoc.x, y: chartPointModel.screenLoc.y))
                }
            }()
            
            
            return ChartPointViewBar(p1: p1, p2: p2, width: barWidth, bgColor: nil, settings: settings)
        }
        
        let xModel = ChartAxisModel(axisValues: xValues as! [ChartAxisValue], axisTitleLabel: ChartAxisLabel(text: "PROD CLASS", settings: labelSettings))
        
        
        let frame = view.bounds
        let chartFrame = CGRect(x: frame.origin.x, y: frame.origin.y+60, width: frame.size.width, height: frame.size.height - sideSelectorHeight-60)
        
        let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yValues)
        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        print(innerFrame)
        
        let chartPointsLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints1, viewGenerator: barViewGenerator)
        
        let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: ExamplesDefaults.guidelinesWidth)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
        

        let length: CGFloat = maxVal - minVal
        let zero = ChartAxisValueDouble(0)
        let bars: [ChartBarModel] = vals.enumerated().flatMap {index, tuple in
            
            let percentage = (tuple.val - minVal - 0.01) / length
            print(index)
              let color = colorsarr[index]
            print(color)
            return  ChartBarModel(constant: ChartAxisValueDouble(Double(index)), axisValue1: zero, axisValue2: ChartAxisValueDouble(Double(tuple.val)), bgColor: color)
            
            
        }

        let barViewSettings = ChartBarViewSettings(animDuration: 0.5)
        let barsLayer = ChartBarsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, bars: bars, horizontal: false, barWidth: Env.iPad ? 40 : 35, settings: barViewSettings)
        
        //LABEL FUNC
        let labelToBarSpace: Double = 3 // domain units
        let labelChartPoints = bars.map {bar in
            ChartPoint(x: bar.constant, y: bar.axisValue2.copy(bar.axisValue2.scalar + (bar.axisValue2.scalar > 0 ? labelToBarSpace : -labelToBarSpace)))
            //ChartPoint(x: bar.constant, y: bar.axisValue2)
        }
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 3
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        
        let labelsLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: labelChartPoints, viewGenerator: {(chartPointModel, layer, chart) -> UIView? in
            let label = HandlingLabel()
            //label.backgroundColor = UIColor.black
            let pos = chartPointModel.chartPoint.y.scalar > 0
            let testNSNumber: NSNumber = NSNumber(value: Float(vals[chartPointModel.index].val))
            label.text = "\(formatter.string(from:  testNSNumber)!)"
            label.font = ExamplesDefaults.labelFont
            label.sizeToFit()
            print(pos)
            label.center = CGPoint(x: chartPointModel.screenLoc.x, y: pos ? innerFrame.origin.y-5 : innerFrame.origin.y + innerFrame.size.height)
            print(label.center)
            label.alpha = 0
            
            label.movedToSuperViewHandler = {[weak label] in
                UIView.animate(withDuration: 0.6, animations: {
                    label?.alpha = 1
                    label?.center.y = chartPointModel.screenLoc.y - 6
                })
            }
            return label
            
        }, displayDelay: 0.5, mode: .translate) // show after bars animation
        
        
        
        return Chart(
            frame: chartFrame,
            innerFrame: innerFrame,
            settings: chartSettings,
            layers: [
                xAxisLayer,
                yAxisLayer,
                barsLayer,
                labelsLayer,
                guidelinesLayer,
                chartPointsLayer,
                ]
        )
    }
    
    fileprivate func showChart(_ horizontal: Bool) {
        
        self.chart?.clearView()
        
        let chart = barsChart(horizontal)
        view.addSubview(chart.view)
        self.chart = chart
    }
    
    override func viewDidLoad() {
 NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
NotificationCenter.default.addObserver(self, selector: #selector(BarChartTestViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appbecomeactive),
            //name: .UIApplicationDidBecomeActive,
            name: .UIApplicationWillEnterForeground,
            object: nil)
        
    }
        
        func rotated()
        {
           
            if UIDevice.current.orientation.isLandscape
            {
                
                self.chart?.clearView()
                
                let chart = barsChart(true)
                view.addSubview(chart.view)
                
                self.chart = chart
                label.frame = CGRect(x: 50, y: screenWidth-70, width: 180, height: 21)
                label.font = UIFont(name: label.font.familyName, size: 10)
                // label.center = CGPoint(x: 160, y: 285)
                label.textAlignment = .center
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let timeString = "Inventory Value as of \(dateFormatter.string(from: Date() as Date))"
                print(timeString)
                //label.text = Str
                if(appDelegate.loadSecondSet == true){
                    label.text = String(timeString)
                    //label.text = "Inventory Value as of 2017-04-03"
                }else{
                    label.text = "Inventory Value as of 2017-03-31"
                }
               
            }
            else if UIDevice.current.orientation.isPortrait
            {
                self.chart?.clearView()
                
                let chart = barsChart(true)
                view.addSubview(chart.view)
                self.chart = chart
                label.frame =  CGRect(x: 0, y: screenHeight-80, width: 180, height: 21)
                
                label.font = UIFont(name: label.font.familyName, size: 10)
                // label.center = CGPoint(x: 160, y: 285)
                label.textAlignment = .center
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let timeString = "Inventory Value as of \(dateFormatter.string(from: Date() as Date))"
                print(timeString)
                //label.text = Str
                if(appDelegate.loadSecondSet == true){
                    label.text = String(timeString)
                    //label.text = "Inventory Value as of 2017-04-03"
                }else{
                    label.text = "Inventory Value as of 2017-03-31"
                }
                print("Portrait")
            }
      //  }

}


class DirSelector: UIView {
        
        let horizontal: UIButton
        let vertical: UIButton
        
        weak var controller: BarChartTestViewController?
        
        fileprivate let buttonDirs: [UIButton : Bool]
        
        init(frame: CGRect, controller: BarChartTestViewController) {
            
            self.controller = controller
            
            horizontal = UIButton()
            horizontal.setTitle("Horizontal", for: UIControlState())
            vertical = UIButton()
            vertical.setTitle("Vertical", for: UIControlState())
            
            buttonDirs = [horizontal : true, vertical : false]
            
            super.init(frame: frame)
            
            addSubview(horizontal)
            addSubview(vertical)
            
            for button in [horizontal, vertical] {
                button.titleLabel?.font = ExamplesDefaults.fontWithSize(14)
                button.setTitleColor(UIColor.blue, for: UIControlState())
                button.addTarget(self, action: #selector(DirSelector.buttonTapped(_:)), for: .touchUpInside)
            }
        }
        
        func buttonTapped(_ sender: UIButton) {
            let horizontal = sender == self.horizontal ? true : false
            controller?.showChart(horizontal)
        }
        
        override func didMoveToSuperview() {
            let views = [horizontal, vertical]
            for v in views {
                v.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let namedViews = views.enumerated().map{index, view in
                ("v\(index)", view)
            }
            
            var viewsDict = Dictionary<String, UIView>()
            for namedView in namedViews {
                viewsDict[namedView.0] = namedView.1
            }
            
            let buttonsSpace: CGFloat = Env.iPad ? 20 : 10
            
            let hConstraintStr = namedViews.reduce("H:|") {str, tuple in
                "\(str)-(\(buttonsSpace))-[\(tuple.0)]"
            }
            
            let vConstraits = namedViews.flatMap {NSLayoutConstraint.constraints(withVisualFormat: "V:|[\($0.0)]", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)}
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: hConstraintStr, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
                + vConstraits)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

//
//  BarsExample.swift
//  SwiftCharts
//
//  Created by ischuetz on 04/05/15.
//  Copyright (c) 2015 ivanschuetz. All rights reserved.
//

import UIKit
import SwiftCharts

// This example uses a normal view generator to create bars. This allows a high degree of customization at view level, since any UIView can be used.
// Alternatively it's possible to use ChartBarsLayer (see e.g. implementation of BarsChart for a simple example), which provides more ready to use, bar-specific functionality, but is accordingly more constrained.


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


private struct MyQuantity {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}


class BarsExample: UIViewController {
    lazy fileprivate(set) var chartFrame: CGRect! = {
        CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height - 80)
    }()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    fileprivate var chart: Chart?
    fileprivate let gradientPicker: GradientPicker? // to pick the colors of the bars
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        gradientPicker = GradientPicker(width: 200)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let colorsarr :[UIColor] = [UIColor.init(red: 122/255.0, green: 0/255.0, blue: 63/255.0, alpha: 0.8),
                                UIColor.init(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 10/255.0, blue: 137/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 51/255.0, blue: 156/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 112/255.0, blue: 186/255.0, alpha: 0.8),
                                UIColor.init(red: 255/255.0, green: 173/255.0, blue: 216/255.0, alpha: 0.8)]
    //255,173,216
    //  255,92,176
    let sideSelectorHeight: CGFloat = 50
    fileprivate class GradientPicker {
        
        let gradientImg: UIImage
        
        lazy private(set) var imgData: UnsafePointer<UInt8>? = {
            let pixelData = self.gradientImg.cgImage?.dataProvider?.data
            return CFDataGetBytePtr(pixelData)
        }()
        
        init?(width: CGFloat) {
            
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.frame = CGRect(x: 0, y: 0, width: width, height: 1)
            gradient.colors = [UIColor.init(red: 226, green: 54, blue: 83, alpha: 1).cgColor, UIColor.init(red: 213, green: 11, blue: 116, alpha: 1).cgColor, UIColor.init(red: 224, green: 0, blue: 116, alpha: 1).cgColor, UIColor.init(red: 227, green: 0, blue: 168, alpha: 1).cgColor]
            //213,11,116
            
            //gradient.colors = [UIColor.magenta.cgColor,UIColor.magenta.cgColor,UIColor.magenta.cgColor,UIColor.magenta.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            
            let imgHeight = 1
            let imgWidth = Int(gradient.bounds.size.width)
            
            let bitmapBytesPerRow = imgWidth * 4
            
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue).rawValue
            
            guard let context = CGContext(data: nil,
                                          width: imgWidth,
                                          height: imgHeight,
                                          bitsPerComponent: 8,
                                          bytesPerRow: bitmapBytesPerRow,
                                          space: colorSpace,
                                          bitmapInfo: bitmapInfo) else {
                                            print("Couldn't create context")
                                            return nil
            }
            
            UIGraphicsBeginImageContext(gradient.bounds.size)
            gradient.render(in: context)
            
            guard let gradientImg = (context.makeImage().map{UIImage(cgImage: $0)}) else {
                print("Couldn't create image")
                UIGraphicsEndImageContext()
                return nil
            }
            
            UIGraphicsEndImageContext()
            self.gradientImg = gradientImg
        }
        
        
        
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
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
                ("HS", 1589544),
                ("CD", 726289),
                ("DU", 86640),
                ("CO", 62482)
                //("PP", 140)
                
            ]

             item0 = MyItem(name: "AC", quantity: quantityVeryHigh, value:1012864)
             item1 = MyItem(name: "HS", quantity: quantityHigh, value: 1589544)
             item2 = MyItem(name: "CD", quantity: quantityAverage, value: 726289)
             item3 = MyItem(name: "DU", quantity: quantityLow, value: 86640)
             item4 = MyItem(name: "CO", quantity: quantityLow, value: 62482)
        }else{
            vals = [
                ("AC", 518358),
                ("HS", 871311),
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
        }
        
        let chartPoints1: [ChartPoint] = [item0, item1, item2, item3, item4].enumerated().map {index, item in
            let xLabelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont, rotation: 45, rotationKeep: .top)
            let x = ChartAxisValueString(item!.name, order: index, labelSettings: xLabelSettings)
            let y = ChartAxisValueString(String(item!.quantity.number), order: item!.quantity.number, labelSettings: labelSettings)
            // let  y =  ChartAxisValueInt($0.1)
            return ChartPoint(x: x, y: y)
        }
        
        
        let generator : ChartAxisGeneratorMultiplier!
        //let labelsGenerator : ChartAxisLabel!
        var xValues : [ChartAxisValue]!
        var yValues : ChartAxisModel!
        if(appDelegate.loadSecondSet == true){
             generator = ChartAxisGeneratorMultiplier(200000)
            
            let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
                return ChartAxisLabel(text: "\(scalar)", settings: labelSettings)
            }
            
            
            xValues = [ChartAxisValueString("", order: -1)] + chartPoints1.map{$0.x} + [ChartAxisValueString("", order: 5)]
            
             yValues = ChartAxisModel(firstModelValue: 0, lastModelValue: 1700000, axisTitleLabels: [ChartAxisLabel(text: "Volume", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
        }else{
             generator = ChartAxisGeneratorMultiplier(40000)
             let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
                return ChartAxisLabel(text: "\(scalar)", settings: labelSettings)
            }
            
            
             xValues = [ChartAxisValueString("", order: -1)] + chartPoints1.map{$0.x} + [ChartAxisValueString("", order: 5)]
            
             yValues = ChartAxisModel(firstModelValue: 0, lastModelValue: 1000000, axisTitleLabels: [ChartAxisLabel(text: "Volume", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
        }
        

//        let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
//            return ChartAxisLabel(text: "\(scalar)", settings: labelSettings)
//        }
//        
//        
//        let xValues = [ChartAxisValueString("", order: -1)] + chartPoints1.map{$0.x} + [ChartAxisValueString("", order: 5)]
        
      //  let yValues = ChartAxisModel(firstModelValue: 0, lastModelValue: 1700000, axisTitleLabels: [ChartAxisLabel(text: "Volume", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
        
        
        
        let barViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsViewsLayer, chart: Chart) -> UIView? in
            let bottomLeft = layer.modelLocToScreenLoc(x: 0, y: 0)
            
            let minBarSpacing: CGFloat = ExamplesDefaults.minBarSpacing + 16
            
            let barWidth: CGFloat = (Env.iPad ? 50 : 23)
            
            //let barWidth = layer.minXScreenSpace - minBarSpacing
            
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
        
        
        let frame = ExamplesDefaults.chartFrame(view.bounds)
        let chartFrame = chart?.frame ?? CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - sideSelectorHeight)
        
        let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yValues)
        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        
        let chartPointsLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints1, viewGenerator: barViewGenerator)
        
        let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: ExamplesDefaults.guidelinesWidth)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
        
        /*
         Labels layer.
         Create chartpoints for the top and bottom of the bars, where we will show the labels.
         There are multiple ways to do this. Here we represent the labels with chartpoints at the top/bottom of the bars. We set some space using domain coordinates, in order for this to be updated properly during zoom / pan. Note that with this the spacing is also zoomed, meaning the labels will move away from the edges of the bars when we scale up, which maybe it's not wanted. More elaborate approaches involve passing a custom transform closure to the layer, or using GroupedBarsCompanionsLayer (currently only for stacked/grouped bars, though any bar chart can be represented with this).
         */
        let (minVal, maxVal): (CGFloat, CGFloat) = vals.reduce((min: CGFloat(0), max: CGFloat(0))) {tuple, val in
            (min: min(tuple.min, val.val), max: max(tuple.max, val.val))
        }
        print(minVal)
        print(maxVal)
        let length: CGFloat = maxVal - minVal
        let zero = ChartAxisValueDouble(0)
        let bars: [ChartBarModel] = vals.enumerated().flatMap {index, tuple in
            
            let percentage = (tuple.val - minVal - 0.01) / length // FIXME without -0.01 bar with 1 (100 perc) is black
            print(index)
            // let color = gradientPicker?.colorForPercentage(percentage).withAlphaComponent(1) ?? {print("No gradient picker, defaulting to black"); return UIColor.black}()
            let color = colorsarr[index]
            print(color)
            return  ChartBarModel(constant: ChartAxisValueDouble(Double(index)), axisValue1: zero, axisValue2: ChartAxisValueDouble(Double(tuple.val)), bgColor: color)
            
            
        }
        let barViewSettings = ChartBarViewSettings(animDuration: 0.5, selectionViewUpdater: ChartViewSelectorBrightness(selectedFactor: 0.5))
        let barsLayer = ChartBarsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, bars: bars, horizontal: false, barWidth: Env.iPad ? 40 : 35, settings: barViewSettings)
        let labelToBarSpace: Double = 50.0 // domain units
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
            
            label.text = "\(formatter.string(from: NSNumber(value: chartPointModel.chartPoint.y.scalar))!)"
            label.font = ExamplesDefaults.labelFont
            label.sizeToFit()
            print(pos)
            label.center = CGPoint(x: chartPointModel.screenLoc.x, y: pos ? innerFrame.origin.y-5 : innerFrame.origin.y + innerFrame.size.height)
            print(label.center)
            label.alpha = 0
            
            label.movedToSuperViewHandler = {[weak label] in
                UIView.animate(withDuration: 0.6, animations: {
                    label?.alpha = 1
                    label?.center.y = chartPointModel.screenLoc.y-6
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
        showChart(false)
        //        if let chart = chart {
        //            let sideSelector = DirSelector(frame: CGRect(x: 0, y: chart.frame.origin.y + chart.frame.size.height, width: view.frame.size.width, height: sideSelectorHeight), controller: self)
        //            view.addSubview(sideSelector)
        //        }
        if let chart = chart {
            let sideSelector = DirSelector(frame: CGRect(x: 0, y: chart.frame.origin.y + chart.frame.size.height, width: view.frame.size.width, height: sideSelectorHeight), controller: self)
            view.addSubview(sideSelector)
        }
        let label = UILabel(frame: CGRect(x: 60, y: 70, width: 300, height: 21))
        label.font = UIFont(name: label.font.familyName, size: 14)
        // label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Inventory Value as of 2012-01-09"
        self.view.addSubview(label)
        self.view.bringSubview(toFront: label)
    }
    
    
    class DirSelector: UIView {
        
        let horizontal: UIButton
        let vertical: UIButton
        
        weak var controller: BarsExample?
        
        fileprivate let buttonDirs: [UIButton : Bool]
        
        init(frame: CGRect, controller: BarsExample) {
            
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
}





//
//  CubicLineViewController.swift
//  SwiftCharts
//
//  Created by Administrator on 03/04/17.
//  Copyright © 2017 ivanschuetz. All rights reserved.
//

import UIKit
import SwiftCharts

class CubicLineViewController: UIViewController {
    
    fileprivate var chart: Chart? // arc

    let sideSelectorHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loadappdata),
            name: .UIApplicationDidBecomeActive,
            object: nil)

//        let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
//        
//        let chartPoints = [(0, 0), (4, 4), (8, 11), (9, 2), (11, 10), (12, 3), (15, 18), (18, 10), (20, 15)].map{ChartPoint(x: ChartAxisValueInt($0.0, labelSettings: labelSettings), y: ChartAxisValueInt($0.1))}
//        
//        let xValues = chartPoints.map{$0.x}
//        let yValues = ChartAxisValuesStaticGenerator.generateYAxisValuesWithChartPoints(chartPoints, minSegmentCount: 10, maxSegmentCount: 20, multiple: 2, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: false)
//        
//        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings))
//        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings.defaultVertical()))
//        //let chartFrame = ExamplesDefaults.chartFrame(view.bounds)
//        
//        let frame = ExamplesDefaults.chartFrame(view.bounds)
//        let chartFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - sideSelectorHeight)
//        
//        let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
//        
//        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
//        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
//        
//        
//        //LINE CODE
//        let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor(red: 255/255.0, green: 173/255.0, blue: 216/255.0, alpha: 0.8), lineWidth: 2, animDuration: 1, animDelay: 0)
//        // let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor.purple, lineWidth: 2, animDuration: 1, animDelay: 0)
//        //UIColor(red: 0.4, green: 0.4, blue: 1, alpha: 0.2)
//        let chartPointsLineLayer = ChartPointsLineLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, lineModels: [lineModel], pathGenerator: CatmullPathGenerator()) // || CubicLinePathGenerator
//        
//        
//        //CIRCLE CODE
//        let circleViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
//            let circleView = ChartPointEllipseView(center: chartPointModel.screenLoc, diameter: 14)
//            circleView.animDuration = 1.5
//            circleView.fillColor = UIColor.white
//            circleView.borderWidth = 5
//            //circleView.borderColor = UIColor.blue
//            circleView.borderColor = UIColor(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8)
//            //UIColor.init(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8)
//            return circleView
//        }
//        let chartPointsCircleLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: circleViewGenerator, displayDelay: 0, delayBetweenItems: 0.05, mode: .translate)
//        
//        
//        //TOUCH CODE
//        let showCoordsTextViewsGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
//            let (chartPoint, screenLoc) = (chartPointModel.chartPoint, chartPointModel.screenLoc)
//            let w: CGFloat = 70
//            let h: CGFloat = 30
//            
//            let text = "(\(chartPoint.x), \(chartPoint.y))"
//            let font = ExamplesDefaults.labelFont
//            let x = min(screenLoc.x + 5, chart.bounds.width - text.width(font) - 5)
//            let view = UIView(frame: CGRect(x: x, y: screenLoc.y - h, width: w, height: h))
//            let label = UILabel(frame: view.bounds)
//            label.text = "(\(chartPoint.x), \(chartPoint.y))"
//            label.font = ExamplesDefaults.labelFont
//            view.addSubview(label)
//            view.alpha = 0
//            
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//                view.alpha = 1
//            }, completion: nil)
//            
//            return view
//        }
//        
//        
//        let showCoordsLinesLayer = ChartShowCoordsLinesLayer<ChartPoint>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints)
//        let showCoordsTextLayer = ChartPointsSingleViewLayer<ChartPoint, UIView>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, innerFrame: innerFrame, chartPoints: chartPoints, viewGenerator: showCoordsTextViewsGenerator, mode: .translate, keepOnFront: true)
//        
//        let touchViewsGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
//            let (chartPoint, screenLoc) = (chartPointModel.chartPoint, chartPointModel.screenLoc)
//            let s: CGFloat = 30
//            let view = HandlingView(frame: CGRect(x: screenLoc.x - s/2, y: screenLoc.y - s/2, width: s, height: s))
//            view.touchHandler = {[weak showCoordsLinesLayer, weak showCoordsTextLayer, weak chartPoint, weak chart] in
//                guard let chartPoint = chartPoint, let chart = chart else {return}
//                showCoordsLinesLayer?.showChartPointLines(chartPoint, chart: chart)
//                showCoordsTextLayer?.showView(chartPoint: chartPoint, chart: chart)
//            }
//            return view
//        }
//        
//        let touchLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: touchViewsGenerator, mode: .translate, keepOnFront: true)
//        
//        
//        let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: ExamplesDefaults.guidelinesWidth)
//        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
//        
//        let chart = Chart(
//            frame: chartFrame,
//            innerFrame: innerFrame,
//            settings: chartSettings,
//            layers: [
//                xAxisLayer,
//                yAxisLayer,
//                guidelinesLayer,
//                chartPointsLineLayer,
//                chartPointsCircleLayer,
//                showCoordsLinesLayer,
//                showCoordsTextLayer,
//                touchLayer
//            ]
//        )
//        
//        view.addSubview(chart.view)
//        self.chart = chart
    }
    
    func loadappdata(){
        self.chart?.clearView()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if(appDelegate.loadSecondSet == true){
            self.loadSetOne()
        }else{
            self.loadSetTwo()
        }
    }
    
    func loadSetOne(){
        let sideSelectorHeight: CGFloat = 50
        
        //let chartPoints :
        let chartPoints = [(0,238),(1,569),(2,187), (3,048), (4,894), (5,760),  (6,976), (7,112), (8,428), (9,116), (10,411),(11,096),(12,837),(13,946),(14,893),(15,746),(16,792),(17,831),(18,627),(19,608),(20,356),(21,811),(22,026)].map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
                let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        
               // let xValues = chartPoints.map{$0.x}
                let xValues = ChartAxisValuesStaticGenerator.generateXAxisValuesWithChartPoints(chartPoints, minSegmentCount: 12, maxSegmentCount: 12, multiple: 2, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: false)
        
        
//                let yValues = ChartAxisValuesStaticGenerator.generateYAxisValuesWithChartPoints(chartPoints, minSegmentCount: 10, maxSegmentCount: 20, multiple: 2, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: false)
                let yValues = ChartAxisValuesStaticGenerator.generateYAxisValuesWithChartPoints(chartPoints, minSegmentCount: 5, maxSegmentCount: 10, multiple: 10, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: true)
        
        
                let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings))
                let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings.defaultVertical()))
                //let chartFrame = ExamplesDefaults.chartFrame(view.bounds)
        
                let frame = ExamplesDefaults.chartFrame(view.bounds)
                let chartFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - sideSelectorHeight)
        
                let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
                let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
                let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        
        
                //LINE CODE
                let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor(red: 255/255.0, green: 173/255.0, blue: 216/255.0, alpha: 0.8), lineWidth: 2, animDuration: 1, animDelay: 0)
                // let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor.purple, lineWidth: 2, animDuration: 1, animDelay: 0)
                //UIColor(red: 0.4, green: 0.4, blue: 1, alpha: 0.2)
                let chartPointsLineLayer = ChartPointsLineLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, lineModels: [lineModel], pathGenerator: CatmullPathGenerator()) // || CubicLinePathGenerator
        
        
                //CIRCLE CODE
                let circleViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
                    let circleView = ChartPointEllipseView(center: chartPointModel.screenLoc, diameter: 14)
                    circleView.animDuration = 1.5
                    circleView.fillColor = UIColor.white
                    circleView.borderWidth = 5
                    //circleView.borderColor = UIColor.blue
                    circleView.borderColor = UIColor(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8)
                    //UIColor.init(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8)
                    return circleView
                }
                let chartPointsCircleLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: circleViewGenerator, displayDelay: 0, delayBetweenItems: 0.05, mode: .translate)
        
        
                //TOUCH CODE
                let showCoordsTextViewsGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
                    let (chartPoint, screenLoc) = (chartPointModel.chartPoint, chartPointModel.screenLoc)
                    let w: CGFloat = 70
                    let h: CGFloat = 30
        
                    let text = "(\(chartPoint.x), \(chartPoint.y))"
                    let font = ExamplesDefaults.labelFont
                    let x = min(screenLoc.x + 5, chart.bounds.width - text.width(font) - 5)
                    let view = UIView(frame: CGRect(x: x, y: screenLoc.y - h, width: w, height: h))
                    let label = UILabel(frame: view.bounds)
                    label.text = "(\(chartPoint.x), \(chartPoint.y))"
                    label.font = ExamplesDefaults.labelFont
                    view.addSubview(label)
                    view.alpha = 0
        
                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                        view.alpha = 1
                    }, completion: nil)
        
                    return view
                }
        
        
                let showCoordsLinesLayer = ChartShowCoordsLinesLayer<ChartPoint>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints)
                let showCoordsTextLayer = ChartPointsSingleViewLayer<ChartPoint, UIView>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, innerFrame: innerFrame, chartPoints: chartPoints, viewGenerator: showCoordsTextViewsGenerator, mode: .translate, keepOnFront: true)
        
                let touchViewsGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
                    let (chartPoint, screenLoc) = (chartPointModel.chartPoint, chartPointModel.screenLoc)
                    let s: CGFloat = 30
                    let view = HandlingView(frame: CGRect(x: screenLoc.x - s/2, y: screenLoc.y - s/2, width: s, height: s))
                    view.touchHandler = {[weak showCoordsLinesLayer, weak showCoordsTextLayer, weak chartPoint, weak chart] in
                        guard let chartPoint = chartPoint, let chart = chart else {return}
                        showCoordsLinesLayer?.showChartPointLines(chartPoint, chart: chart)
                        showCoordsTextLayer?.showView(chartPoint: chartPoint, chart: chart)
                    }
                    return view
                }
        
                let touchLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: touchViewsGenerator, mode: .translate, keepOnFront: true)
        
        
                let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: ExamplesDefaults.guidelinesWidth)
                let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
                
                let chart = Chart(
                    frame: chartFrame,
                    innerFrame: innerFrame,
                    settings: chartSettings,
                    layers: [
                        xAxisLayer,
                        yAxisLayer,
                        guidelinesLayer,
                        chartPointsLineLayer,
                        chartPointsCircleLayer,
                        showCoordsLinesLayer,
                        showCoordsTextLayer,
                        touchLayer
                    ]
                )
                
                view.addSubview(chart.view)
                self.chart = chart
    }
    
    
    
    func loadSetTwo(){
        let sideSelectorHeight: CGFloat = 50
        
        //let chartPoints :
        let chartPoints = [(0,841),(1,256), (2,059), (3,008), (4,866),  (5,297), (6,751), (7,833), (8,879),(9,555), (10,023),(11,582),(12,330),(13,826),(14,136),(15,066),(16,063),(17,866),(18,165),(19,391),(20,588),(21,036),(22,978),(23,872)].map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
                let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        
                //let xValues = chartPoints.map{$0.x}
                let xValues = ChartAxisValuesStaticGenerator.generateXAxisValuesWithChartPoints(chartPoints, minSegmentCount: 12, maxSegmentCount: 12, multiple: 2, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: false)
        
        
//                let yValues = ChartAxisValuesStaticGenerator.generateYAxisValuesWithChartPoints(chartPoints, minSegmentCount: 10, maxSegmentCount: 20, multiple: 2, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: false)
                let yValues = ChartAxisValuesStaticGenerator.generateYAxisValuesWithChartPoints(chartPoints, minSegmentCount: 5, maxSegmentCount: 10, multiple: 10, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: true)
        
                let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings))
                let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings.defaultVertical()))
                //let chartFrame = ExamplesDefaults.chartFrame(view.bounds)
        
                let frame = ExamplesDefaults.chartFrame(view.bounds)
                let chartFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - sideSelectorHeight)
        
                let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
                let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
                let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        
        
                //LINE CODE
                let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor(red: 255/255.0, green: 173/255.0, blue: 216/255.0, alpha: 0.8), lineWidth: 2, animDuration: 1, animDelay: 0)
                // let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor.purple, lineWidth: 2, animDuration: 1, animDelay: 0)
                //UIColor(red: 0.4, green: 0.4, blue: 1, alpha: 0.2)
                let chartPointsLineLayer = ChartPointsLineLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, lineModels: [lineModel], pathGenerator: CatmullPathGenerator()) // || CubicLinePathGenerator
        
        
                //CIRCLE CODE
                let circleViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
                    let circleView = ChartPointEllipseView(center: chartPointModel.screenLoc, diameter: 14)
                    circleView.animDuration = 1.5
                    circleView.fillColor = UIColor.white
                    circleView.borderWidth = 5
                    //circleView.borderColor = UIColor.blue
                    circleView.borderColor = UIColor(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8)
                    //UIColor.init(red: 204/255.0, green: 0/255.0, blue: 105/255.0, alpha: 0.8)
                    return circleView
                }
                let chartPointsCircleLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: circleViewGenerator, displayDelay: 0, delayBetweenItems: 0.05, mode: .translate)
        
        
                //TOUCH CODE
                let showCoordsTextViewsGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
                    let (chartPoint, screenLoc) = (chartPointModel.chartPoint, chartPointModel.screenLoc)
                    let w: CGFloat = 70
                    let h: CGFloat = 30
        
                    let text = "(\(chartPoint.x), \(chartPoint.y))"
                    let font = ExamplesDefaults.labelFont
                    let x = min(screenLoc.x + 5, chart.bounds.width - text.width(font) - 5)
                    let view = UIView(frame: CGRect(x: x, y: screenLoc.y - h, width: w, height: h))
                    let label = UILabel(frame: view.bounds)
                    label.text = "(\(chartPoint.x), \(chartPoint.y))"
                    label.font = ExamplesDefaults.labelFont
                    view.addSubview(label)
                    view.alpha = 0
        
                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                        view.alpha = 1
                    }, completion: nil)
        
                    return view
                }
        
        
                let showCoordsLinesLayer = ChartShowCoordsLinesLayer<ChartPoint>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints)
                let showCoordsTextLayer = ChartPointsSingleViewLayer<ChartPoint, UIView>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, innerFrame: innerFrame, chartPoints: chartPoints, viewGenerator: showCoordsTextViewsGenerator, mode: .translate, keepOnFront: true)
        
                let touchViewsGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
                    let (chartPoint, screenLoc) = (chartPointModel.chartPoint, chartPointModel.screenLoc)
                    let s: CGFloat = 30
                    let view = HandlingView(frame: CGRect(x: screenLoc.x - s/2, y: screenLoc.y - s/2, width: s, height: s))
                    view.touchHandler = {[weak showCoordsLinesLayer, weak showCoordsTextLayer, weak chartPoint, weak chart] in
                        guard let chartPoint = chartPoint, let chart = chart else {return}
                        showCoordsLinesLayer?.showChartPointLines(chartPoint, chart: chart)
                        showCoordsTextLayer?.showView(chartPoint: chartPoint, chart: chart)
                    }
                    return view
                }
        
                let touchLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: touchViewsGenerator, mode: .translate, keepOnFront: true)
        
        
                let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: ExamplesDefaults.guidelinesWidth)
                let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
                
                let chart = Chart(
                    frame: chartFrame,
                    innerFrame: innerFrame,
                    settings: chartSettings,
                    layers: [
                        xAxisLayer,
                        yAxisLayer,
                        guidelinesLayer,
                        chartPointsLineLayer,
                        chartPointsCircleLayer,
                        showCoordsLinesLayer,
                        showCoordsTextLayer,
                        touchLayer
                    ]
                )
                
                view.addSubview(chart.view)
                self.chart = chart
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Quick View"
        self.tabBarItem.title = "OVERALL TREND"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 226.0/255.0, green: 0.0/255.0, blue: 116.0/255.0, alpha: 1.0)]
        //self.loadSetOne()
        self.loadappdata()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//
//  DragViewTest.swift
//  Review
//
//  Created by 남오승 on 2020/09/16.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class DragViewTest: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var fakeGauge: UIView!
    @IBOutlet weak var gaugeWrap: UIView!
    @IBOutlet weak var gaugeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        birthTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(wasDragged))
        gaugeView.addGestureRecognizer(gesture)
        gaugeView.isUserInteractionEnabled = true
        gesture.delegate = self

        
    }
    
    @objc func wasDragged(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.began || gestureRecognizer.state == UIGestureRecognizer.State.changed {
            let translation = gestureRecognizer.translation(in: self.view)
//            print("dddd:\(gaugeWrap.frame.origin.y)")
//            print(gestureRecognizer.view!.center.y)
            let minY = gestureRecognizer.view!.frame.minY
//            print(gestureRecognizer.view!.frame.minY)
            print(minY)
            if minY < 0.0 {
                
                gestureRecognizer.view!.center = CGPoint.init(x: gestureRecognizer.view!.center.x, y: 200)
               print("2")
                gaugeWrap.backgroundColor = .systemPink
                fakeGauge.constraints[0].constant = 400.0
            }else {
                
                 if(gestureRecognizer.view!.frame.minY < 350) {
                                gestureRecognizer.view!.center =  CGPoint.init(x: gestureRecognizer.view!.center.x, y: gestureRecognizer.view!.center.y + translation.y)
                //                print(translation.y)
                                print("1")
                            }else {
                                
                                gestureRecognizer.view!.center = CGPoint.init(x: gestureRecognizer.view!.center.x, y: 549)
                                print("2")
                            }

                            gestureRecognizer.setTranslation(.zero, in: self.view)
                gaugeWrap.backgroundColor = .white
                fakeGauge.constraints[0].constant = 50.0
            }
            
           
        }

    }
    
//    
//    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
//        // 1
//        let translation = gesture.translation(in: view)
//
//        // 2
//        guard let gestureView = gesture.view else {
//          return
//        }
//        
//        let velocity = gesture.velocity(in: gestureView)
//
//         if abs(velocity.x) > abs(velocity.y) {
//
////            velocity.x < 0 ? print("left")  :  print("right")
//            print("x:\(velocity.x)")
//            print("y:\(velocity.y)")
//            if velocity.x != 0.0 {
//                print("???")
//                return
//            }else {
//                gestureView.center = CGPoint(
//                          x: gestureView.center.x + translation.x,
//                          y: gestureView.center.y + translation.y
//                        )
//                //        print(gestureView)
//
//                        // 3
//                        gesture.setTranslation(.zero, in: gestureView)
//            }
//            if velocity.x < 0 {
//                print("왼")
//            }else {
//                print("오")
//            }
//            
//            
//            return
//        }
//
//
//
//        
//
////        print(velocity)
//        
//    }
}

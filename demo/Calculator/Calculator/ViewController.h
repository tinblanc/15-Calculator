//
//  ViewController.h
//  Calculator
//
//  Created by Tin Blanc on 3/21/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic) BOOL typingNumber;
@property (nonatomic) float firstNumber;
@property (nonatomic) float secondNumber;
@property (nonatomic,copy) NSString *operation; 

@end


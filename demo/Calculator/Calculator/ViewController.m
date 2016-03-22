//
//  ViewController.m
//  Calculator
//
//  Created by Tin Blanc on 3/21/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UIButton *number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)buttonNumber:(id)sender {
    
    NSString *number = [sender currentTitle];
    
    // Check user nhập số chưa
    if (self.typingNumber)
    {
        // Check ký tự nhập vào là dấu chấm
        if([[[sender titleLabel] text] isEqualToString:@"."]){
            // Check ký tự đầu tiên
            if([self.result.text length] == 1){
                self.result.text = [self.result.text stringByAppendingString:number];
                
            }else{
                if([self.result.text containsString:@"."]){
                    NSLog(@"string contains dots!");
                    return;
                }else{
                    self.result.text = [self.result.text stringByAppendingString:number];
                }
            }
            
        }else{
            // Remove số 0 ở đầu
            if ([self.result.text hasPrefix:@"0"] && [self.result.text length] == 1) {
                self.result.text = [self.result.text substringFromIndex:1];
            }
            self.result.text = [self.result.text stringByAppendingString:number];
        }
        
        //self.result.text = [self.result.text stringByAppendingString:number];
    } else
    {
        self.result.text = number;
        self.typingNumber = YES;
    }
    
}

- (IBAction)buttonReset:(id)sender {
    self.result.text = @"0";
}

- (IBAction)calculationPressed:(id)sender {
    self.typingNumber = NO;
    self.firstNumber = [self.result.text floatValue];
    self.operation = [sender currentTitle];
}

- (IBAction)equalsPressed:(id)sender {
    self.typingNumber = NO;
    self.secondNumber = [self.result.text floatValue];
    
    float result = 0;
    
    if ([self.operation isEqualToString:@"+"])
    {
        result = self.firstNumber + self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"-"])
    {
        result = self.firstNumber - self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"*"])
    {
        result = self.firstNumber * self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"/"])
    {
        result = self.firstNumber / self.secondNumber;
    }
    
    
    self.result.text = [NSString stringWithFormat:@"%2.1f", result];
}




@end

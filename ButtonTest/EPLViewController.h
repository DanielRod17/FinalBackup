//
//  EPLViewController.h
//  ButtonTest
//
//  Created by EP Logistics, LLC. on 10/5/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LineaSDK.h"
#import <QuartzCore/QuartzCore.h>


Linea* linea;
@interface EPLViewController : UIViewController
@property (nonatomic, assign) NSString *OrderID;
@property (retain, nonatomic) IBOutlet UILabel *StatusLabel;
@property (retain, nonatomic) IBOutlet UITextField *PalletInput;
@property (retain, nonatomic) IBOutlet UITextField *LocationInput;
@property (retain, nonatomic) IBOutlet UILabel *PalletIDLabel;
@property (retain, nonatomic) IBOutlet UILabel *LocationLabel;
- (IBAction)ClearButton:(id)sender;
- (IBAction)SetButton:(id)sender;
- (IBAction)ResetButton:(id)sender;
+(CAGradientLayer*) greyGradient;
+(CAGradientLayer*) ButtonGradient;
@end

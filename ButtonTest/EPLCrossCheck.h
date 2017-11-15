//
//  EPLCrossCheck.h
//  ButtonTest
//
//  Created by itsupport on 10/26/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineaSDK.h"
#import "EPLAppDelegate.h"
#import "EPLOrderCheck.h"
Linea* linea;
@interface EPLCrossCheck:UIViewController <UIGestureRecognizerDelegate, UIAlertViewDelegate>
+(CAGradientLayer*) greyGradient;
@property (retain, nonatomic) IBOutlet UIScrollView *Scrollito;
@property (retain, nonatomic) IBOutlet UIButton *Send;
@property (retain, nonatomic) IBOutlet UILabel *Customer;
@property (retain, nonatomic) IBOutlet UITextField *PalletID;
@property (retain, nonatomic) IBOutlet UITextField *PartNo;
@property (retain, nonatomic) IBOutlet UITextField *Qty;
@property (retain, nonatomic) IBOutlet UIButton *Return;
- (IBAction)Return:(id)sender;
- (IBAction)ClearCross:(id)sender;
- (IBAction)Enviar:(id)sender;
- (IBAction)Crosscheck:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *SendBut;
@property (retain, nonatomic) IBOutlet UIButton *CrossBut;
@property (retain, nonatomic) IBOutlet UIButton *ClearBut;
@property (retain, nonatomic) IBOutlet UIButton *ReturnBut;
@end

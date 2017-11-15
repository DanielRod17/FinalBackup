//
//  EPLReceipt.h
//  ButtonTest
//
//  Created by itsupport on 10/20/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LineaSDK.h"
#import "EPLAppDelegate.h"
#import "EPLOrderCheck.h"
Linea* linea;
int flagg=0;
@interface EPLReceipt : UIViewController <UIGestureRecognizerDelegate, UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UIScrollView *Scrollito;
- (IBAction)Enviar:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *Finish;
- (IBAction)Finish:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *ClearReceipt;
- (IBAction)ClearReceipt:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *Return;
- (IBAction)Return:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *Customer;
@property (retain, nonatomic) IBOutlet UIButton *SendBut;
@property (retain, nonatomic) IBOutlet UIButton *FinishBut;
@property (retain, nonatomic) IBOutlet UIButton *ReturnBut;
@property (retain, nonatomic) IBOutlet UIButton *ClearBut;
@property (retain, nonatomic) IBOutlet UITextField *PalletID;
@property (retain, nonatomic) IBOutlet UITextField *PartNo;
@property (retain, nonatomic) IBOutlet UITextField *Qty;

@end

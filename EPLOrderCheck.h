//
//  EPLOrderCheck.h
//  ButtonTest
//
//  Created by itsupport on 10/19/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "EPLOrderCheck.h"
#import "EPLReceipt.h"
#import "LineaSDK.h"

Linea* linea;
@interface EPLOrderCheck : UIViewController <UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *Tokenito;
- (IBAction)thAttempt:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *SetButton;
@property (retain, nonatomic) IBOutlet UIButton *leButton;
@property (retain, nonatomic) IBOutlet UILabel *Naem;
@end

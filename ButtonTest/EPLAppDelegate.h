//
//  EPLAppDelegate.h
//  ButtonTest
//
//  Created by EP Logistics, LLC. on 10/5/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPLOrderCheck;
@class FirstView;

@interface EPLAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) EPLOrderCheck *viewController;
@property (nonatomic, retain) NSString *OrderID;
@property (nonatomic, retain) NSString *tokenReceipt;
@property (nonatomic, retain) NSString *Usuarillo;
+(EPLAppDelegate *)sharedAppDelegate;
@end




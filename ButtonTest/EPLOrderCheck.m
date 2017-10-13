//
//  EPLOrderCheck.m
//  ButtonTest
//
//  Created by itsupport on 10/12/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import "EPLOrderCheck.h"
#import "EPLViewController.h"

@interface EPLOrderCheck ()

@end

@implementation EPLOrderCheck

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)thAttempt:(id)sender {
    EPLViewController *second = [[EPLViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:second animated:YES completion:NULL];
}
@end


//  EPLOrderCheck.m

//  ButtonTest

//

//  Created by itsupport on 10/12/17.

//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.

//
#import "EPLOrderCheck.h"
#import "EPLViewController.h"
#import "EPLReceipt.h"
#import "EPLCrossCheck.h"
#import "EPLAppDelegate.h"


@interface EPLOrderCheck ()
@end
@implementation EPLOrderCheck


NSString *Barcodote;
- (void)viewDidLoad {
    linea =[Linea sharedDevice];
    [linea addDelegate:self];
    [linea connect];
    [self.view addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
    [_Tokenito setKeyboardType:UIKeyboardTypeNumberPad];
    CAGradientLayer *gradientLayer = [EPLViewController greyGradient];
    gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    _Tokenito.delegate=self;
    [super viewDidLoad];
    ///////////
    NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?EthernetCheck=1"];
    NSURL *targetURL = [NSURL URLWithString:URLmao];
    NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray* foo = [dataString componentsSeparatedByString: @"|"];
    NSString* equalito = [foo objectAtIndex: 0];
    if([equalito isEqualToString:@"Success"]){
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"Check Your Settings"  delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
    }

}

-(void)barcodeData:(NSString *)barcode type:(int)type {
        Barcodote = barcode;
        _Tokenito.text=Barcodote;
    /////
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (IBAction)thAttempt:(id)sender {
    NSString *token = _Tokenito.text;
    if(_Tokenito.text.length == 0) {
        token = [NSString stringWithFormat:@"ciertoFail"];
    }
    NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?Token="];
    URLmao = [URLmao stringByAppendingString:token];
    NSURL *targetURL = [NSURL URLWithString:URLmao];
    NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray* foo = [dataString componentsSeparatedByString: @"|"];
    NSString* exists = [foo objectAtIndex: 0];
    if([exists isEqualToString:@"Exists"]){
        NSString* order = [foo objectAtIndex: 1];
        NSString* usuarillo =[foo objectAtIndex:2];
        NSString *firstLetter = [token substringToIndex:1];
        if([firstLetter isEqualToString:@"1"]){
            EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication] delegate];
            appDelegate.OrderID = order;
            EPLViewController *second = [[EPLViewController alloc] initWithNibName:nil bundle:nil];
            [self presentViewController:second animated:YES completion:NULL];
        }
        else if([firstLetter isEqualToString:@"2"]){
            EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication] delegate];
            appDelegate.OrderID = order;
            appDelegate.Usuarillo = usuarillo;
            appDelegate.tokenReceipt=_Tokenito.text;
            EPLReceipt *second = [[EPLReceipt alloc] initWithNibName:nil bundle:nil];
            [self presentViewController:second animated:YES completion:NULL];
        }
        else if([firstLetter isEqualToString:@"3"]){
            EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication] delegate];
            appDelegate.OrderID = order;
            EPLCrossCheck *second = [[EPLCrossCheck alloc] initWithNibName:nil bundle:nil];
            [self presentViewController:second animated:YES completion:NULL];
        }
    }
    else if([exists isEqualToString:@"NoExists"]){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Token" message:@"Check and Enter Again" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"Check Your Settings"  delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == _Tokenito)
    {
        CGRect SendFrame = _Tokenito.frame;
        SendFrame.origin.y = SendFrame.origin.y-120;
        _Tokenito.frame = SendFrame;
        
        CGRect LabelFrame = _Naem.frame;
        LabelFrame.origin.y = LabelFrame.origin.y-80;
        _Naem.frame = LabelFrame;
        
        CGRect buttonFrame = _leButton.frame;
        buttonFrame.origin.y = buttonFrame.origin.y-150;
        _leButton.frame = buttonFrame;

    }
}

- (void)dealloc {
    
    [_Tokenito release];
    [_leButton release];
    [_Naem release];
    [super dealloc];
    
}

@end


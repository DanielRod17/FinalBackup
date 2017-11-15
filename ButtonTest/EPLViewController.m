//
//  EPLViewController.m
//  ButtonTest
//
//  Created by EP Logistics, LLC. on 10/5/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import "EPLViewController.h"
#import "EPLAppDelegate.h"
#import "EPLOrderCheck.h"

@interface EPLViewController ()

@end

@implementation EPLViewController

BOOL flag = 0;
NSString *Barcodote;
NSString *Order;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    flag=0;
    EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication]delegate];
    Order = appDelegate.OrderID;
    //Order = appDelegate.OrderID;
	// Do any additional setup after loading the view, typically from a nib.
    linea =[Linea sharedDevice];
    [linea addDelegate:self];
    [linea connect];
    [self.view addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
    /////
    CAGradientLayer *gradientLayer = [EPLViewController greyGradient];
    gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    _PalletInput.autocorrectionType = UITextAutocorrectionTypeNo;
    _LocationInput.autocorrectionType = UITextAutocorrectionTypeNo;
    /////
}

+ (CAGradientLayer*) greyGradient {
    UIColor *colorOne = [UIColor colorWithRed:(65/255.0) green:(17/255.0) blue:(17/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    return headerLayer;
    
}

+ (CAGradientLayer*) ButtonGradient {
    UIColor *colorOne = [UIColor colorWithRed:(65/255.0) green:(17/255.0) blue:(17/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    return headerLayer;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_PalletIDLabel release];
    [_PalletInput release];
    [_LocationLabel release];
    [_LocationInput release];
    [_StatusLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setPalletIDLabel:nil];
    [self setLocationLabel:nil];
    [self setPalletInput:nil];
    [self setLocationInput:nil];
    [super viewDidUnload];
}
//////////////////////////////////////////////////////
-(void)barcodeData:(NSString *)barcode type:(int)type {
    if(_PalletInput.text.length==0){
        flag=0;
    }
    Barcodote = barcode;
    if(flag == 0){
        _PalletInput.text=Barcodote;
        flag = 1;
    }else{
        _LocationInput.text=Barcodote;
    }
    /////
}         
- (IBAction)ClearButton:(id)sender {
    flag = 0;
    _PalletInput.text=[NSString stringWithFormat:@""];
    _LocationInput.text=[NSString stringWithFormat:@""];
}

- (IBAction)SetButton:(id)sender {
    //
    NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?EthernetCheck=1"];
    NSURL *targetURL = [NSURL URLWithString:URLmao];
    NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray* foo = [dataString componentsSeparatedByString: @"|"];
    NSString* equalito = [foo objectAtIndex: 0];
    if([equalito isEqualToString:@"Success"]){
        //
        NSString *screenPallet = _PalletInput.text;
        NSString *screenLocation = _LocationInput.text;
        screenLocation= [screenLocation stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        screenPallet= [screenPallet stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if(_PalletInput.text.length > 0 && _LocationInput.text.length > 0){
            //////
            NSURL *targetURL = [NSURL URLWithString:@"https://eplserver.net/erp/tools/BoxPalletID/fasfsa.php"];
            NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
            NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
            NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            //_StatusLabel.text=dataString;
            if([dataString isEqualToString:@"Active"]){
                NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?Pallet="];
                URLmao = [URLmao stringByAppendingString:screenPallet];
                URLmao = [URLmao stringByAppendingString:@"&Location="];
                URLmao = [URLmao stringByAppendingString:screenLocation];
                URLmao = [URLmao stringByAppendingString:@"&Order="];
                URLmao = [URLmao stringByAppendingString:Order];
                NSURL *targetURL = [NSURL URLWithString:URLmao];
                NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
                NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
                NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSArray* foo = [dataString componentsSeparatedByString: @"|"];
                NSString* equalito = [foo objectAtIndex: 0];
                NSString* left = [foo objectAtIndex: 1];
                if([equalito isEqualToString:@"Success"]){
                    NSString *mensajote=left;
                    mensajote = [mensajote stringByAppendingString:@" Pallets Left"];
                    ////////////////////////////////////
                    flag = 0;
                    _PalletInput.text=[NSString stringWithFormat:@""];
                    _LocationInput.text=[NSString stringWithFormat:@""];
                    NSString* title=@"Location Assigned";
                    if([left isEqualToString:@"0"]){
                        title=@"Order Completed";
                        mensajote=@"All Pallets Located";
                    }
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:mensajote  delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                    alert.alertViewStyle = UIAlertViewStyleDefault;
                    [alert show];
                    [alert release];
                }
                else if([equalito isEqualToString:@"Wrong"]){
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Wrong Pallet ID" message:@"Pallet doesn't belong to order" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                    alert.alertViewStyle = UIAlertViewStyleDefault;
                    [alert show];
                    [alert release];
                }
                else{
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Pallet ID" message:@"Please Check your Inputs" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                    alert.alertViewStyle = UIAlertViewStyleDefault;
                    [alert show];
                    [alert release];
                    
                }
            }else{
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Connection Lost" message:@"Please Check your Internet Settings" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                alert.alertViewStyle = UIAlertViewStyleDefault;
                [alert show];
                [alert release];
            }
        }

    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"Check Your Settings"  delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
    }
}

- (IBAction)ResetButton:(id)sender {
    [super release];
    EPLOrderCheck *first = [[EPLOrderCheck alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:first animated:YES completion:NULL];
}
@end

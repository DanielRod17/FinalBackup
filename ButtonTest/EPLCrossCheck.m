//
//  EPLCrossCheck.m
//  ButtonTest
//
//  Created by itsupport on 10/26/17.
//  Copyright (c) 2017 EP Logistics, LLC. All rights reserved.
//

#import "EPLCrossCheck.h"
#import "EPLOrderCheck.h"
#import "EPLAppDelegate.h"
#import "EPLViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface EPLCrossCheck () <UIGestureRecognizerDelegate>

@end

@implementation EPLCrossCheck

NSString *Barcodote;
NSString *Order;
NSString *Fixed1;
NSString *Fixed2;
NSString *Fixed3;
bool first;
bool second;
bool third;
- (void)viewDidLoad {
    [super viewDidLoad];
    EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication]delegate];
    Order = appDelegate.OrderID;
    linea =[Linea sharedDevice];
    [linea addDelegate:self];
    [linea connect];
    _PalletID.autocorrectionType = UITextAutocorrectionTypeNo;
    _Qty.autocorrectionType = UITextAutocorrectionTypeNo;
    _PartNo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
    /////////////////////////////// (SIZE)
    NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?OrderCross="];
    URLmao = [URLmao stringByAppendingString:Order];
    NSURL *targetURL = [NSURL URLWithString:URLmao];
    NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray* foo = [dataString componentsSeparatedByString: @"|"];
    NSString* Customer = [foo objectAtIndex: 0];
    NSString* Att1 = [foo objectAtIndex: 1];
    NSString* Att2 = [foo objectAtIndex: 2];
    NSString* Att3 = [foo objectAtIndex: 3];
    Fixed1 = [foo objectAtIndex: 4];
    Fixed2 = [foo objectAtIndex: 5];
    Fixed3 = [foo objectAtIndex: 6];
    ///////////////////////////////////
    CAGradientLayer *gradientLayer = [EPLCrossCheck greyGradient];
    gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    self.Scrollito.contentSize =CGSizeMake(320, 1100);
    _Customer.text= Customer;
    if(![Att1 isEqualToString:@"No"]){
        first = 1;
        UITextField *At1Name = [[UITextField alloc] initWithFrame:CGRectMake(-90, 192, 225, 30)];
        At1Name.textColor = [UIColor colorWithRed:256/256.0 green:256/256.0 blue:256/256.0 alpha:1.0];
        At1Name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        At1Name.text=Att1;
        UITextField *At1 = [[UITextField alloc] initWithFrame:CGRectMake(-90, 220, 225, 30)];
        At1.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
        At1.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        At1.backgroundColor=[UIColor whiteColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(133, 30, 50, 100)];
        At1.layer.cornerRadius = 7; // this value vary as per your desire
        [At1 setUserInteractionEnabled:YES];
        At1.tag = 101;
        At1.autocorrectionType = UITextAutocorrectionTypeNo;
        [view addSubview:At1];
        [view addSubview:At1Name];
        [self.Scrollito addSubview:view];[
        At1 release];
        [At1Name release];
    }
    if(![Att2 isEqualToString:@"No"]){
        second = 1;
        UITextField *At2Name = [[UITextField alloc] initWithFrame:CGRectMake(-90, 258, 225, 30)];
        At2Name.textColor = [UIColor colorWithRed:256/256.0 green:256/256.0 blue:256/256.0 alpha:1.0];
        At2Name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        At2Name.text=Att2;
        UITextField *At2 = [[UITextField alloc] initWithFrame:CGRectMake(-90, 286, 225, 30)];
        At2.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
        At2.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        At2.backgroundColor=[UIColor whiteColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(133, 30, 50, 100)];
        At2.layer.cornerRadius = 7; // this value vary as per your desire
        At2.clipsToBounds = YES;
        At2.autocorrectionType = UITextAutocorrectionTypeNo;
        [view addSubview:At2Name];
        [view addSubview:At2];
        [self.Scrollito addSubview:view];
        [At2 setTag:102];
        [At2 release];
        [At2Name release];
    }
    if(![Att3 isEqualToString:@"No"]){
        third = 1;
        if(![Att2 isEqualToString:@"No"]){
            UITextField *At3Name = [[UITextField alloc] initWithFrame:CGRectMake(-90, 324, 225, 30)];
            At3Name.textColor = [UIColor colorWithRed:256/256.0 green:256/256.0 blue:256/256.0 alpha:1.0];
            At3Name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            At3Name.text=Att3;
            UITextField *At3 = [[UITextField alloc] initWithFrame:CGRectMake(2, 352, 131, 30)];
            At3.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
            At3.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            At3.backgroundColor=[UIColor whiteColor];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(133, 30, 50, 100)];
            At3.layer.cornerRadius = 7; // this value vary as per your desire
            At3.clipsToBounds = YES;
            At3.autocorrectionType = UITextAutocorrectionTypeNo;
            [view addSubview:At3Name];
            [view addSubview:At3];
            [self.Scrollito addSubview:view];
            [At3 setTag:103];
            [At3 release];
            [At3Name release];
        }
        else{
            UITextField *At3Name = [[UITextField alloc] initWithFrame:CGRectMake(-90, 258, 225, 30)];
            At3Name.textColor = [UIColor colorWithRed:256/256.0 green:256/256.0 blue:256/256.0 alpha:1.0];
            At3Name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            At3Name.text=Att3;
            UITextField *At3 = [[UITextField alloc] initWithFrame:CGRectMake(2, 286, 131, 30)];
            At3.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
            At3.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            At3.backgroundColor=[UIColor whiteColor];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(133, 30, 50, 100)];
            At3.layer.cornerRadius = 7; // this value vary as per your desire
            At3.clipsToBounds = YES;
            At3.autocorrectionType = UITextAutocorrectionTypeNo;
            [view addSubview:At3Name];
            [view addSubview:At3];
            [self.view addSubview:view];
            [At3 setTag:103];
            [At3 release];
            [At3Name release];
        }
    }
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    gestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:gestureRecognizer];
    [gestureRecognizer release];
    /////////////////
    if(second==1&&third!=1){
        //[_Scrollito setContentOffset:CGPointMake(0, 0) animated:YES];
        CGRect SendFrame = _SendBut.frame;
        SendFrame.origin.x = 53;
        SendFrame.origin.y = 370;
        _SendBut.frame = SendFrame;
        CGRect CrossFrame = _CrossBut.frame;
        CrossFrame.origin.x = 53;
        CrossFrame.origin.y = 522;
        _CrossBut.frame = CrossFrame;
        CGRect ClearFrame = _ClearBut.frame;
        ClearFrame.origin.x = 53;
        ClearFrame.origin.y = 613;
        _ClearBut.frame = ClearFrame;
        CGRect ReturnFrame = _ReturnBut.frame;
        ReturnFrame.origin.x = 53;
        ReturnFrame.origin.y = 680;
        _ReturnBut.frame = ReturnFrame;
        CGRect newFrame = self.view.frame;
        newFrame.size.width = 320;
        newFrame.size.height = 720;
        [self.view setFrame:newFrame];
    }
    if(second!=1&&third!=1){
        CGRect SendFrame = _SendBut.frame;
        SendFrame.origin.x = 53;
        SendFrame.origin.y = 304;
        _SendBut.frame = SendFrame;
        CGRect CrossFrame = _CrossBut.frame;
        CrossFrame.origin.x = 53;
        CrossFrame.origin.y = 456;
        _CrossBut.frame = CrossFrame;
        CGRect ClearFrame = _ClearBut.frame;
        ClearFrame.origin.x = 53;
        ClearFrame.origin.y = 547;
        _ClearBut.frame = ClearFrame;
        CGRect ReturnFrame = _ReturnBut.frame;
        ReturnFrame.origin.x = 53;
        ReturnFrame.origin.y = 614;
        _ReturnBut.frame = ReturnFrame;
        
        CGRect newFrame = self.view.frame;
        newFrame.size.width = 320;
        newFrame.size.height = 660;
        [self.view setFrame:newFrame];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

-(void)barcodeData:(NSString *)barcode type:(int)type {
    Barcodote = barcode;
    UITextField *attrib1 = (UITextField *)[self.view viewWithTag:101];
    UITextField *attrib2 = (UITextField *)[self.view viewWithTag:102];
    UITextField *attrib3 = (UITextField *)[self.view viewWithTag:103];
    ////
    if(_PalletID.text.length == 0 ){
        _PalletID.text=Barcodote;
    }
    else{
        if(_PartNo.text.length == 0 ){
            _PartNo.text=Barcodote;
        }
        else{
            if(_Qty.text.length == 0 ){
                _Qty.text=Barcodote;
            }
            else{
                [_Scrollito setContentOffset:CGPointMake(0, 220) animated:YES];
                if(attrib1.text.length == 0&&([Fixed1 isEqualToString:@"No"])){
                    attrib1.text=Barcodote;
                }
                else{
                    if(attrib2.text.length == 0&&([Fixed2 isEqualToString:@"No"])){
                        attrib2.text=Barcodote;
                    }
                    else{
                        if(attrib3.text.length == 0&&([Fixed3 isEqualToString:@"No"])){
                            attrib3.text=Barcodote;
                        }
                    }
                }
            }
        }
    }
}


- (void)dealloc {
    [_Scrollito release];
    [_Send release];
    [_Customer release];
    [_Return release];
    [_SendBut release];
    [_CrossBut release];
    [_ClearBut release];
    [_ReturnBut release];
    [super dealloc];
}
- (IBAction)Return:(id)sender {
    for (UIView *view in [self.view subviews])
    {
        [view removeFromSuperview];
    }
    for (UIView *view in [_Scrollito subviews])
    {
        [view removeFromSuperview];
    }
    EPLOrderCheck *first = [[EPLOrderCheck alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:first animated:YES completion:NULL];
}

- (IBAction)ClearCross:(id)sender {
        UITextField *attrib1 = (UITextField *)[self.view viewWithTag:101];
        UITextField *attrib2 = (UITextField *)[self.view viewWithTag:102];
        UITextField *attrib3 = (UITextField *)[self.view viewWithTag:103];
        _PalletID.text=[NSString stringWithFormat:@""];
        _PartNo.text=[NSString stringWithFormat:@""];
        _Qty.text=[NSString stringWithFormat:@""];
        if([Fixed1 isEqualToString:@"No"]){
            attrib1.text=[NSString stringWithFormat:@""];
        }
        if([Fixed2 isEqualToString:@"No"]){
            attrib2.text=[NSString stringWithFormat:@""];
        }
        if([Fixed3 isEqualToString:@"No"]){
            attrib3.text=[NSString stringWithFormat:@""];
        }
        [_Scrollito setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (IBAction)Enviar:(id)sender {
    NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?EthernetCheck=1"];
    NSURL *targetURL = [NSURL URLWithString:URLmao];
    NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray* foo = [dataString componentsSeparatedByString: @"|"];
    NSString* equalito = [foo objectAtIndex: 0];
    if([equalito isEqualToString:@"Success"]){
        EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication]delegate];
        Order = appDelegate.OrderID;
        UITextField *attrib1 = (UITextField *)[self.view viewWithTag:101];
        UITextField *attrib2 = (UITextField *)[self.view viewWithTag:102];
        UITextField *attrib3 = (UITextField *)[self.view viewWithTag:103];
        NSString *PalletID = _PalletID.text;
        NSString *PartNo = _PartNo.text;
        NSString *Qty = _Qty.text;
        NSString *Attri1 = attrib1.text;
        NSString *Attri2 = attrib2.text;
        NSString *Attri3 = attrib3.text;
        PalletID= [PalletID stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        PartNo= [PartNo stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        Qty= [Qty stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        Attri1= [Attri1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        Attri2= [Attri2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        Attri3= [Attri3 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if(_PalletID.text.length == 0 ){
            PalletID = @"no";
        }
        if(_PartNo.text.length == 0 ){
            PartNo = @"no";
        }
        if(_Qty.text.length == 0 ){
            Qty = @"no";
        }
        if(attrib1.text.length == 0 ){
            Attri1 = @"1";
        }
        if(second != 1||attrib2.text.length == 0 ){
            Attri2 = @"1";
        }
        if(third != 1 ||attrib3.text.length == 0){
            Attri3 = @"1";
        }
        NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?SendCross=1&PalletID="];
        URLmao = [URLmao stringByAppendingString:PalletID];
        URLmao = [URLmao stringByAppendingString:@"&PartNo="];
        URLmao = [URLmao stringByAppendingString:PartNo];
        URLmao = [URLmao stringByAppendingString:@"&Qty="];
        URLmao = [URLmao stringByAppendingString:Qty];
        URLmao = [URLmao stringByAppendingString:@"&At1="];
        URLmao = [URLmao stringByAppendingString:Attri1];
        URLmao = [URLmao stringByAppendingString:@"&At2="];
        URLmao = [URLmao stringByAppendingString:Attri2];
        URLmao = [URLmao stringByAppendingString:@"&At3="];
        URLmao = [URLmao stringByAppendingString:Attri3];
        URLmao = [URLmao stringByAppendingString:@"&OrderID="];
        URLmao = [URLmao stringByAppendingString:Order];
        NSURL *targetURL = [NSURL URLWithString:URLmao];
        NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
        NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSArray* foo = [dataString componentsSeparatedByString: @"|"];
        NSString* equalito = [foo objectAtIndex: 0];
        NSString* title;
        NSString* body = [foo objectAtIndexedSubscript: 1];
        body = [body stringByAppendingPathComponent:@" Pallets Left"];
        if([equalito isEqualToString:@"Exists"])
        {
            title = @"Information Updated!";
            _PalletID.text=@"";
            _PartNo.text=@"";
            _Qty.text=@"";
            attrib1.text=@"";
            attrib2.text=@"";
            attrib3.text=@"";
        }
        else if([equalito isEqualToString:@"Rumpeltsiltskin"])
        {
            title = @"Wrong Pallet";
        }
        else
        {
            title = @"Repeated Pallet";
        }
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:body delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
        [_Scrollito setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"Check Your Settings"  delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
    }
    
}

- (IBAction)Crosscheck:(id)sender {
    NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?EthernetCheck=1"];
    NSURL *targetURL = [NSURL URLWithString:URLmao];
    NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSArray* foo = [dataString componentsSeparatedByString: @"|"];
    NSString* equalito = [foo objectAtIndex: 0];
    if([equalito isEqualToString:@"Success"]){
        EPLAppDelegate *appDelegate = (EPLAppDelegate *)[[UIApplication sharedApplication]delegate];
        Order = appDelegate.OrderID;
        NSString *URLmao = [NSString stringWithFormat:@"https://eplserver.net/erp/tools/BoxPalletID/Token&.php?crosscheck=1&OrderIN="];
        URLmao = [URLmao stringByAppendingString:Order];
        NSURL *targetURL = [NSURL URLWithString:URLmao];
        NSURLRequest *requost = [NSURLRequest requestWithURL:targetURL];
        NSData *data = [NSURLConnection sendSynchronousRequest:requost returningResponse:nil error:nil];
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSArray* foo = [dataString componentsSeparatedByString: @"|"];
        NSString* equalito = [foo objectAtIndex: 0];
        NSString* title;
        NSString* body = [foo objectAtIndexedSubscript: 1];
        NSString* Ay = [foo objectAtIndexedSubscript: 1];
        body = [body stringByAppendingString:@" Wrong Pallets"];
        if([equalito isEqualToString:@"Success"])
        {
            Ay = [Ay stringByAppendingString:@" New Token to Locate"];
            title = @"Success!";
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:Ay delegate:self cancelButtonTitle:@"Home" otherButtonTitles:@"Allocate",nil];
            alert.alertViewStyle = UIAlertViewStyleDefault;
            [alert show];
            [alert release];
        }
        else
        {
            title = @"Failure";
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:body delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
            alert.alertViewStyle = UIAlertViewStyleDefault;
            [alert show];
            [alert release];
        }
        [_Scrollito setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"Check Your Settings"  delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        [alert release];
    }
    
}

- (void)tapView:(UIGestureRecognizer *)gestureRecognizer {
    UITextField *attrib1 = (UITextField *)[self.view viewWithTag:101];
    UITextField *attrib2 = (UITextField *)[self.view viewWithTag:102];
    UITextField *attrib3 = (UITextField *)[self.view viewWithTag:103];
    float dimensionX = 225;
    float dimensionY = 30;
    CGPoint touchPoint=[gestureRecognizer locationInView:_Scrollito];
    float xTap = touchPoint.x;
    float yTap = touchPoint.y;
    float y1 = attrib1.frame.origin.y;
    float y2 = attrib2.frame.origin.y;
    float y3 = attrib3.frame.origin.y;
    if(first==1&&((xTap>=((320/2)-(dimensionX/2))&&xTap<=(320/2)+(dimensionX/2)))&&((yTap>=y1+dimensionY)&&(yTap<=(y1+dimensionY*2)))){
        [attrib1 becomeFirstResponder];
    }
    else if(second==1&&((xTap>=((320/2)-(dimensionX/2))&&xTap<=(320/2)+(dimensionX/2)))&&((yTap>=y2+dimensionY)&&(yTap<=(y2+dimensionY*2)))){
        [attrib2 becomeFirstResponder];
    }
    else if(third==1&&((xTap>=((320/2)-(dimensionX/2))&&xTap<=(320/2)+(dimensionX/2)))&&((yTap>=y3+dimensionY)&&(yTap<=(y3+dimensionY*2)))){
        [attrib3 becomeFirstResponder];
    }
    else{
        [self.view endEditing:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {        EPLOrderCheck *first = [[EPLOrderCheck alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:first animated:YES completion:NULL];
    }
    if (buttonIndex == 1)
    {
        EPLViewController *first = [[EPLViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:first animated:YES completion:NULL];
        
    }
}

@end

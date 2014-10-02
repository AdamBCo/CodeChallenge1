//
//  ViewController.m
//  CodeChallenge1
//
//  Created by Adam Cooper on 10/2/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTwoTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationBarItem;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBarTitle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarItem.enabled = NO;
}

- (IBAction)calculateButtonPressed:(id)sender {
    NSInteger numberOne = self.numberOneTextField.text.integerValue;
    NSInteger numberTwo = self.numberTwoTextField.text.integerValue;
    NSInteger result;
    result = numberOne * numberTwo;
    NSString *resultString = [NSString stringWithFormat:@"%ld",(long)result];
    self.navigationBarTitle.title = resultString;
    NSLog(@"%@",resultString);
    [self.numberOneTextField resignFirstResponder];
    [self.numberTwoTextField resignFirstResponder];
    
    if (result % 5 == 0) {
        self.navigationBarItem.enabled = YES;
        //self.navigationItem.rightBarButtonItem = nil;
    } else {
       self.navigationBarItem.enabled = NO;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *webViewController = segue.destinationViewController;
    webViewController.webViewTitle = self.navigationBarTitle.title;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if (self.navigationBarItem.enabled){
        return YES;
    }
    return NO;
}


@end

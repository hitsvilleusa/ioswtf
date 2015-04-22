//
//  ViewController.m
//  TabOrderTest
//
//  Created by Chris Morris on 12/12/14.
//  Copyright (c) 2014 HitsvilleDevelopment. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIAccessibilityConstants.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *youName;
@property (weak, nonatomic) IBOutlet UITextField *youEmail;
@property (weak, nonatomic) IBOutlet UITextField *themName;
@property (weak, nonatomic) IBOutlet UITextField *themEmail;
@property (weak, nonatomic) IBOutlet UIView *columnOne;
@property (weak, nonatomic) IBOutlet UIView *columnTwo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // This won't do it either
    self.columnOne.shouldGroupAccessibilityChildren = YES;
    self.columnTwo.shouldGroupAccessibilityChildren = YES;

    // I was hopeful that doing this would change the order when using a hardware
    // keyboard and tabbing from field to field, but alas, it does not.
//    self.view.accessibilityElements = @[self.youName, self.youEmail, self.themName, self.themEmail];

}

@end

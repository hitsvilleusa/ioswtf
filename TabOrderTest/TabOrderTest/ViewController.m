//
//  ViewController.m
//  TabOrderTest
//
//  Created by Chris Morris on 12/12/14.
//  Copyright (c) 2014 HitsvilleDevelopment. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *youName;
@property (weak, nonatomic) IBOutlet UITextField *youEmail;
@property (weak, nonatomic) IBOutlet UITextField *themName;
@property (weak, nonatomic) IBOutlet UITextField *themEmail;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    // I was hopeful that doing this would change the order when using a hardware
    // keyboard and tabbing from field to field, but alas, it does not.
    self.view.accessibilityElements = @[self.youName, self.youEmail, self.themName, self.themEmail];
}

@end

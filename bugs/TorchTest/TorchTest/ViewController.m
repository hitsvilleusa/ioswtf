//
//  ViewController.m
//  TorchTest
//
//  Created by Chris Morris on 4/22/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (strong, nonatomic) AVCaptureDevice *backCamera;
@property (weak, nonatomic) IBOutlet UILabel *torchLevelLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];

    for (AVCaptureDevice *device in devices) {
        if (device.position == AVCaptureDevicePositionBack) {
            self.backCamera = device;
            break;
        }
    }

    [self.backCamera addObserver:self
                      forKeyPath:@"torchLevel"
                         options:0
                         context:NULL];
}

- (IBAction)torchLevelChanged:(UISlider *)sender
{
    [self updateTorchLevel:sender.value];
}

- (void)updateTorchLevel:(float)torchLevel
{
    NSError *error;

    NSLog(@"Current torch level %f", self.backCamera.torchLevel);

    if ([self.backCamera lockForConfiguration:&error]) {
        BOOL success = [self.backCamera setTorchModeOnWithLevel:torchLevel
                                                          error:&error];

        if (!success) {
            NSLog(@"Can't set torch level");
        }
    }
    else {
        NSLog(@"Can't get lock");
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"KVO change for keypath %@", keyPath);
    NSLog(@"Torch level is %f", self.backCamera.torchLevel);
    self.torchLevelLabel.text = [NSString stringWithFormat:@"%f", self.backCamera.torchLevel];
}

@end

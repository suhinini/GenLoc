//
//  SMViewController.m
//  SMGenLocSample
//
//  Created by Ivan Suhinin on 2/9/13.
//  Copyright (c) 2013 Cherrit. All rights reserved.
//

#import "SMViewController.h"
#include <stdlib.h>

@implementation SMViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.txtDescription.text = NSLocalizedString(SMLocalizedTextDescription, nil);
    [self.btnPress setTitle:NSLocalizedString(SMLocalizedTextPress, nil) forState:UIControlStateNormal];
    
    leftCounter = 0;
    centerCounter = 0;
    rightCounter = 0;
    
    [self updateValues];
}

- (void) updateValues {
    self.lblCounterLeft.text = [NSString stringWithFormat:@"%d", leftCounter];
    self.lblCounterCenter.text = [NSString stringWithFormat:@"%d", centerCounter];
    self.lblCounterRight.text = [NSString stringWithFormat:@"%d", rightCounter];
}

- (IBAction) onPress:(id)sender {
    NSInteger indexToIncrease = arc4random() % 3;
    switch (indexToIncrease) {
        case 0: {
            leftCounter++;
            break;
        }
        case 1: {
            centerCounter++;
            break;
        }
        case 2: {
            rightCounter++;
            break;
        }
    }
    
    [self updateValues];
}

@end

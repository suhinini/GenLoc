//
//  SMViewController.h
//  SMGenLocSample
//
//  Created by Ivan Suhinin on 2/9/13.
//  Copyright (c) 2013 Cherrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMViewController : UIViewController {
    NSInteger leftCounter;
    NSInteger centerCounter;
    NSInteger rightCounter;
}

@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblCounterLeft;
@property (weak, nonatomic) IBOutlet UILabel *lblCounterCenter;
@property (weak, nonatomic) IBOutlet UILabel *lblCounterRight;
@property (weak, nonatomic) IBOutlet UIButton *btnPress;

- (IBAction)onPress:(id)sender;

@end

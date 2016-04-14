//
//  ViewController.m
//  Connect4
//
//  Created by Candance Lam on 4/11/16.
//  Copyright © 2016 captainMewBu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set turns to 0 at start
    turns = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spacePress:(UIButton *)sender {
    // the button tag testing
    NSInteger i = [sender tag];
    NSLog(@"test %ld", i);
    
    // the button that was clicked by the user gets an red circle
    UIButton *tmpButton = (UIButton *)[self.view viewWithTag:i];
    UIImage *redImage = [[UIImage imageNamed:@"red.gif"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tmpButton setImage: redImage forState:UIControlStateNormal];
    
    // set tag to outside possible range so computer can't select same button (chose 100 for easier check win)
    [tmpButton setTag: i + 100];
    turns++;

    // if user wins
    if ([self checkForWin]) {
        UIAlertController *alert = [UIAlertController
                                        alertControllerWithTitle:@"You won!"
                                        message:@"You beat the computer!"
                                        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                    actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                   }];
        
        [alert addAction:okAction];
        turns = 43;
    }
    
    // if there are turns left
    if (turns < 42) {
        // randomly select a number (button) for the computer's turn
        int r = arc4random() % 42;
        
        // sets number to button
        UIButton *compButton = (UIButton *)[self.view viewWithTag:r];
    
        // ensure button is selectable, else choose another
        while (![[compButton.superview viewWithTag:r] isKindOfClass:[UIButton class]]) {
            r = arc4random() % 42;
            compButton = (UIButton *)[self.view viewWithTag:r]; NSLog(@"random %d", r);
        }
        
        // the button that was chosen by computer gets an yellow circle
        UIImage *yellowImage = [[UIImage imageNamed:@"yellow.gif"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [compButton setImage: yellowImage forState:UIControlStateNormal];

        // set tag to outside possible range so user can't select same button
        [compButton setTag:r + 100];
        turns++;
    
        // if computer wins
        if ([self checkForWin]) {
            UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle:@"Computer won!"
                                    message:@"You got beat the computer!"
                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                   }];
        
            [alert addAction:okAction];
            turns = 43;
        }
    }
}

-(BOOL) checkForWin {
    
    // assign index to each button
    UIButton *Button1 = (UIButton *)[self.view viewWithTag:1];
    UIButton *Button2 = (UIButton *)[self.view viewWithTag:2];
    UIButton *Button3 = (UIButton *)[self.view viewWithTag:3];
    UIButton *Button4 = (UIButton *)[self.view viewWithTag:4];
    UIButton *Button5 = (UIButton *)[self.view viewWithTag:5];
    UIButton *Button6 = (UIButton *)[self.view viewWithTag:6];
    UIButton *Button7 = (UIButton *)[self.view viewWithTag:7];
    UIButton *Button8 = (UIButton *)[self.view viewWithTag:8];
    UIButton *Button9 = (UIButton *)[self.view viewWithTag:9];
    UIButton *Button10 = (UIButton *)[self.view viewWithTag:10];
    UIButton *Button11 = (UIButton *)[self.view viewWithTag:11];
    UIButton *Button12 = (UIButton *)[self.view viewWithTag:12];
    UIButton *Button13 = (UIButton *)[self.view viewWithTag:13];
    UIButton *Button14 = (UIButton *)[self.view viewWithTag:14];
    UIButton *Button15 = (UIButton *)[self.view viewWithTag:15];
    UIButton *Button16 = (UIButton *)[self.view viewWithTag:16];
    UIButton *Button17 = (UIButton *)[self.view viewWithTag:17];
    UIButton *Button18 = (UIButton *)[self.view viewWithTag:18];
    UIButton *Button19 = (UIButton *)[self.view viewWithTag:19];
    UIButton *Button20 = (UIButton *)[self.view viewWithTag:20];
    UIButton *Button21 = (UIButton *)[self.view viewWithTag:21];
//    UIButton *Button22 = (UIButton *)[self.view viewWithTag:122];
//    UIButton *Button23 = (UIButton *)[self.view viewWithTag:123];
//    UIButton *Button24 = (UIButton *)[self.view viewWithTag:124];
//    UIButton *Button25 = (UIButton *)[self.view viewWithTag:125];
//    UIButton *Button26 = (UIButton *)[self.view viewWithTag:126];
//    UIButton *Button27 = (UIButton *)[self.view viewWithTag:127];
//    UIButton *Button28 = (UIButton *)[self.view viewWithTag:128];
//    UIButton *Button29 = (UIButton *)[self.view viewWithTag:129];
//    UIButton *Button30 = (UIButton *)[self.view viewWithTag:130];
//    UIButton *Button31 = (UIButton *)[self.view viewWithTag:131];
//    UIButton *Button32 = (UIButton *)[self.view viewWithTag:132];
//    UIButton *Button33 = (UIButton *)[self.view viewWithTag:133];
//    UIButton *Button34 = (UIButton *)[self.view viewWithTag:134];
//    UIButton *Button35 = (UIButton *)[self.view viewWithTag:135];
//    UIButton *Button36 = (UIButton *)[self.view viewWithTag:136];
//    UIButton *Button37 = (UIButton *)[self.view viewWithTag:137];
//    UIButton *Button38 = (UIButton *)[self.view viewWithTag:138];
//    UIButton *Button39 = (UIButton *)[self.view viewWithTag:139];
//    UIButton *Button40 = (UIButton *)[self.view viewWithTag:140];
//    UIButton *Button41 = (UIButton *)[self.view viewWithTag:141];
//    UIButton *Button42 = (UIButton *)[self.view viewWithTag:142];
    
    // HORIZONTAL WINS
    // horizontal line 1
    if ([Button1.currentImage isEqual:Button2.currentImage] &&
//       (Button2.currentImage == Button3.currentImage) &
//       (Button3.currentImage == Button4.currentImage) &
        (Button1.currentImage != NULL))
    {
        return YES;
    }
    
//    if ((Button2.currentImage == Button3.currentImage) &&
//       (Button3.currentImage == Button4.currentImage) &&
//       (Button4.currentImage == Button5.currentImage) &&
//       (Button2.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button3.currentImage == Button4.currentImage) &&
//       (Button4.currentImage == Button5.currentImage) &&
//       (Button5.currentImage == Button6.currentImage) &&
//       (Button3.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button4.currentImage == Button5.currentImage) &&
//       (Button5.currentImage == Button6.currentImage) &&
//       (Button6.currentImage == Button7.currentImage) &&
//       (Button4.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    // horizontal line 2
//    if ((Button8.currentImage == Button9.currentImage) &
//       (Button9.currentImage == Button10.currentImage) &
//       (Button10.currentImage == Button11.currentImage) &
//       (Button8.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button9.currentImage == Button10.currentImage) &
//       (Button10.currentImage == Button11.currentImage) &
//       (Button11.currentImage == Button12.currentImage) &
//       (Button9.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button10.currentImage == Button11.currentImage) &
//       (Button11.currentImage == Button12.currentImage) &
//       (Button12.currentImage == Button13.currentImage) &
//       (Button10.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button11.currentImage == Button12.currentImage) &
//       (Button12.currentImage == Button13.currentImage) &
//       (Button13.currentImage == Button14.currentImage) &
//       (Button11.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    // horizontal line 3
//    if ((Button15.currentImage == Button16.currentImage) &
//       (Button16.currentImage == Button17.currentImage) &
//       (Button17.currentImage == Button18.currentImage) &
//       (Button15.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button16.currentImage == Button17.currentImage) &
//       (Button17.currentImage == Button18.currentImage) &
//       (Button18.currentImage == Button19.currentImage) &
//       (Button16.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button17.currentImage == Button18.currentImage) &
//       (Button18.currentImage == Button19.currentImage) &
//       (Button19.currentImage == Button20.currentImage) &
//       (Button17.currentImage != NULL))
//    {
//        return YES;
//    }
//    
//    if ((Button18.currentImage == Button19.currentImage) &
//       (Button19.currentImage == Button20.currentImage) &
//       (Button20.currentImage == Button21.currentImage) &
//       (Button18.currentImage != NULL))
//    {
//        return YES;
//    }
    
    return NO;
}

@end

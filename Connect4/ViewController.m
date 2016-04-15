//
//  ViewController.m
//  Connect4
//
//  Created by Candance Lam on 4/11/16.
//  Copyright © 2016 captainMewBu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *buttonArray;

@property (weak, nonatomic) IBOutlet UIButton *Button1;
@property (weak, nonatomic) IBOutlet UIButton *Button2;
@property (weak, nonatomic) IBOutlet UIButton *Button3;
@property (weak, nonatomic) IBOutlet UIButton *Button4;
@property (weak, nonatomic) IBOutlet UIButton *Button5;
@property (weak, nonatomic) IBOutlet UIButton *Button6;
@property (weak, nonatomic) IBOutlet UIButton *Button7;
@property (weak, nonatomic) IBOutlet UIButton *Button8;
@property (weak, nonatomic) IBOutlet UIButton *Button9;
@property (weak, nonatomic) IBOutlet UIButton *Button10;
@property (weak, nonatomic) IBOutlet UIButton *Button11;
@property (weak, nonatomic) IBOutlet UIButton *Button12;
@property (weak, nonatomic) IBOutlet UIButton *Button13;
@property (weak, nonatomic) IBOutlet UIButton *Button14;
@property (weak, nonatomic) IBOutlet UIButton *Button15;
@property (weak, nonatomic) IBOutlet UIButton *Button16;
@property (weak, nonatomic) IBOutlet UIButton *Button17;
@property (weak, nonatomic) IBOutlet UIButton *Button18;
@property (weak, nonatomic) IBOutlet UIButton *Button19;
@property (weak, nonatomic) IBOutlet UIButton *Button20;
@property (weak, nonatomic) IBOutlet UIButton *Button21;
@property (weak, nonatomic) IBOutlet UIButton *Button22;
@property (weak, nonatomic) IBOutlet UIButton *Button23;
@property (weak, nonatomic) IBOutlet UIButton *Button24;
@property (weak, nonatomic) IBOutlet UIButton *Button25;
@property (weak, nonatomic) IBOutlet UIButton *Button26;
@property (weak, nonatomic) IBOutlet UIButton *Button27;
@property (weak, nonatomic) IBOutlet UIButton *Button28;
@property (weak, nonatomic) IBOutlet UIButton *Button29;
@property (weak, nonatomic) IBOutlet UIButton *Button30;
@property (weak, nonatomic) IBOutlet UIButton *Button31;
@property (weak, nonatomic) IBOutlet UIButton *Button32;
@property (weak, nonatomic) IBOutlet UIButton *Button33;
@property (weak, nonatomic) IBOutlet UIButton *Button34;
@property (weak, nonatomic) IBOutlet UIButton *Button35;
@property (weak, nonatomic) IBOutlet UIButton *Button36;
@property (weak, nonatomic) IBOutlet UIButton *Button37;
@property (weak, nonatomic) IBOutlet UIButton *Button38;
@property (weak, nonatomic) IBOutlet UIButton *Button39;
@property (weak, nonatomic) IBOutlet UIButton *Button40;
@property (weak, nonatomic) IBOutlet UIButton *Button41;
@property (weak, nonatomic) IBOutlet UIButton *Button42;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set turns to 0 at start
    turns = 0;
    
    // put buttons into a 2D array
    NSMutableArray *buttonArray = [[NSMutableArray alloc] initWithCapacity: 42];
    
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: self.Button1, self.Button2, self.Button3, self.Button4, self.Button5, self.Button6, self.Button7, nil] atIndex: 0];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: self.Button8, self.Button9, self.Button10, self.Button11, self.Button12, self.Button13, self.Button14, nil] atIndex: 1];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: self.Button15, self.Button16, self.Button17, self.Button18, self.Button19, self.Button20, self.Button21, nil] atIndex: 2];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: self.Button22, self.Button23, self.Button24, self.Button25, self.Button26, self.Button27, self.Button28, nil] atIndex: 3];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: self.Button29, self.Button30, self.Button31, self.Button32, self.Button33, self.Button34, self.Button35, nil] atIndex: 4];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: self.Button36, self.Button37, self.Button38, self.Button39, self.Button40, self.Button41, self.Button42, nil] atIndex: 5];

}

- (void)buttonPressed:(UIButton *)sender {
    int index = [self.buttonArray indexOfObject:sender];
    // Now handle the button press based
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
    

//    // HORIZONTAL WINS
//    // horizontal line 1
//    if ([_Button1.currentImage isEqual:_Button2.currentImage] &&
////       (Button2.currentImage == Button3.currentImage) &
////       (Button3.currentImage == Button4.currentImage) &
//        (_Button1.currentImage != NULL))
//    {
//        return YES;
//    }
    
    return NO;
}

@end

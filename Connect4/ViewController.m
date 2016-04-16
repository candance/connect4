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
    
    [buttonArray insertObject: [NSMutableArray arrayWithObjects: @0, @0, @0, @0, @0, @0, @0, nil] atIndex: 0];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: @0, @0, @0, @0, @0, @0, @0, nil] atIndex: 1];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: @0, @0, @0, @0, @0, @0, @0, nil] atIndex: 2];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: @0, @0, @0, @0, @0, @0, @0, nil] atIndex: 3];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: @0, @0, @0, @0, @0, @0, @0, nil] atIndex: 4];
    [buttonArray insertObject:[NSMutableArray arrayWithObjects: @0, @0, @0, @0, @0, @0, @0, nil] atIndex: 5];
    
    self.buttonArray = buttonArray;
}

- (IBAction)spacePress:(UIButton *)sender {
    // the button tag testing
    NSInteger buttonTagPickedByPlayer1 = [sender tag];
    NSLog(@"test %ld", buttonTagPickedByPlayer1);
    
    // the button that was clicked by the user gets an red circle
    UIButton *tmpButton = (UIButton *)[self.view viewWithTag:buttonTagPickedByPlayer1];
    UIImage *redImage = [[UIImage imageNamed:@"red.gif"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tmpButton setImage: redImage forState:UIControlStateNormal];
    
    // update 2D array of board with tagged button and player number
    [self updateButtonArrayWithButtonTag:buttonTagPickedByPlayer1 andPlayerNumber: @1];
    
    // set tag to outside possible range so computer can't select same button
    [tmpButton setTag: buttonTagPickedByPlayer1 + 100];
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
        int buttonTagPickedByComp = arc4random() % 42;
        
        // sets number to button
        UIButton *compButton = (UIButton *)[self.view viewWithTag:buttonTagPickedByComp];
    
        // ensure button is selectable, else choose another
        while (![[compButton.superview viewWithTag:buttonTagPickedByComp] isKindOfClass:[UIButton class]]) {
            buttonTagPickedByComp = arc4random() % 42;
            compButton = (UIButton *)[self.view viewWithTag:buttonTagPickedByComp]; NSLog(@"random %d", buttonTagPickedByComp);
        }
        
        // the button that was chosen by computer gets an yellow circle
        UIImage *yellowImage = [[UIImage imageNamed:@"yellow.gif"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [compButton setImage: yellowImage forState:UIControlStateNormal];
        
        // update 2D array of board with tagged button and computer number
        [self updateButtonArrayWithButtonTag:buttonTagPickedByComp andPlayerNumber:@2];

        // set tag to outside possible range so user can't select same button
        [compButton setTag:buttonTagPickedByComp + 100];
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


// calculate index for pressed button
// update buttonArray with new index
- (void)updateButtonArrayWithButtonTag:(NSInteger)buttonTag andPlayerNumber:(NSNumber *)playerNumber {
    
    NSInteger rowIndex;
    
    if (buttonTag <= 7) {
        rowIndex = 0;
    }
    else if (buttonTag >= 8 && buttonTag <= 14) {
        rowIndex = 1;
    }
    else if (buttonTag >= 15 && buttonTag <= 21) {
        rowIndex = 2;
    }
    else if (buttonTag >= 22 && buttonTag <= 28) {
        rowIndex = 3;
    }
    else if (buttonTag >= 29 && buttonTag <= 35) {
        rowIndex = 4;
    }
    else {
        rowIndex = 5;
    }
    
    NSInteger totalNumberOfColumns = 7;
    NSInteger columnIndex;
    
    if (buttonTag % totalNumberOfColumns == 1) {
        columnIndex = 0;
    }
    else if (buttonTag % totalNumberOfColumns == 2) {
        columnIndex = 1;
    }
    else if (buttonTag % totalNumberOfColumns == 3) {
        columnIndex = 2;
    }
    else if (buttonTag % totalNumberOfColumns == 4) {
        columnIndex = 3;
    }
    else if (buttonTag % totalNumberOfColumns == 5) {
        columnIndex = 4;
    }
    else if (buttonTag % totalNumberOfColumns == 6) {
        columnIndex = 5;
    }
    else {
        columnIndex = 6;
    }
    
    NSMutableArray *arrayToUpdate = [self.buttonArray objectAtIndex:rowIndex];
    [arrayToUpdate replaceObjectAtIndex:columnIndex withObject:playerNumber];
    
}

- (BOOL)checkForWin {
    
    NSInteger totalNumberOfRows = 6;
    NSInteger totalNumberOfColumns = 7;
    
    // HORIZONTAL WINS
    // iterating over each row
    for (int row = 0; row < totalNumberOfRows; row ++) {
        NSMutableArray *arrayToCheck = [self.buttonArray objectAtIndex:row];
        // iterating over column number 3 and above (since less than 3 means there is no 4 in a row)
        for (int column = 3; column < totalNumberOfColumns; column ++) {
            // if button is filled with a player number
            if (![[arrayToCheck objectAtIndex:column] isEqual: @0]) {
                    if ([arrayToCheck objectAtIndex:column] == [arrayToCheck objectAtIndex:column - 1] &&
                        [arrayToCheck objectAtIndex:column - 1] == [arrayToCheck objectAtIndex:column - 2] &&
                        [arrayToCheck objectAtIndex:column - 2] == [arrayToCheck objectAtIndex:column - 3]){
                            return YES;
                        }
            }
        }
    }
    
    // VERTICAL WINS
    // iterating over row number 3 and above (since less than 3 means there is no 4 in a 'column')
    for (int row = 3; row < totalNumberOfRows; row ++) {
        NSMutableArray *arrayToCheck = [self.buttonArray objectAtIndex:row];
        // iterating over each column
        for (int column = 0; column < totalNumberOfColumns; column ++) {
            // if button is filled with a player number
            if (![[arrayToCheck objectAtIndex:column] isEqual: @0]) {
                NSMutableArray *nextRowToCheck = [self.buttonArray objectAtIndex:row - 1];
                NSMutableArray *next2ndRowToCheck = [self.buttonArray objectAtIndex:row - 2];
                NSMutableArray *next3rdRowToCheck = [self.buttonArray objectAtIndex:row - 3];
                if ([arrayToCheck objectAtIndex:column] == [nextRowToCheck objectAtIndex:column] &&
                    [nextRowToCheck objectAtIndex:column] == [next2ndRowToCheck objectAtIndex:column] &&
                    [next2ndRowToCheck objectAtIndex:column] == [next3rdRowToCheck objectAtIndex:column]) {
                    return YES;
                }
            }
        }
    }
        


    
    
    
    
    return NO;
}

@end

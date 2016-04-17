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
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

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

@property (weak, nonatomic) IBOutlet UILabel *turnLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set turns to 0 at start
    turns = 0;
    
    self.turnLabel.text = @"Welcome! Tap a space to start game!";
    
    self.resetButton.layer.borderColor = [UIColor colorWithRed:102.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:5.0].CGColor;
    self.resetButton.layer.borderWidth = 2;
    self.resetButton.layer.cornerRadius = 5;
    
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
    
    // change turnLabel to computer's thinking
    self.turnLabel.text = @"Computer's thinking...";
    
    // update 2D array of board with tagged button and player number
    [self updateButtonArrayWithButtonTag:buttonTagPickedByPlayer1 andPlayerNumber: @1];
    
    turns++;

    // if user wins
    if ([self checkForWin]) {
        self.turnLabel.text = nil;
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
        [self presentViewController:alert animated:YES completion:nil];
        turns = 43;
    }
    
    // Delay computer action by 1.2 secs
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        // if there are turns left
        if (turns < 42) {
            // randomly select a number (button) for the computer's turn
            int buttonTagPickedByComp = arc4random() % 42;
            
            // sets number to button
            UIButton *compButton = (UIButton *)[self.view viewWithTag:buttonTagPickedByComp];
            
            // ensure button is selectable, else choose another
            while (![[compButton.superview viewWithTag:buttonTagPickedByComp] isKindOfClass:[UIButton class]]) {
                buttonTagPickedByComp = arc4random() % 42;
                compButton = (UIButton *)[self.view viewWithTag:buttonTagPickedByComp];
                NSLog(@"random %d", buttonTagPickedByComp);
            }
            
            // the button that was chosen by computer gets an yellow circle
            UIImage *yellowImage = [[UIImage imageNamed:@"yellow.gif"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            [compButton setImage: yellowImage forState:UIControlStateNormal];
            
            // change turnLabel to player's turn
            self.turnLabel.text = @"Your turn!";
            
            // update 2D array of board with tagged button and computer number
            [self updateButtonArrayWithButtonTag:buttonTagPickedByComp andPlayerNumber:@2];
            
            turns++;
            
            // if computer wins
            if ([self checkForWin]) {
                self.turnLabel.text = nil;
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
                [self presentViewController:alert animated:YES completion:nil];
                turns = 43;
            }
        }
    });
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
                // check if values are the same 4 in a row
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
                // make new variables to allow check across different rows
                NSMutableArray *nextRowToCheck = [self.buttonArray objectAtIndex:row - 1];
                NSMutableArray *next2ndRowToCheck = [self.buttonArray objectAtIndex:row - 2];
                NSMutableArray *next3rdRowToCheck = [self.buttonArray objectAtIndex:row - 3];
                // check if values are the same 4 in a column
                if ([arrayToCheck objectAtIndex:column] == [nextRowToCheck objectAtIndex:column] &&
                    [nextRowToCheck objectAtIndex:column] == [next2ndRowToCheck objectAtIndex:column] &&
                    [next2ndRowToCheck objectAtIndex:column] == [next3rdRowToCheck objectAtIndex:column]) {
                        return YES;
                }
            }
        }
    }
        
    // DIAGONAL WINS: "\"
    // iterating over row number 3 and above (since less than 3 means there is no 4 in a 'diagonal')
    for (int row = 3; row < totalNumberOfRows; row ++) {
        NSMutableArray *arrayToCheck = [self.buttonArray objectAtIndex:row];
        // iterating over column number 3 and above (since less than 3 means there is no 4 in a 'diagonal')
        for (int column = 3; column < totalNumberOfColumns; column ++) {
            // if button is filled with a player number
            if (![[arrayToCheck objectAtIndex:column] isEqual: @0]) {
                // make new variables to allow check across different rows
                NSMutableArray *nextRowToCheck = [self.buttonArray objectAtIndex:row - 1];
                NSMutableArray *next2ndRowToCheck = [self.buttonArray objectAtIndex:row - 2];
                NSMutableArray *next3rdRowToCheck = [self.buttonArray objectAtIndex:row - 3];
                // check if values are the same diagonally in this way: "\"
                if ([arrayToCheck objectAtIndex:column] == [nextRowToCheck objectAtIndex:column - 1] &&
                    [nextRowToCheck objectAtIndex:column - 1] == [next2ndRowToCheck objectAtIndex:column - 2] &&
                    [next2ndRowToCheck objectAtIndex:column - 2] == [next3rdRowToCheck objectAtIndex:column - 3]) {
                    return YES;
                }
            }
        }
    }
    
    // DIAGONAL WINS: "/"
    // iterating over row number 3 and above (since less than 3 means there is no 4 in a 'diagonal')
    for (int row = 3; row < totalNumberOfRows; row ++) {
        NSMutableArray *arrayToCheck = [self.buttonArray objectAtIndex:row];
        // iterating over each column
        for (int column = 0; column < totalNumberOfColumns; column ++) {
            // if button is filled with a player number
            if (![[arrayToCheck objectAtIndex:column] isEqual: @0]) {
                // make new variables to allow check across different rows
                NSMutableArray *nextRowToCheck = [self.buttonArray objectAtIndex:row - 1];
                NSMutableArray *next2ndRowToCheck = [self.buttonArray objectAtIndex:row - 2];
                NSMutableArray *next3rdRowToCheck = [self.buttonArray objectAtIndex:row - 3];
                // make sure index at column + 3 is valid
                if (column + 3 < 7){
                    // check if values are the same diagonally in this way: "/"
                    if ([arrayToCheck objectAtIndex:column] == [nextRowToCheck objectAtIndex:column + 1] &&
                        [nextRowToCheck objectAtIndex:column + 1] == [next2ndRowToCheck objectAtIndex:column + 2] &&
                        [next2ndRowToCheck objectAtIndex:column + 2] == [next3rdRowToCheck objectAtIndex:column + 3]) {
                        return YES;
                    }

                }
            }
        }
    }
    return NO;
}

- (IBAction)resetGame:(UIButton *)sender {
    [self resetBoard];
}

- (void)resetBoard {
    [self.Button1 setImage:NULL forState:UIControlStateNormal];
    [self.Button2 setImage:NULL forState:UIControlStateNormal];
    [self.Button3 setImage:NULL forState:UIControlStateNormal];
    [self.Button4 setImage:NULL forState:UIControlStateNormal];
    [self.Button5 setImage:NULL forState:UIControlStateNormal];
    [self.Button6 setImage:NULL forState:UIControlStateNormal];
    [self.Button7 setImage:NULL forState:UIControlStateNormal];
    [self.Button8 setImage:NULL forState:UIControlStateNormal];
    [self.Button9 setImage:NULL forState:UIControlStateNormal];
    [self.Button10 setImage:NULL forState:UIControlStateNormal];
    [self.Button11 setImage:NULL forState:UIControlStateNormal];
    [self.Button12 setImage:NULL forState:UIControlStateNormal];
    [self.Button13 setImage:NULL forState:UIControlStateNormal];
    [self.Button14 setImage:NULL forState:UIControlStateNormal];
    [self.Button15 setImage:NULL forState:UIControlStateNormal];
    [self.Button16 setImage:NULL forState:UIControlStateNormal];
    [self.Button17 setImage:NULL forState:UIControlStateNormal];
    [self.Button18 setImage:NULL forState:UIControlStateNormal];
    [self.Button19 setImage:NULL forState:UIControlStateNormal];
    [self.Button20 setImage:NULL forState:UIControlStateNormal];
    [self.Button21 setImage:NULL forState:UIControlStateNormal];
    [self.Button22 setImage:NULL forState:UIControlStateNormal];
    [self.Button23 setImage:NULL forState:UIControlStateNormal];
    [self.Button24 setImage:NULL forState:UIControlStateNormal];
    [self.Button25 setImage:NULL forState:UIControlStateNormal];
    [self.Button26 setImage:NULL forState:UIControlStateNormal];
    [self.Button27 setImage:NULL forState:UIControlStateNormal];
    [self.Button28 setImage:NULL forState:UIControlStateNormal];
    [self.Button29 setImage:NULL forState:UIControlStateNormal];
    [self.Button30 setImage:NULL forState:UIControlStateNormal];
    [self.Button31 setImage:NULL forState:UIControlStateNormal];
    [self.Button32 setImage:NULL forState:UIControlStateNormal];
    [self.Button33 setImage:NULL forState:UIControlStateNormal];
    [self.Button34 setImage:NULL forState:UIControlStateNormal];
    [self.Button35 setImage:NULL forState:UIControlStateNormal];
    [self.Button36 setImage:NULL forState:UIControlStateNormal];
    [self.Button37 setImage:NULL forState:UIControlStateNormal];
    [self.Button38 setImage:NULL forState:UIControlStateNormal];
    [self.Button39 setImage:NULL forState:UIControlStateNormal];
    [self.Button40 setImage:NULL forState:UIControlStateNormal];
    [self.Button41 setImage:NULL forState:UIControlStateNormal];
    [self.Button42 setImage:NULL forState:UIControlStateNormal];

    turns = 0;
    
    self.turnLabel.text = @"Tap a space to start game!";
    
    NSInteger totalNumberOfRows = 6;
    NSInteger totalNumberOfColumns = 7;
    
    // reset array to @0
    // iterating over each row
    for (int row = 0; row < totalNumberOfRows; row ++) {
        NSMutableArray *arrayToReset = [self.buttonArray objectAtIndex:row];
        // iterating over each column
        for (int column = 0; column < totalNumberOfColumns; column ++) {
            [arrayToReset replaceObjectAtIndex:column withObject:@0];
        }
    }
}

@end

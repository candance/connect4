//
//  ViewController.h
//  Connect4
//
//  Created by Candance Smith on 4/11/16.
//  Copyright © 2016 candance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    // to count number of turns
    int turns;
}

- (IBAction)spacePress:(UIButton *)sender;

- (IBAction)resetGame:(UIButton *)sender;

@end

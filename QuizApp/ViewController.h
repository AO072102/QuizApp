//
//  ViewController.h
//  QuizApp
//
//  Created by gmmikan on 2016/01/20.
//  Copyright © 2016年 shunsuke.mikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)startQuiz:(id)sender;
- (IBAction)exitQuiz:(id)sender;

@property(nonatomic, weak) IBOutlet UIButton *startButton;
@property(nonatomic, weak) IBOutlet UIButton *exitButton;

- (IBAction)changeDisplay:(id)sender;

@property(nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property(nonatomic, weak) IBOutlet UITextView *questionTextView;
@property(nonatomic, weak) IBOutlet UITextView *answerTextView;
@property(nonatomic, weak) IBOutlet UIButton *yesButton;
@property(nonatomic, weak) IBOutlet UIButton *noButton;

@end


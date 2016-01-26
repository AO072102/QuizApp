//
//  ViewController.m
//  QuizApp
//
//  Created by gmmikan on 2016/01/20.
//  Copyright © 2016年 shunsuke.mikawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // 質問文
    NSArray *questionArray;
    // 正否
    NSArray *answerArray;
    // 回答文
    NSArray *answerTextArray;
    // 背景画像
    NSArray *quizBackgroundImageArray;
    // 回答したクイズの数
    NSInteger quizCount;
    // 正解したクイズの数
    NSInteger okCount;
}
@end

@implementation ViewController

// 回答状況をリセット
- (void)reset {
    quizCount = 0;
    okCount = 0;
}

// クイズのトップページを表示
- (void)displayTopPage {
    self.questionTextView.text = @"クイズです！！正しい場合は○ボタンを、正しくない場合は×ボタンを押してください。";
    self.answerTextView.hidden = YES;
    self.yesButton.hidden = YES;
    self.noButton.hidden = YES;
    [self reset];
}

// 正解率を表示
- (void)displayScore {
    NSLog(@"quizCountの値：%d", quizCount);
    NSLog(@"okCountの値：%d", okCount);
    NSLog(@"scoreの値：%.0f", (double)okCount / quizCount * 100);
    self.questionTextView.text = [@"あなたの正答率は、" stringByAppendingString: [NSString stringWithFormat: @"%.0f%%です。", (double)okCount / quizCount * 100] ];

    self.startButton.hidden = NO;
    self.exitButton.hidden = NO;
    [self.startButton  setTitle:@"もう一度" forState:UIControlStateNormal];

}

// 質問文を表示
- (void)displayQuestionText {
    self.questionTextView.text = questionArray[quizCount];
    self.yesButton.hidden = NO;
    self.noButton.hidden = NO;
}

// クイズを開始
// 質問文の表示と正答率の表示
- (IBAction)startQuiz:(id)sender {
    NSLog(@"QUIZ IS STARTED");

    if (quizCount < [questionArray count]) {
        self.startButton.hidden = YES;
        self.exitButton.hidden = YES;
        self.answerTextView.hidden = YES;
        
        [self displayQuestionText];
    } else {
        self.answerTextView.hidden = YES;
        [self displayScore];
        [self reset];
    }
}

// クイズを止める
- (IBAction)exitQuiz:(id)sender {
    NSLog(@"QUIZ IS EXITED");
    [self displayTopPage];
    [self.startButton  setTitle:@"クイズを始める" forState:UIControlStateNormal];
}

- (IBAction)changeDisplay:(id)sender {
    NSLog(@"QUIZ IS ANSWERED");
    
    self.yesButton.hidden = YES;
    self.noButton.hidden = YES;

    //押されたボタンの定義
    UIButton *button = (UIButton *)sender;

    // 正誤判定
    self.answerTextView.hidden = NO;
    if ([answerArray[quizCount] intValue]== (int)button.tag) {
        self.answerTextView.text = [@"正解です。" stringByAppendingString: answerTextArray[quizCount]];
        okCount++;
    } else {
        self.answerTextView.text = [@"不正解です。" stringByAppendingString: answerTextArray[quizCount]];
    }
    
    // クイズの結果を表示または次のクイズの質問文を表示
    if (quizCount == [questionArray count] - 1) {
        self.startButton.hidden = NO;
        self.exitButton.hidden = NO;
        [self.startButton  setTitle:@"結果を確認する" forState:UIControlStateNormal];
    } else {
        self.startButton.hidden = NO;
        self.exitButton.hidden = NO;
        [self.startButton  setTitle:@"次のクイズに進む" forState:UIControlStateNormal];
    }
    
    NSLog(@"quizCountの値：%d", quizCount);
    NSLog(@"answerArrayの値：%@", answerArray[quizCount]);
    NSLog(@"answerArrayの値：%@", answerTextArray[quizCount]);
    NSLog(@"tagの番号：%d", (int)button.tag);
    
    quizCount++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.backgroundImageView.image = [UIImage imageNamed:@"Image1.png"];

    questionArray = @[
                 @"「Apple」は日本語で「林檎」を表す？",
                 @"Appleの本社はアメリカの「カリフォルニア」である？",
                 @"「iRobot」はAppleの製品である？",
                 @"「スティーブ・ジョブズ」の正しいスペルは「Steven Jobs」である？",
                 @"Appleが自社で開発したプロセッサの名称は「B5」である？"];

    answerArray = @[
                    @0,
                    @0,
                    @1,
                    @0,
                    @1];

    answerTextArray = @[
                    @"「Apple」は日本語で「林檎」を表します。",
                    @"Appleの本社はアメリカの「カリフォルニア」です。",
                    @"「iRobot」はAppleの製品ではありません。",
                    @"「スティーブ・ジョブズ」の正しいスペルは「Steven Jobs」です。",
                    @"Appleが自社で開発したプロセッサの名称は「A4」です。"];

    quizBackgroundImageArray = @[
                                 @"Image1.png",
                                 @"Image2.png",
                                 @"Image1.png",
                                 @"Image2.png",
                                 @"Image1.png"];
    
    [self.yesButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.yesButton.layer setCornerRadius:10.0];
    [self.yesButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.yesButton.layer setBorderWidth:1.0];
    [self.yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self.noButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.noButton.layer setCornerRadius:10.0];
    [self.noButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.noButton.layer setBorderWidth:1.0];
    [self.noButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self displayTopPage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

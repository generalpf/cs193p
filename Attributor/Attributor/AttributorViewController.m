//
//  ViewController.m
//  Attributor
//
//  Created by Ryan Walberg on 2015-06-05.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "AttributorViewController.h"

@interface AttributorViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation AttributorViewController

#pragma mark Events

- (IBAction)colorButtonTap:(UIButton *)sender {
    NSMutableAttributedString *newText = [[NSMutableAttributedString alloc] initWithAttributedString:[self.textView attributedText]];
    [newText addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:[self.textView selectedRange]];
    [self.textView setAttributedText:newText];
}

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

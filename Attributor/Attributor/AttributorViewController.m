//
//  ViewController.m
//  Attributor
//
//  Created by Ryan Walberg on 2015-06-05.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "AttributorViewController.h"
#import "TextStatsViewController.h"

@interface AttributorViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation AttributorViewController

#pragma mark - Events

- (IBAction)colorButtonTap:(UIButton *)sender
{
    [self.textView.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:[self.textView selectedRange]];
}

- (IBAction)outline:(UIButton *)sender
{
    [self.textView.textStorage addAttributes:@{ NSStrokeWidthAttributeName: @3, NSStrokeColorAttributeName: [UIColor blackColor] } range:[self.textView selectedRange]];
}

- (IBAction)unoutline:(UIButton *)sender
{
    [self.textView.textStorage removeAttribute:NSStrokeWidthAttributeName range:[self.textView selectedRange]];
    [self.textView.textStorage removeAttribute:NSStrokeColorAttributeName range:[self.textView selectedRange]];
}

- (void)preferredFontSizeChanged:(NSNotification *)notification
{
    [self usePreferredFonts];
}

- (void)usePreferredFonts
{
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (![segue.identifier isEqualToString:@"Analyze"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *dest = (TextStatsViewController *) segue.destinationViewController;
            dest.textToAnalyze = self.textView.attributedText;
        }
    }
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontSizeChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

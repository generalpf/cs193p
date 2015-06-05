//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Ryan Walberg on 2015-06-05.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedLabel;
@end

@implementation TextStatsViewController

#pragma mark - Properties

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) {
        [self updateUI];
    }
}

#pragma mark - Core

- (void)updateUI
{
    self.colorfulLabel.text = [NSString stringWithFormat:@"%lu colourful characters.", (unsigned long) [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedLabel.text = [NSString stringWithFormat:@"%lu outlined characters.", (unsigned long) [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    unsigned long index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            ++index;
        }
    }
    return characters;
}

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

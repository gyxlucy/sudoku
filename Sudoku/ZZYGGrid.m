//
//  ZZYGGrid.m
//  Sudoku
//
//  Created by Yaxi Gao on 9/12/14.
//  Copyright (c) 2014 Zehao Zhang Yaxi Gao. All rights reserved.
//

#import "ZZYGGrid.h"

@implementation ZZYGGrid

UIButton* myButtons[9][9];

- (id)initWithFrame:(CGRect)frame size:(CGFloat) buttonSize
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    _buttonSize = buttonSize;
    return self;
}

- (void)setRow:(int)i andCol:(int)j toValue:(int)val needRow:(int)row andCol:(int)column
{
    // Create a new button and set its value
    CGRect buttonFrame = CGRectMake(row, column, _buttonSize, _buttonSize);
    myButtons[i][j] = [[UIButton alloc] initWithFrame:buttonFrame];
    myButtons[i][j].backgroundColor = [UIColor whiteColor];
    myButtons[i][j].tag = i * 9 + j;
    
    if (val){
        [myButtons[i][j] setTitle:[NSString stringWithFormat: @"%d", val] forState:UIControlStateNormal];
    }
    
    [myButtons[i][j] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:myButtons[i][j]];
    
    [myButtons[i][j] addTarget:self action:@selector(buttonPressedUp:) forControlEvents:UIControlEventTouchUpInside];
    [myButtons[i][j] addTarget:self action:@selector(buttonPressedDown:) forControlEvents:UIControlEventTouchDown];
}

- (void)setHighlighted:(UIButton*) sender
{
    sender.backgroundColor = [UIColor yellowColor];
}

- (void)buttonPressedUp:(UIButton*)sender
{
    sender.backgroundColor = [UIColor whiteColor];
}

- (void)buttonPressedDown:(UIButton*)sender
{
    [self setHighlighted:(sender)];
    myButtons[_highlighted/9][_highlighted%9].backgroundColor = [UIColor whiteColor];
    _highlighted = sender.tag;
    NSLog(@"You Pressed the button %@", sender.currentTitle);
    NSLog(@"Button Row %d", [self getButtonRow:sender]);
    NSLog(@"Button Col %d", [self getButtonCol:sender]);
}

- (int)getButtonRow:(UIButton*) sender
{
    return sender.tag % 9;
}

- (int)getButtonCol:(UIButton*) sender
{
    return sender.tag / 9;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

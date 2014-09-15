//
//  ZZYGViewController.m
//  Sudoku
//
//  Created by Yaxi Gao on 9/12/14.
//  Copyright (c) 2014 Zehao Zhang Yaxi Gao. All rights reserved.
//

#import "ZZYGViewController.h"
#import "ZZYGGrid.h"

int initialGrid[9][9] = {
    {8,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

@interface ZZYGViewController () {
    ZZYGGrid* _gridView;
}

@end

@implementation ZZYGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // create grid frame
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)*.1;
    CGFloat y = CGRectGetHeight(frame)*.1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.80;
    
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    // create gridView
    CGFloat buttonSize = size / 10.0;
    _gridView = [[ZZYGGrid alloc] initWithFrame:gridFrame size: buttonSize];
    [self.view addSubview:_gridView];
    
    [self addButtons: buttonSize];

}

- (void)addButtons:(CGFloat) buttonSize
{
    // create buttons
    // row and column are used for display convenience
    int row = 14;
    int column = 0;
    
    for (int i = 0; i < 9; i++) {
        column = 14;
        for (int j = 0; j < 9; j++) {
            
            [_gridView setRow:(int)i andCol:(int)j toValue:(int)initialGrid[i][j] needRow:(int)row andCol:(int)column];
            
            column += (buttonSize + 3);
            if ((j + 1) % 3 == 0) {
                column += 5;
            }
        }
        row += (buttonSize + 3);
        if ((i + 1) % 3 == 0) {
            row += 5;
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

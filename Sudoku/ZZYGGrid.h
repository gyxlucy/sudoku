//
//  ZZYGGrid.h
//  Sudoku
//
//  Created by Yaxi Gao on 9/12/14.
//  Copyright (c) 2014 Zehao Zhang Yaxi Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZYGGrid : UIView
{
    CGFloat _buttonSize;
    int _highlighted;
}
    - (id)initWithFrame:(CGRect)frame size:(CGFloat) buttonSize;
    - (void) setRow:(int)i andCol:(int)j toValue:(int)val needRow:(int)row andCol:(int)column;

@end

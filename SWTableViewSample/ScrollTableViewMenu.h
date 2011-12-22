//
//  ScrollTableView.h
//  SWTableViewSample
//
//  Created by usr on 11/12/22.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SWTableView.h"
#import "SWTableViewCell.h"
#import "SWTableViewSpriteCell.h"
#import "SWMultiColumnTableView.h"


@protocol ScrollTableViewMenuDelegate <NSObject>
@end

@interface ScrollTableViewMenu : CCLayer
< SWTableViewDelegate, SWTableViewDataSource >
{
 @private
    id<ScrollTableViewMenuDelegate> delegate_;
    SWTableView *tableView_;
    CCArray *elements_;
    CGSize cellSize_;
}
@property (nonatomic, assign) id<ScrollTableViewMenuDelegate> delegate;
@property (nonatomic, retain) SWTableView *tableView;
@property (nonatomic, retain) CCArray *elements;

- (id) initWithArray:(CCArray *)array;
+ (id) menuWithArray:(CCArray *)array;

@end

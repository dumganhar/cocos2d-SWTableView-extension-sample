//
//  ScrollTableViewMenu.m
//  SWTableViewSample
//
//  Created by usr on 11/12/22.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ScrollTableViewMenu.h"

@implementation ScrollTableViewMenu

@synthesize tableView = tableView_;
@synthesize elements = elements_;

- (void) dealloc;
{
    [tableView_ release];
    [elements_ release];
    
    [super dealloc];
}

- (id) init
{
    NSAssert(NO, @"no init");
    [self release];
    return nil;
}

- (id) initWithArray:(CCArray *)array;
{
    if (!(self = [super init])) return nil;
    cellSize_ = CGSizeMake(65, 57);
    self.isTouchEnabled = YES;
    self.elements = array;
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    self.tableView = [SWTableView viewWithDataSource:self size:CGSizeMake(winSize.width, cellSize_.height)];
    self.tableView.delegate = self;
    self.tableView.direction = SWScrollViewDirectionHorizontal;
    self.tableView.verticalFillOrder = SWTableViewFillTopDown;
    
    [self addChild:tableView_];
    [self.tableView reloadData];
    return self;
}

- (void) setPosition:(CGPoint)position
{
    self.tableView.position = position;
}

- (CGPoint) position
{
    return self.tableView.position;
}

+ (id) menuWithArray:(CCArray *)array;
{
    return [[[self alloc] initWithArray:array] autorelease];
}

-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL) containsTouchLocation:(UITouch *)touch
{
    CGSize s = self.tableView.viewSize;
    CGRect r = CGRectMake(self.position.x, self.position.y, s.width, s.height);
    return CGRectContainsPoint(r, [self convertTouchToNodeSpace:touch]);
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
{
    if (![self containsTouchLocation:touch]) return NO;
    return YES;
}

# pragma mark accessor
- (id) delegate
{
    return delegate_;
}

- (void) setDelegate:(id)delegate
{
    delegate_ = delegate;
}

# pragma mark -
# pragma mark SWTableViewDelegate Protocol
-(void)table:(SWTableView *)table cellTouched:(SWTableViewSpriteCell *)cell;
{
    NSLog(@"cell touched at index: %i {%.2f, %.2f} {%.2f, %.2f}", cell.idx, cell.position.x, cell.position.y, cell.sprite.position.x, cell.sprite.position.y);
# warning todo: delegate selected
    self.position = ccp(self.position.x, self.position.y + cellSize_.height);
}

# pragma mark -
# pragma mark SWTableViewDataSource Protocol
-(CGSize)cellSizeForTable:(SWTableView *)table;
{
    return cellSize_;
}

-(SWTableViewCell *)table:(SWTableView *)table cellAtIndex:(NSUInteger)idx;
{
    SWTableViewSpriteCell *cell = (SWTableViewSpriteCell *) [table dequeueCell];
    if (!cell) {
        cell = [[[SWTableViewSpriteCell alloc] init] autorelease];
    }
    
    CCSprite *image = [CCSprite spriteWithFile:[self.elements objectAtIndex:idx]];
    image.color = ccc3(255/(idx + 1), 255/(idx + 1), 255);
    cell.sprite = image;
    cell.sprite.position = ccp((cellSize_.width - image.contentSize.width) /2, (cellSize_.height - image.contentSize.height) / 2);
    return cell;
}

-(NSUInteger)numberOfCellsInTableView:(SWTableView *)table;
{
    return [elements_ count];
}

@end

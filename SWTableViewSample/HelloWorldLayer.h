//
//  HelloWorldLayer.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "ScrollTableViewMenu.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
 @private
    ScrollTableViewMenu *menu_;
}

@property (nonatomic, retain) ScrollTableViewMenu *menu;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

- (void) showScrollMenu;

@end

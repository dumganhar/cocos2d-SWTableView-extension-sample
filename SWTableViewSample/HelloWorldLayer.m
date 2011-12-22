//
//  HelloWorldLayer.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize menu = menu_;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) dealloc
{
    [menu_ release];
    menu_ = nil;
    
    [super dealloc];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/1.5 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        [self showScrollMenu];
	}
	return self;
}

-(void) showScrollMenu
{
    CCArray *array = [CCArray array];
    for (int i = 0; i < 11; i++) {
        [array addObject:@"Icon.png"];
    }
    ScrollTableViewMenu *menu = [ScrollTableViewMenu menuWithArray:array];
    [self addChild:menu];
}

@end

//
//  HelloWorldLayer.m
//  MulitTouch
//
//  Created by Rene Kretzschmar on 27.09.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

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

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
		// ask director the the window size
		CGSize s = [[CCDirector sharedDirector] winSize];
        
        CCLabelTTF* setLongLabel = [CCLabelTTF labelWithString:@"Set Long Value" fontName:@"Arial" fontSize:32];
        
        CCMenuItemLabel* setLongValueTestcase = [CCMenuItemLabel itemWithLabel:setLongLabel
                                                                        target:self selector:@selector(setLongValueTestcase:)];
        
        setLongValueTestcase.position = ccp(s.width/2,s.height - 64);
        
        CCLabelTTF* getLongLabel = [CCLabelTTF labelWithString:@"Get Long Value" fontName:@"Arial" fontSize:32];
        
        CCMenuItemLabel* getLongValueTestcase = [CCMenuItemLabel itemWithLabel:getLongLabel
                                                                        target:self selector:@selector(getLongValueTestcase:)];
        
        getLongValueTestcase.position = ccp(s.width/2,s.height - 128);
        
        CCMenu* menu = [CCMenu menuWithItems:getLongValueTestcase, setLongValueTestcase, nil];
        
        menu.position = CGPointZero;
        
        [self addChild:menu];
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(void)setLongValueTestcase:(id)sender {
    NSLog(@"setLongValueTestcase");
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:[NSNumber numberWithLong:10000000L] forKey:@"longValue"];
    
    [prefs synchronize];
    
}

-(void)getLongValueTestcase:(id)sender {
    NSLog(@"getLongValueTestcase");
    
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    long longValue = [[prefs objectForKey:@"longValue"] longValue];
    
    NSLog(@"longValue: %li", longValue);
}

/**
 -(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 }
 
 -(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 NSArray* allTouches = [touches allObjects];
 
 for(int i = 0; i < [allTouches count]; i++) {
 UITouch* touch = [allTouches objectAtIndex:i];
 CGPoint touchLocation = [touch locationInView: [touch view]];
 touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
 NSLog(@"touch %i: %f,%f",i, touchLocation.x, touchLocation.y);
 }
 }
 
 -(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
 
 }
 
 -(void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
 
 }
 **/
@end

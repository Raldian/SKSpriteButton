#import "SKSpriteButton.h"

@implementation SKSpriteButton

-(SKSpriteButton *) initWithType:(NSUInteger)type label:(NSString *)txt{
    self = [super initWithTexture:[SKTexture textureWithImageNamed:@"button"]];
    
    if(self){
        self.centerRect = CGRectMake(20.0/40.0, 20.0/40.0, 5.0/40.0, 5.0/40.0);
        self.name = txt;
        
        if(type == 1)
            self.xScale = 768/40;
        else if(type == 2)
            self.xScale = ([txt length]*20)/40;
        else
            self.xScale = ([txt length]*20)/40;
        
        if(type == 2)
            self.yScale = (self.size.height)/40;
        else
            self.yScale = (self.size.height+20)/40;
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        label.text = txt;
        label.name = txt;
        label.fontSize = 30;
        label.yScale = label.fontSize/self.size.height;
        label.xScale = label.fontSize/self.size.width;
        label.position = CGPointMake(CGRectGetMidX(self.frame), self.size.height/2-label.fontSize);
        [self addChild:label];
    }
    
    return self;
}

@end

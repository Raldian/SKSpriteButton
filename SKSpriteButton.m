#import "SKSpriteButton.h"
#import "Constants.h"

typedef void (^SKSpriteButtonNodeSelectedBlock)(SKSpriteButton *buttonNode);

@interface SKSpriteButton ()
    @property (nonatomic, copy) SKSpriteButtonNodeSelectedBlock selectedBlock;

    @property (nonatomic, assign) BOOL isSelected;
@end

@implementation SKSpriteButton

+ (instancetype)buttonNodeWithType:(NSUInteger)type label:(NSString *)txt block:(void (^)(id))block{
    return [[self alloc] initButtonNodeWithType:type label:txt block:block];
}

- (instancetype)initButtonNodeWithType:(NSUInteger)type label:(NSString *)txt block:(void (^)(id))block{
    
    self = [super initWithTexture:[SKTexture textureWithImageNamed:@"button"]];
    if(self){
        _selectedBlock = block;
        self.userInteractionEnabled = YES;
        
        self.centerRect = CGRectMake(20.0/40.0, 20.0/40.0, 5.0/40.0, 5.0/40.0);
        self.name = txt;
        
        switch (type) {
            case 1:
                self.xScale = [[UIScreen mainScreen] bounds].size.width/41;
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
                
            case 2:
                self.xScale = ([[UIScreen mainScreen] bounds].size.width/42)/2;
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
                
            case 3:
                self.xScale = [[UIScreen mainScreen] bounds].size.height/(IS_IPHONE ? 65 : 55);
                self.yScale = (self.size.height)/(IS_IPHONE ? 65 : 20);
                break;
                
            case 4:
                self.xScale = ([[UIScreen mainScreen] bounds].size.width/42)/2;
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
                
            default:
                self.xScale = ([txt length]*20)/(IS_IPHONE ? 65 : 40);
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
        }
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"CardCharacters"];
        label.text = txt;
        label.name = txt;
        
        label.yScale = 30/self.size.height;
        label.xScale = 30/self.size.width;
        
        label.fontSize = self.size.height - (IS_IPHONE ? 7.5 : 0);
        
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - self.size.height/2 - label.frame.size.height/2);
        
        [self addChild:label];
    }
    
    return self;
}

- (void)selected{
    self.isSelected = YES;
}

- (void)unSelected{
    self.isSelected = NO;
}

- (void)activate{
    if(self.selectedBlock){
        __weak SKSpriteButton *buttonNode = self;
        self.selectedBlock(buttonNode);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.hidden || self.parent.hidden) {
        return;
    }
    
    [self selected];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self unSelected];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.isSelected) {
        [self unSelected];
        [self activate];
    }
}

@end

#import "SKSpriteButton.h"
#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"] || [[[UIDevice currentDevice] model] isEqualToString:@"iPhone Simulator"])

typedef void (^SKSpriteButtonNodeSelectedBlock)(SKSpriteButton *buttonNode);

@interface SKSpriteButton ()
    @property (nonatomic, copy) SKSpriteButtonNodeSelectedBlock selectedBlock;

    @property (nonatomic, assign) BOOL isSelected;
    
    @property (nonatomic, strong) SKLabelNode *labelNode;
@end

@implementation SKSpriteButton

+ (instancetype)buttonNodeWithType:(NSUInteger)type label:(NSString *)txt block:(void (^)(id))block{
    return [[self alloc] initButtonNodeWithType:type image:[SKTexture textureWithImageNamed:@"button"] label:txt block:block];
}

+ (instancetype)buttonNodeWithType:(NSUInteger)type image:(SKTexture *)texture label:(NSString *)txt block:(void (^)(id))block{
    return [[self alloc] initButtonNodeWithType:type image:texture label:txt block:block];
}

- (instancetype)initButtonNodeWithType:(NSUInteger)type image:(SKTexture *)texture label:(NSString *)txt block:(void (^)(id))block{
    self = [super initWithTexture:texture];
    if(self){
        _selectedBlock = block;
        self.userInteractionEnabled = YES;
        float _h = texture.size.height;
        float _w = texture.size.width;
        self.centerRect = CGRectMake((_h/2)/_h, (_h/2)/_h, 2/_w, 2/_h);
        self.name = txt;
        
        switch (type) {
            case 1:
                self.xScale = [[UIScreen mainScreen] bounds].size.width/_w-.1;
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
                
            case 2:
                self.xScale = ([[UIScreen mainScreen] bounds].size.width/_w)/2-.1;
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
                
            default:
                self.xScale = [[UIScreen mainScreen] bounds].size.width/_w-.1;
                self.yScale = (self.size.height+20)/(IS_IPHONE ? 65 : 40);
                break;
        }
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"CardCharacters"];
        label.text = txt;
        label.name = txt;
        
        label.yScale = (_h/1.5)/self.size.height;
        label.xScale = (_w/1.5)/self.size.width;
        
        label.fontSize = self.size.height - (IS_IPHONE ? 7.5 : 0);
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - self.size.height/2 - label.frame.size.height/2+2);
        
        [self addChild:label];
        _labelNode = label;
    }
    
    return self;
}

- (void)changeButtonLabel:(NSString *)label{
    _labelNode.text = label;
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

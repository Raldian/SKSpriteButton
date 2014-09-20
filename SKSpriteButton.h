#import <SpriteKit/SpriteKit.h>

@interface SKSpriteButton : SKSpriteNode

+ (instancetype) buttonNodeWithType:(NSUInteger) type
                              label:(NSString *) txt
                              block:(void(^)(id buttonNode))block;

@end

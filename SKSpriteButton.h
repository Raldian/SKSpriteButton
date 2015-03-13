@import SpriteKit;

@interface SKSpriteButton : SKSpriteNode

+ (instancetype) buttonNodeWithType:(NSUInteger) type
                              label:(NSString *) txt
                              block:(void(^)(id buttonNode))block;

+ (instancetype) buttonNodeWithType:(NSUInteger)type
                              image:(SKTexture *)texture
                              label:(NSString *)txt
                              block:(void (^)(id))block;

- (void) changeButtonLabel:(NSString *) label;

@end

# SKSpriteButton V2

## What is this?

This is just a "simple" button script i made to allow buttons with a texture to be set on the screen without the texture getting streached.

## How do i use it?

Firstly you need to import the SKSpriteButton file
``` objc
#import "SKSpriteButton.h"
```

And then you insert the button like this
``` objc
SKSpriteButton *btn = [SKSpriteButton buttonNodeWithType:1
                                                  label:NSLocalizedString(@"The label text.", nil)
                                                  block:^(id buttonNode){
                                                      //Something to do like:
                                                      [self handleStuff];
                                                  }];

//Type 1
//Set the position for the button
btn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

//Type 2 btn 1
btn.position = CGPointMake(CGRectGetMidX(self.frame)/2, CGRectGetMidY(self.frame));

//Type 2 btn 2
btn.position = CGPointMake(CGRectGetMidX(self.frame)*1.5, CGRectGetMidY(self.frame));

//Insert it to the view
[self addChild:btn];

```

## Why i made it.

I am developing a game and was looking for something like this but when it was nowhere to be found i created it myself.

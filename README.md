# SKSpriteButton

## What is this?

This is just a "simple" button script i made to allow buttons with a texture to be set on the screen without the texture getting streached.

I designed it for the iPad and have not tested it for the iPhone so some work might have to be done for it to look good on a iPhone.

## How do i use it?

Firstly you need to import the SKSpriteButton file
```
#import "SKSpriteButton.h"
```

And then you insert the button like this
```
SKSpriteButton *btn = [[SKSpriteButton alloc] initWithType:1 label:@"The label text."];

//Set the position for the button
btn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

//Insert it to the view
[self addChild:btn];

```

And to detect the button click you can use something like this
```
In -(void)touchesBegan

UITouch *touch = [touches anyObject];
CGPoint location = [touch locationInNode:self];
SKNode *node = [self nodeAtPoint:location];

//You insert the label name in here
if([node.name isEqualToString:@"The label text."]){
  //Something to be done when the button is clicked.
}
```

## Why i made it.

I am developing a game and was looking for something like this but when it was nowhere to be found i created it myself.

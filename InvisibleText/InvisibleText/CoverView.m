//
//  CoverView.m
//  InvisibleText
//
//  Created by 钟路成 on 16/6/13.
//  Copyright © 2016年 Lucheng Zhong. All rights reserved.
//

#import "CoverView.h"

@implementation CoverView{
    CGMutablePathRef path;
    CGFloat width;
    NSMutableArray *points;
    BOOL finished;
    NSTimer *timer;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUserInteractionEnabled:YES];
        
        [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
        
        width = 10;
        
        points = [NSMutableArray new];
        
        finished = false;
        
    }
    return self;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if(finished)
        return;
    path = CGPathCreateMutable();
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    [points addObject:[NSValue valueWithCGPoint:touchLocation]];
    [self setNeedsDisplay];
    if([points count]>85){
        finished = true;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                         target:self
                                       selector:@selector(addWidth)
                                       userInfo:nil
                                        repeats:YES];
    }
}
- (void)addWidth{
    if(finished){
        width = width+5;
        [self setNeedsDisplay];
        if(width > self.bounds.size.width){
            [timer invalidate];
            timer = nil;
        }
    }
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    for(NSValue *value in points){
        CGPoint location = [value CGPointValue];
        [aPath moveToPoint:location];
        [aPath addArcWithCenter:location
                         radius:width startAngle:0 endAngle:2 * M_PI clockwise:YES];
    }
    [aPath fill];
    CGContextAddRect(context, self.bounds);
    CGContextClosePath(context);

    
    
    UIColor * bkColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    CGContextSetFillColorWithColor(context, bkColor.CGColor);
    
    CGContextSetBlendMode(context, kCGBlendModeXOR);
    CGContextEOFillPath(context);
    
    UIImage *_originalImage = [UIImage imageNamed:@"blur"];
    [_originalImage drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeSourceIn alpha:0.97f];
    //CGContextEOClip(context);
    //UIImage *_originalImage = [UIImage imageNamed:@"blur"];
    //[_originalImage drawInRect:rect];
    
    
    //CGContextFillPath(context);

}


@end

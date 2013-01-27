//
//  HierarchicalButton.m
//  RunnersCompass
//
//  Created by Geoff MacDonald on 2013-01-11.
//  Copyright (c) 2013 Geoff MacDonald. All rights reserved.
//

#import "StartCell.h"

@implementation StartCell

@synthesize expandButton;
@synthesize headerLabel;
@synthesize buttonTapGesture;
@synthesize expandedView;
@synthesize headerView;
@synthesize justGoView;
@synthesize distancePresetLAbel;
@synthesize distanceView;
@synthesize pacePresetLabel;
@synthesize paceView;
@synthesize timeView;
@synthesize presetTimeLabel;
@synthesize expandedGesture;
@synthesize delegate;

@synthesize expanded;

-(void)setup
{
    [presetTimeLabel setText:@"40min"];
    [pacePresetLabel setText:@"4:35 min/Km"];
    [distancePresetLAbel setText:@"6.5 Km"];

    
    [self setExpand:false withAnimation:false];
    
    
    buttonTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleExpandTap:)];
    [buttonTapGesture setDelegate:self];
    [headerView addGestureRecognizer:buttonTapGesture];
    
    
    
    
    expandedGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                               action:@selector(handleStartTap:)];
    [expandedGesture setDelegate:self];
    [expandedView addGestureRecognizer:expandedGesture];
    
}


- (void)handleExpandTap:(UITapGestureRecognizer *)gestureRecognizer
{
    [self setExpand:!expanded withAnimation:true];
}



- (void)handleStartTap:(UITapGestureRecognizer *)gestureRecognizer
{
    //do something
}

-(void)setExpand:(BOOL)open withAnimation:(BOOL) animate
{
    
    expanded = open;
    NSTimeInterval time = animate ? 0.25f : 0.01f;
    
    if(expanded){
        
        
        [self rotateImage:expandButton.imageView duration:time
                    curve:UIViewAnimationCurveEaseIn degrees:90];
        
        CGRect rect = expandedView.frame;
        CGRect correct = rect;
        rect.origin.y = 20;
        
        [expandedView setFrame:rect];
        
        expandedView.alpha = 0.0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];//lags the button animation a bit
        expandedView.alpha = 1.0;
        //expandedView.transform = CGAffineTransformMakeScale(1.0f, 3.0f);
        
        expandedView.frame = correct;
        [UIView commitAnimations];
        
        
        
    }else{
        
        [self rotateImage:expandButton.imageView duration:time
                    curve:UIViewAnimationCurveEaseIn degrees:0];
    }
    
    
    
    
    [expandedView setHidden:!expanded];
    
    
    [delegate cellDidChangeHeight:self];
    
    //animate hidden view
    
    
    
}

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}


-(CGFloat)getHeightRequired
{
    
    if(!expanded)
    {
        return headerView.frame.size.height;
    }else{
        return headerView.frame.size.height + expandedView.frame.size.height;
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
}
*/

@end
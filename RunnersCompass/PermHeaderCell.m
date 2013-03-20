//
//  CreateGoalHeaderCell.m
//  RunnersCompass
//
//  Created by Geoff MacDonald on 2013-02-24.
//  Copyright (c) 2013 Geoff MacDonald. All rights reserved.
//

#import "PermHeaderCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation PermHeaderCell

@synthesize doneBut,weeklyBut,monthlyBut,predictBut;

-(void) setup
{
    
    //set rounded corners on button
    [doneBut.layer setCornerRadius:8.0f];
    [predictBut.layer setCornerRadius:8.0f];
    
    //localized buttons in IB
    [predictBut setTitle:NSLocalizedString(@"PredictButtonTitle", @"button for prediction view") forState:UIControlStateNormal];
    [weeklyBut setTitle:NSLocalizedString(@"WeeklyButton", @"button for weekly") forState:UIControlStateNormal];
    [monthlyBut setTitle:NSLocalizedString(@"MonthlyButton", @"button for monthly") forState:UIControlStateNormal];
    [doneBut setTitle:NSLocalizedString(@"DoneButton", @"done button") forState:UIControlStateNormal];
}


@end

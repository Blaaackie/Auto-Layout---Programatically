//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;
@property (nonatomic, weak) UIView *purpleBox;
@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) UIView *redBox;
@property (nonatomic, weak) UIView *orangeBoxRight;
@property (nonatomic, weak) UIView *orangeBoxLeft;
@property (nonatomic, weak) UIView *topBlueBox;
@property (nonatomic, weak) UIView *middleBlueBox;
@property (nonatomic, weak) UIView *bottomBlueBox;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;
//@property (nonatomic, weak) NSLayoutConstraint *rightConstraint;
//@property (nonatomic, weak) NSLayoutConstraint *topConstraint;
//@property (nonatomic, weak) NSLayoutConstraint *leftConstraint;
//@property (nonatomic, weak) NSLayoutConstraint *bottomConstraint;


@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [_framingView addSubview:purpleBox];
    self.purpleBox = purpleBox;
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [_framingView addSubview:redBox];
    self.redBox = redBox;
    
    UIView *orangeBoxLeft = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBoxLeft.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxLeft.backgroundColor = [UIColor orangeColor];
    [_redBox addSubview:orangeBoxLeft];
    self.orangeBoxLeft = orangeBoxLeft;
    
    UIView *orangeBoxRight = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBoxRight.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxRight.backgroundColor = [UIColor orangeColor];
    [_redBox addSubview:orangeBoxRight];
    self.orangeBoxRight = orangeBoxRight;
    
    UIView *topBlueBox = [[UIView alloc] initWithFrame:CGRectZero];
    topBlueBox.translatesAutoresizingMaskIntoConstraints = NO;
    topBlueBox.backgroundColor = [UIColor blueColor];
    [_framingView addSubview:topBlueBox];
    self.topBlueBox = topBlueBox;
    
    UIView *middleBlueBox = [[UIView alloc] initWithFrame:CGRectZero];
    middleBlueBox.translatesAutoresizingMaskIntoConstraints = NO;
    middleBlueBox.backgroundColor = [UIColor blueColor];
    [_framingView addSubview:middleBlueBox];
    self.middleBlueBox = middleBlueBox;
    
    UIView *bottomBlueBox = [[UIView alloc] initWithFrame:CGRectZero];
    bottomBlueBox.translatesAutoresizingMaskIntoConstraints = NO;
    bottomBlueBox.backgroundColor = [UIColor blueColor];
    [_framingView addSubview:bottomBlueBox];
    self.bottomBlueBox = bottomBlueBox;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
//FRAMING VIEW
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
// PURPLE BOX
   NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:(305.0/500.0)
                                                                        constant:0.0];
    leftConstraint.active = YES;

    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:-20.0];
    rightConstraint.active = YES;
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:50.0];
    topConstraint.active = YES;

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.purpleBox
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.framingView
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:-20.0];
    bottomConstraint.active = YES;
    
        
     
//RED BOX

    NSLayoutConstraint *redBoxleftConstraint = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1.0
                                                                       constant:150.0];
    redBoxleftConstraint.active = YES;
    
    
    NSLayoutConstraint *redBoxrightConstraint = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:-20.0];
    redBoxrightConstraint.active = YES;
    
    NSLayoutConstraint *redBoxtopConstraint = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.framingView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:20.0];
    redBoxtopConstraint.active = YES;
    
    NSLayoutConstraint *redBoxbottomConstraint = [NSLayoutConstraint constraintWithItem:self.redBox
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:50.0];
    redBoxbottomConstraint.active = YES;
    
//ORANGE BOX LEFT
    
    
    NSLayoutConstraint *orangeBoxLeftLeftConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxLeft
                                                                            attribute:NSLayoutAttributeLeft
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.redBox
                                                                            attribute:NSLayoutAttributeLeft
                                                                           multiplier:1.0
                                                                             constant:10.0];
    orangeBoxLeftLeftConstraint.active = YES;
    
    
    NSLayoutConstraint *orangeBoxLeftRightConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxLeft
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1.0
                                                                              constant:70.0];
    orangeBoxLeftRightConstraint.active = YES;
    
    NSLayoutConstraint *orangeBoxLeftTopConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxLeft
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.redBox
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:10.0];
    orangeBoxLeftTopConstraint.active = YES;
    
    NSLayoutConstraint *orangeBoxLeftBottomConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxLeft
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:30.0];
    orangeBoxLeftBottomConstraint.active = YES;

//ORANGE BOX RIGHT
    
    
    NSLayoutConstraint *orangeBoxRightLeftConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxRight
                                                                                   attribute:NSLayoutAttributeWidth
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:50.0];
    orangeBoxRightLeftConstraint.active = YES;
    
    
    NSLayoutConstraint *orangeBoxRightRightConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxRight
                                                                                    attribute:NSLayoutAttributeRight
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.redBox
                                                                                    attribute:NSLayoutAttributeRight
                                                                                   multiplier:1.0
                                                                                     constant:-10.0];
    orangeBoxRightRightConstraint.active = YES;
    
    NSLayoutConstraint *orangeBoxRightTopConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxRight
                                                                                  attribute:NSLayoutAttributeTop
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.redBox
                                                                                  attribute:NSLayoutAttributeTop
                                                                                 multiplier:1.0
                                                                                   constant:10.0];
    orangeBoxRightTopConstraint.active = YES;
    
    NSLayoutConstraint *orangeBoxRightBottomConstraint = [NSLayoutConstraint constraintWithItem:self.orangeBoxRight
                                                                                     attribute:NSLayoutAttributeHeight
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:nil
                                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                                    multiplier:1.0
                                                                                      constant:30.0];
    orangeBoxRightBottomConstraint.active = YES;
    
//TOP BLUE BOX
   
    
    NSLayoutConstraint *topBlueBoxLeftConstraint = [NSLayoutConstraint constraintWithItem:self.topBlueBox
                                                                                    attribute:NSLayoutAttributeWidth
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:nil
                                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                                   multiplier:1.0
                                                                                     constant:50.0];
    topBlueBoxLeftConstraint.active = YES;
    
    
    NSLayoutConstraint *topBlueBoxRightConstraint = [NSLayoutConstraint constraintWithItem:self.topBlueBox
                                                                                     attribute:NSLayoutAttributeCenterX
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.framingView
                                                                                     attribute:NSLayoutAttributeCenterX
                                                                                    multiplier:1.0
                                                                                      constant:0.0];
    topBlueBoxRightConstraint.active = YES;
    
    NSLayoutConstraint *topBlueBoxTopConstraint = [NSLayoutConstraint constraintWithItem:self.topBlueBox
                                                                                   attribute:NSLayoutAttributeCenterY
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.framingView
                                                                                   attribute:NSLayoutAttributeCenterY
                                                                                  multiplier:0.5
                                                                                    constant:1.0];
    topBlueBoxTopConstraint.active = YES;
    
    NSLayoutConstraint *topBlueBoxBottomConstraint = [NSLayoutConstraint constraintWithItem:self.topBlueBox
                                                                                      attribute:NSLayoutAttributeHeight
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:nil
                                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                                     multiplier:1.0
                                                                                       constant:50.0];
    topBlueBoxBottomConstraint.active = YES;
    
    
    
    
    
//MIDDLE BLUE BOX
    
    NSLayoutConstraint *middleBlueBoxLeftConstraint = [NSLayoutConstraint constraintWithItem:self.middleBlueBox
                                                                                attribute:NSLayoutAttributeWidth
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier:1.0
                                                                                 constant:50.0];
    middleBlueBoxLeftConstraint.active = YES;
    
    
    NSLayoutConstraint *middleBlueBoxRightConstraint = [NSLayoutConstraint constraintWithItem:self.middleBlueBox
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.framingView
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                multiplier:1.0
                                                                                  constant:0.0];
    middleBlueBoxRightConstraint.active = YES;
    
    NSLayoutConstraint *middleBlueBoxTopConstraint = [NSLayoutConstraint constraintWithItem:self.middleBlueBox
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.framingView
                                                                               attribute:NSLayoutAttributeCenterY
                                                                              multiplier:1.0
                                                                                constant:1.0];
    middleBlueBoxTopConstraint.active = YES;
    
    NSLayoutConstraint *middleBlueBoxBottomConstraint = [NSLayoutConstraint constraintWithItem:self.middleBlueBox
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:50.0];
    middleBlueBoxBottomConstraint.active = YES;
    

    
    
//BOTTOM BLUE BOX
    
    NSLayoutConstraint *bottomBlueBoxLeftConstraint = [NSLayoutConstraint constraintWithItem:self.bottomBlueBox
                                                                                   attribute:NSLayoutAttributeWidth
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:50.0];
    bottomBlueBoxLeftConstraint.active = YES;
    
    
    NSLayoutConstraint *bottomBlueBoxRightConstraint = [NSLayoutConstraint constraintWithItem:self.bottomBlueBox
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    bottomBlueBoxRightConstraint.active = YES;
    
    NSLayoutConstraint *bottomBlueBoxTopConstraint = [NSLayoutConstraint constraintWithItem:self.bottomBlueBox
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.framingView
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                 multiplier:1.5
                                                                                   constant:1.0];
    bottomBlueBoxTopConstraint.active = YES;
    
    NSLayoutConstraint *bottomBlueBoxBottomConstraint = [NSLayoutConstraint constraintWithItem:self.bottomBlueBox
                                                                                     attribute:NSLayoutAttributeHeight
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:nil
                                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                                    multiplier:1.0
                                                                                      constant:50.0];
    bottomBlueBoxBottomConstraint.active = YES;
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end

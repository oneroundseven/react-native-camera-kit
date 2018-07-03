//
//  CKOverlayObject.m
//  ReactNativeCameraKit
//
//  Created by Ran Greenberg on 17/07/2016.
//  Copyright © 2016 Wix. All rights reserved.
//

#import "CKOverlayObject.h"

@interface CKOverlayObject ()

@property (nonatomic, readwrite) float width;
@property (nonatomic, readwrite) float height;
@property (nonatomic, readwrite) float ratio;

@property (nonatomic, readwrite) float topHeight;
@property (nonatomic, readwrite) float bottomHeight;

@end

@implementation CKOverlayObject

-(instancetype)initWithString:(NSString*)str {
    
    self = [super init];
    
    if (self) {
        [self commonInit:str];
    }
    
    return self;
}

-(void)commonInit:(NSString*)str {
    
    NSArray<NSString*> *array = [str componentsSeparatedByString:@":"];
    if (array.count == 2) {
        float height = [array[0] floatValue];
        float width = [array[1] floatValue];
        
        if (width != 0 && height != 0) {
            self.width = width;
            self.height = height;
            self.ratio = self.width/self.height;
        }
    }
    
    if (array.count == 4) {
        float height = [array[0] floatValue];
        float width = [array[1] floatValue];
        
        self.topHeight = [array[2] floatValue];
        self.bottomHeight = [array[3] floatValue];
        
        if (width != 0 && height != 0) {
            self.width = width;
            self.height = height;
            self.ratio = self.width/self.height;
        }
    }
}

-(NSString *)description {
    return [NSString stringWithFormat:@"width:%f height:%f ratio:%f", self.width, self.height, self.ratio];
}


@end

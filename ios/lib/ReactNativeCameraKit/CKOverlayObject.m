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

@property (nonatomic, readwrite) BOOL isCustomOverlayHeight;

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
    
    self.isCustomOverlayHeight = [str hasPrefix:@"@"];
    if (self.isCustomOverlayHeight) {
        str = [str substringFromIndex:1];
    }
    
    NSArray<NSString*> *array = [str componentsSeparatedByString:@":"];
    if (array.count == 2) {
        if (self.isCustomOverlayHeight) {
            
            self.topHeight = [array[0] floatValue];
            self.bottomHeight = [array[1] floatValue];
            
        } else {
            
            float height = [array[0] floatValue];
            float width = [array[1] floatValue];
            
            if (width != 0 && height != 0) {
                self.width = width;
                self.height = height;
                self.ratio = self.width/self.height;
            }
        }
    }
}

-(NSString *)description {
    return [NSString stringWithFormat:@"width:%f height:%f ratio:%f topHeight:%f bottomHeight:%f", self.width, self.height, self.ratio, self.topHeight, self.bottomHeight];
}


@end

//
// Copyright (c) 2014 Zhuge. All rights reserved.

#import "ZGValueTransformers.h"

@implementation ZGCGColorRefToNSStringValueTransformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

- (id)transformedValue:(id)value
{
    if (value && CFGetTypeID((__bridge CFTypeRef)value) == CGColorGetTypeID()) {
        NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:@"ZGUIColorToNSStringValueTransformer"];
        return [transformer transformedValue:[[UIColor alloc] initWithCGColor:(__bridge CGColorRef)value]];
    }

    return nil;
}

- (id)reverseTransformedValue:(id)value
{
    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:@"ZGUIColorToNSStringValueTransformer"];
    UIColor *uiColor =  [transformer reverseTransformedValue:value];
    return CFBridgingRelease(CGColorCreateCopy([uiColor CGColor]));
}

@end

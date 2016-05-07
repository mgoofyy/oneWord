//
//  UIImageView+GFCornerRadius.m
//  oneWord
//
//  Created by goofygao on 5/7/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "UIImageView+GFCornerRadius.h"
#import <objc/runtime.h>


@interface UIImage (cornerRadius)

@property (nonatomic, assign) BOOL aliCornerRadius;

@end

@implementation UIImage (cornerRadius)

- (BOOL)aliCornerRadius {
    return [objc_getAssociatedObject(self, @selector(aliCornerRadius)) boolValue];
}

- (void)setAliCornerRadius:(BOOL)aliCornerRadius {
    objc_setAssociatedObject(self, @selector(aliCornerRadius), @(aliCornerRadius), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

@interface GFObserver : NSObject

@property (nonatomic, assign) UIImageView *imageView;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImageView:(UIImageView *)imageView;

@end

@implementation GFObserver

#pragma mark initWith
- (instancetype)initWithImageView:(UIImageView *)imageView {
    if (self = [super init]) {
        self.imageView = imageView;
        [imageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

#pragma mark  - setter - getter
- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius == cornerRadius) {
        return;
    }
    _cornerRadius = cornerRadius;
    if (cornerRadius > 0) {
        [self sloveWithImageView];
    }
    
}

#pragma mark - overwrite
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[@"new"];
        if (![newImage isKindOfClass:[UIImage class]]  || newImage.aliCornerRadius ) {
            return;
        }
        [self sloveWithImageView];
    }
   
}

- (void)dealloc {
    [self.imageView removeObserver:self forKeyPath:@"image"];
}

#pragma mark - custom function
- (void)sloveWithImageView {
    self.image = self.imageView.image;
    if (!self.image) {
        return;
    }
    UIImage *newImage = nil;
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    if (currnetContext) {
        CGContextAddPath(currnetContext, [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds cornerRadius:self.cornerRadius].CGPath);
        CGContextClip(currnetContext);
        [self.imageView.layer renderInContext:currnetContext];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if ([newImage isKindOfClass:[UIImage class]]) {
        newImage.aliCornerRadius = YES;
        self.imageView.image = newImage;
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sloveWithImageView];
        });
    }
}

@end

@implementation UIImageView (GFCornerRadius)

- (CGFloat)cornerRadius {
    return [self observer].cornerRadius;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    [self observer].cornerRadius = cornerRadius;
}

- (GFObserver *)observer {
    GFObserver *observer = objc_getAssociatedObject(self, @selector(observer));
    if (!observer) {
        observer = [[GFObserver alloc]initWithImageView:self];
        objc_setAssociatedObject(self, @selector(observer), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return observer;
}

@end

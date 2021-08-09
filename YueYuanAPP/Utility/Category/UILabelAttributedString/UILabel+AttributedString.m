//
//  UILabel+AttributedString.m
//  Testee
//
//  Created by xuliying on 16/11/14.
//  Copyright © 2016年 xly. All rights reserved.
//

#import "UILabel+AttributedString.h"
#import "NSMutableAttributedString+Addtion.h"
#import "NSObject+Addition.h"
@implementation UILabel (AttributedString)

-(void)set_TextColor:(UIColor *)color range:(NSRange)range{
    if (self.attributedText.isNoEmpty && color) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr setTextColor:color range:range];
        self.attributedText = attStr;
    }
}
-(void)set_TextFont:(UIFont *)font range:(NSRange)range{
    if (self.attributedText.isNoEmpty && font) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr setTextFont:font range:range];
        self.attributedText = attStr;
    }
}

-(void)set_DesignatedText:(NSString *)text color:(UIColor *)color{
    if (self.attributedText.isNoEmpty && text.isNoEmpty && color) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr setDesignatedText:text color:color];
        self.attributedText = attStr;
    }
}
-(void)set_DesignatedText:(NSString *)text font:(UIFont *)font{
    if (self.attributedText.isNoEmpty && text.isNoEmpty && font) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr setDesignatedText:text font:font];
        self.attributedText = attStr;
    }
}

-(void)set_addAttributeText:(NSString *)text range:(NSRange)range{
    if (self.attributedText.isNoEmpty && text.isNoEmpty) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
        self.attributedText = attStr;
    }
}


-(void)set_DesignatedTexts:(NSArray *)array color:(UIColor *)color{
    if (self.attributedText.isNoEmpty && array.isNoEmpty && color) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr setDesignatedTexts:array color:color];
        self.attributedText = attStr;
    }
}
-(void)set_DesignatedTexts:(NSArray *)array font:(UIFont *)font{
    if (self.attributedText.isNoEmpty && array.isNoEmpty && font) {
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attStr setDesignatedTexts:array font:font];
        self.attributedText = attStr;
    }
}

- (void)creatRichTextWithText: (NSString *)text
                        frame: (CGRect)frame
                         font: (UIFont *)font
                    imageName: (NSString *)imageName
                     maxWidth: (CGFloat)maxWidth  {

//    if (text.length == 0) {
//        return;
//    }
    text = [NSString stringWithFormat:@"%@ ",text];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:text];

    [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    UIImage *image = [UIImage imageNamed:imageName];
  
    self.numberOfLines = 0;
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;

    NSTextAttachment *attach = [[NSTextAttachment alloc]init];
    attach.image = image;
    attach.bounds = CGRectMake(0, 0, 10, 6);
    NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:attach];
    self.attach = attach;
    
    [attString insertAttributedString:str atIndex:attString.length];
    
    self.attributedText = attString;
    self.lineBreakMode = NSLineBreakByTruncatingMiddle;
    
    CGFloat labelWidth = (ceil(size.width) + 10) > maxWidth ? maxWidth - 10 :ceil(size.width) + 10;
    if (labelWidth > maxWidth) {
        labelWidth = labelWidth - 10;
    }
    self.frame = CGRectMake((maxWidth -labelWidth) * 0.5, 0, labelWidth , frame.size.height);
}

- (void)setAttach:(NSTextAttachment *)attach {
    objc_setAssociatedObject(self, @selector(attach), attach, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

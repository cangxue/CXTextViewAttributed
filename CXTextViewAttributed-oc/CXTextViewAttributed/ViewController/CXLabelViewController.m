//
//  CXLabelViewController.m
//  CXTextViewAttributed
//
//  Created by xiaoma on 17/5/24.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXLabelViewController.h"
#import "CXLabel.h"

@interface CXLabelViewController ()

@property (strong, nonatomic) CXLabel *cx_label;

@end

@implementation CXLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cx_label = [[CXLabel alloc] initWithFrame:CGRectMake(12, 64 + 12, self.view.frame.size.width - 24, self.view.frame.size.height - 24)];
    _cx_label.numberOfLines = 0;
    
    [self.view addSubview:_cx_label];
    
    [self setLabelAttributed];
    
}

- (void)setLabelAttributed {
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:[self labelContent]];
    //字体
    [attributed addAttribute:NSFontAttributeName value:[self setFont] range:[[self labelContent] rangeOfString:@"春天"]];
    //段落
    [attributed addAttribute:NSParagraphStyleAttributeName value:[self setParagraph] range:NSMakeRange(0, [self labelContent].length)];
    //颜色
    [attributed addAttribute:NSForegroundColorAttributeName value:[self setColor] range:NSMakeRange(3, 10)];
    [attributed addAttribute:NSBackgroundColorAttributeName value:[self setColor] range:NSMakeRange(20, 10)];
    
    //连字符
    [attributed addAttribute:NSLigatureAttributeName value:@(1) range:NSMakeRange(11, 3)];
    
    //字间距
    [attributed addAttribute:NSKernAttributeName value:@(16) range:NSMakeRange(11, 10)];
    
    //删除线
    /*
     NSUnderlineStyleNone 不设置删除线
     NSUnderlineStyleSingle 设置删除线为细单实线
     NSUnderlineStyleThick 设置删除线为粗单实线
     NSUnderlineStyleDouble 设置删除线为细双实线
     */
    [attributed addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleDouble) range:NSMakeRange(21, 10)];
    //删除线颜色
    [attributed addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(21, 10)];
    
    
    //下划线
    [attributed addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleThick) range:NSMakeRange(31, 10)];
    [attributed addAttribute:NSUnderlineColorAttributeName value:[UIColor blueColor] range:NSMakeRange(31, 10)];
    
    //边线
    [attributed addAttribute:NSStrokeWidthAttributeName value:@(2) range:NSMakeRange(41, 10)];
    [attributed addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(41, 10)];
    
    //阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blueColor];
    shadow.shadowBlurRadius = 4;
    shadow.shadowOffset = CGSizeMake(1, 3);
    [attributed addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(100, 20)];
    
    //横竖排版:0 表示横排文本。1 表示竖排文本。
    [attributed addAttribute:NSVerticalGlyphFormAttributeName value:@(0) range:NSMakeRange(100, 20)];
    
    //字体倾斜
    [attributed addAttribute:NSObliquenessAttributeName value:@(1) range:NSMakeRange(100, 20)];
    
    //文本扁平化
    [attributed addAttribute:NSExpansionAttributeName value:@(1) range:NSMakeRange(100, 20)];
    
    _cx_label.attributedText = attributed;
    
}

//字体
- (UIFont *)setFont {
    UIFont *font = [UIFont systemFontOfSize:24 weight:12];
    
    return font;
}

//段落－行间距/段间距/缩进
- (NSMutableParagraphStyle *)setParagraph {
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraph.lineSpacing = 8;
    //段落间距
    paragraph.paragraphSpacing = 12;
    //首行缩紧
    paragraph.firstLineHeadIndent = 32;
    
    return paragraph;
}

//字体颜色
- (UIColor *)setColor {
    UIColor *color = [UIColor greenColor];
    [color colorWithAlphaComponent:0.5];
    
    return color;
}

//NSNumber
- (NSNumber *)setNumber {
    return [NSNumber numberWithInt:1];
}

- (NSString *)labelContent {
    return  @"春天，我把茉莉来拥抱。那阵阵的茉莉花香，让春天的时光醉人心田。茉莉花开，香满园。微笑着，走在茉莉花丛中，闻着淡淡的花香，心中泛起几许柔情。茉莉，娇美嫩白，花香四溢，让春天增添几分美丽动人的景致。饱满的茉莉，像婴儿的胖嘟嘟的拳头，在春风中可爱地轻舞。\n 茉莉，是春天独特的风景，是时光里一份爱的旋律。穿着白色的衣裙，踏着高跟鞋，在茉莉盛开的时光里轻舞飞扬，青春的活力，美妙的春光，曼妙的舞姿，组成人生美丽的风景线。时光，穿过春天的花香，在柔情似水的心中荡漾着奇妙的感觉。春情融融，春色阑珊，时光轻轻，将花香点缀。\n 夏季，田田的荷叶，簇拥着粉嫩的荷花，在纷纷扬扬的雨丝里痛快的洗个清爽的澡，在清凉的夏风里点头哈腰。夏光明媚，照耀着满池的荷花。雨后，晶莹的露珠散落在翠绿的荷叶上，像一个个圆形的钻石，分散在荷叶的各处，闪闪发亮。荷叶随风轻轻摇摆，像仙女的衣裙，飘荡着绿色的光华。\n有的荷花含苞待放，像豆蔻少女，看见喜欢的少年，红了半边脸，羞涩地躲在暗处，不敢直视少年的眼睛。有的荷花凝脂粉白，白中透红，像下凡到荷塘里沐浴的仙女，每一个动作，都像在水中舞蹈。时光，在淡淡的荷香中盈满了慢节奏的妩媚，绽放蜂飞蝶舞的缠绵。时光轻漫，若盛开在整个夏天的荷花，每一天都芳香依旧。";
}


/************************ Attributes ***********************

// Predefined character attributes for text. If the key is not in the dictionary, then use the default values as described below.
UIKIT_EXTERN NSString * const NSFontAttributeName NS_AVAILABLE(10_0, 6_0);                // UIFont, default Helvetica(Neue) 12
UIKIT_EXTERN NSString * const NSParagraphStyleAttributeName NS_AVAILABLE(10_0, 6_0);      // NSParagraphStyle, default defaultParagraphStyle
UIKIT_EXTERN NSString * const NSForegroundColorAttributeName NS_AVAILABLE(10_0, 6_0);     // UIColor, default blackColor
UIKIT_EXTERN NSString * const NSBackgroundColorAttributeName NS_AVAILABLE(10_0, 6_0);     // UIColor, default nil: no background
UIKIT_EXTERN NSString * const NSLigatureAttributeName NS_AVAILABLE(10_0, 6_0);            // NSNumber containing integer, default 1: default ligatures, 0: no ligatures
UIKIT_EXTERN NSString * const NSKernAttributeName NS_AVAILABLE(10_0, 6_0);                // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled.
UIKIT_EXTERN NSString * const NSStrikethroughStyleAttributeName NS_AVAILABLE(10_0, 6_0);  // NSNumber containing integer, default 0: no strikethrough
UIKIT_EXTERN NSString * const NSUnderlineStyleAttributeName NS_AVAILABLE(10_0, 6_0);      // NSNumber containing integer, default 0: no underline
UIKIT_EXTERN NSString * const NSStrokeColorAttributeName NS_AVAILABLE(10_0, 6_0);         // UIColor, default nil: same as foreground color
UIKIT_EXTERN NSString * const NSStrokeWidthAttributeName NS_AVAILABLE(10_0, 6_0);         // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
UIKIT_EXTERN NSString * const NSShadowAttributeName NS_AVAILABLE(10_0, 6_0);              // NSShadow, default nil: no shadow
UIKIT_EXTERN NSString *const NSTextEffectAttributeName NS_AVAILABLE(10_10, 7_0);          // NSString, default nil: no text effect

UIKIT_EXTERN NSString * const NSAttachmentAttributeName NS_AVAILABLE(10_0, 7_0);          // NSTextAttachment, default nil
UIKIT_EXTERN NSString * const NSLinkAttributeName NS_AVAILABLE(10_0, 7_0);                // NSURL (preferred) or NSString
UIKIT_EXTERN NSString * const NSBaselineOffsetAttributeName NS_AVAILABLE(10_0, 7_0);      // NSNumber containing floating point value, in points; offset from baseline, default 0
UIKIT_EXTERN NSString * const NSUnderlineColorAttributeName NS_AVAILABLE(10_0, 7_0);      // UIColor, default nil: same as foreground color
UIKIT_EXTERN NSString * const NSStrikethroughColorAttributeName NS_AVAILABLE(10_0, 7_0);  // UIColor, default nil: same as foreground color
UIKIT_EXTERN NSString * const NSObliquenessAttributeName NS_AVAILABLE(10_0, 7_0);         // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
UIKIT_EXTERN NSString * const NSExpansionAttributeName NS_AVAILABLE(10_0, 7_0);           // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion

UIKIT_EXTERN NSString * const NSWritingDirectionAttributeName NS_AVAILABLE(10_6, 7_0);    // NSArray of NSNumbers representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.  The control characters can be obtained by masking NSWritingDirection and NSWritingDirectionFormatType values.  LRE: NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding, RLE: NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding, LRO: NSWritingDirectionLeftToRight|NSWritingDirectionOverride, RLO: NSWritingDirectionRightToLeft|NSWritingDirectionOverride,

UIKIT_EXTERN NSString * const NSVerticalGlyphFormAttributeName NS_AVAILABLE(10_7, 6_0);   // An NSNumber containing an integer value.  0 means horizontal text.  1 indicates vertical text.  If not specified, it could follow higher-level vertical orientation settings.  Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.


 */
@end

//
//  TuWanBaseModel.h
//  BaseProject
//
//  Created by ios－04 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@class TuWanDataModel,TuWanDataIndexpic,TuWanDataIndexpicInfochildModel,TuWanDataIndexpicShowitemModel,TuWanDataIndexpicShowitemInfoModel,List,Infochild,Showitem,Info;
@interface TuWanBaseModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TuWanDataModel *data;

@property (nonatomic, copy) NSString *code;
@end



@interface TuWanDataModel : BaseModel

@property (nonatomic, strong) NSArray<TuWanDataIndexpic *> *indexpic;

@property (nonatomic, strong) NSArray<List *> *list;

@end

@interface TuWanDataIndexpic : BaseModel

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName; //typename

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) TuWanDataIndexpicInfochildModel *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<TuWanDataIndexpicShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *desc; //description

@end

@interface TuWanDataIndexpicInfochildModel : BaseModel

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface TuWanDataIndexpicShowitemModel : BaseModel

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) TuWanDataIndexpicShowitemInfoModel *info;

@end

@interface TuWanDataIndexpicShowitemInfoModel : BaseModel

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end


/**
 @class TuWanDataModel,TuWanDataIndexpicInfoChildModel,TuWanDataIndexpicShowitemInfoModel;
 @interface TuWanBaseModel : NSObject
 @property (nonatomic,strong)  NSNumber *code;
 @property (nonatomic,strong)  TuWanDataModel *data;
 @property (nonatomic,strong)  NSString *msg;
 @end
 
 @interface TuWanDataModel : TuWanBaseModel
 @property (nonatomic,strong)  NSArray *indexpic;
 @property (nonatomic,strong)  NSArray *list;
 @end
 //aid": "221035",
 //"banner": "true",
 //"click": "7838",
 //"color": "",
 //"comment": "1",
 //"description": "初音旗袍",
 //"html5": "http://cache.tuwan.com/app/?class=html5&appid=1&aid=221035",
 
 //"litpic": "http://imgcache.tuwandata.com/v2/thumb/all/Mzk5Nyw3NTAsMzYwLDQsMywxLC0xLE5PTkUs/u/www.tuwan.com/uploads/1510/29/793-1510291F1563b.jpg",
 //"longtitle": "初音旗袍",
 //"murl": "http://m.tuwan.com/view/221035/",
 //"pictotal": 9,
 //"pubdate": "2015-10-29",
 
 
 //"showtype": "1",
 //"source": "未知",
 //"timer": null,
 //"timestamp": "1446110633",
 //"title": "初音旗袍",
 //"toutiao": null,
 //"type": "pic",
 //"typechild": "cos",
 //"typename": "",
 //"url": "http://www.tuwan.com/view/221035/",
 //"writer": "兔玩网",
 //"zangs": "16"
 @interface TuWanDataIndexpicModel :TuWanBaseModel
 @property (nonatomic,strong)  NSString *aid;
 @property (nonatomic,strong)  NSString *banner;
 @property (nonatomic,strong)  NSString *click;
 @property (nonatomic,strong)  NSString *color;
 @property (nonatomic,strong)  NSString *comment;
 @property (nonatomic,strong)  NSString *description;
 @property (nonatomic,strong)  NSString *html5;
 @property (nonatomic,strong)  TuWanDataIndexpicInfoChildModel *infochild;
 @property (nonatomic,strong)  NSString *litpic;
 @property (nonatomic,strong)  NSString *longtitle;
 @property (nonatomic,strong)  NSString *murl;
 @property (nonatomic,strong)  NSString *pubdate;
 @property (nonatomic,strong)  NSNumber *pictotal;
 @property (nonatomic,strong)  NSArray *showitem;
 
 @property (nonatomic,strong)  NSString *showtype;
 @property (nonatomic,strong)  NSString *source;
 @property (nonatomic,strong)  NSString *timer;
 @property (nonatomic,strong)  NSString *timestamp;
 @property (nonatomic,strong)  NSString *typechild;
 @property (nonatomic,strong)  NSString *title;
 @property (nonatomic,strong)  NSString *type;
 @property (nonatomic,strong)  NSString *typeName; //typename
 @property (nonatomic,strong)  NSString *url;
 @property (nonatomic,strong)  NSString *writer;
 @property (nonatomic,strong)  NSString *zangs;
 @property (nonatomic,strong)  NSString *toutiao;
 
 @end
 //"cn": null,
 //"facial": null,
 //"feature": null,
 //"later": null,
 //"role": null,
 //"shoot": null
 
 @interface TuWanDataIndexpicInfoChildModel :TuWanBaseModel
 @property (nonatomic,strong)  NSString *cn;
 @property (nonatomic,strong)  NSString *facial;
 @property (nonatomic,strong)  NSString *feature;
 @property (nonatomic,strong)  NSString *later;
 @property (nonatomic,strong)  NSString *role;
 @property (nonatomic,strong)  NSString *shoot;
 @end
 @interface TuWanDataIndexpicShowitemModel :TuWanBaseModel
 @property (nonatomic,strong)  TuWanDataIndexpicShowitemInfoModel *info;
 @property (nonatomic,strong)  NSString *pic;
 @property (nonatomic,strong)  NSString *text;
 @end
 
 @interface TuWanDataIndexpicShowitemInfoModel :TuWanBaseModel
 @property (nonatomic,assign)  double height;
 @property (nonatomic,assign)  double width;
 @end
 
 @interface TuWanDataListModel :TuWanBaseModel
 
 */



























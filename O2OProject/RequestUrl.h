//
//  RequestUrl.h
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h
/**
 *  个人信息
 */
#define BaseUrl                      @"http://menu.life/index.php?g=Index&c=App&a="

#define RequestRegisterUrl           @"doReg"

#define RequestLoginUrl              @"doLogin"

#define RequestChangePasswordnUrl    @"doPwdChange"

#define RequestMessageUrl            @"mapi/index.php?i_type=0&r_type=1&ctl=sms&act=send_sms_code"

//地址CDRF
#define RequestAddressUrl            @"getAdress"

#define RequestSaveAddressUrl         @"mapi/index.php?i_type=0&r_type=1&ctl=uc_address&act=save"

#define RequestDelAddressUrl         @"mapi/index.php?i_type=0&r_type=1&ctl=uc_address&act=del"

#define RequestNomalAddressUrl         @"mapi/index.php?i_type=0&r_type=1&ctl=uc_address&act=save"

#define RequestProfileUrl             @"mapi/index.php?i_type=0&r_type=1&ctl=user_center&act=index"

//首页
#define RequestHomeUrl                @"mapi/index.php?i_type=0&r_type=1&ctl=index&act=index"

#define RequestCityUrl                @"mapi/index.php?i_type=0&r_type=1&ctl=city&act=index"

#define RequestStoreUrl                @"/mapi/index.php?i_type=0&r_type=1&ctl=stores&act=index"

#define RequestStoreInfoUrl            @"mapi/index.php?i_type=0&r_type=1&ctl=store&act=index"
//会员收藏
#define RequestCollectUrl             @"mapi/index.php?i_type=0&r_type=1&ctl=uc_collect&act=index"

//商店
#define RequestGetShopUrl    @"http://115.28.35.2/apingtai/index.php/Admin/App/getShop/"

#endif /* RequestUrl_h */

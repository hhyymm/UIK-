//
//  Defines.h
//  SQT
//
//  Created by joojee on 15/3/24.
//  Copyright (c) 2015年 joojee. All rights reserved.
//

#ifndef SQT_Defines_h
#define SQT_Defines_h
//#import "NSString+Encryption.h"
#import "AFNetworking.h"
//#import "MBProgressHUD.h"
//#import "TTGlobalUICommon.h"
//#import "EMChatManagerDefs.h"
//#import "UIViewController+HUD.h"
#pragma mark - URL

//判断是debug版，还是release版
#ifdef DEBUG
#define isDebug true
#else
#define isDebug false
#endif

//控制NSLog的输出
//#ifdef DEBUG
//#define DNSLog(...) NSLog(__VA_ARGS__);
//#define DNSLog_METHOD NSLog(@"%s", __func__);
//#else
//#define DNSLog(...); #define DNSLog_METHOD;
//#endif
#ifdef DEBUG
#define DNSLog(...) NSLog(__VA_ARGS__);
#define DNSLog_METHOD NSLog(@"%s", __func__);
#else
#define DNSLog(...); 
#define DNSLog_METHOD;
#endif
//测试环境(金三)
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//#define BASE_URL @"http://192.168.1.168:82"
//#define BASE_SLQ_URL  @"http://192.168.1.160:7001"
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT


//测试环境(预约服务外网)
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//#define BASE_URL @"http://59.175.197.194:1601"
//#define BASE_SLQ_URL  @"http://59.175.197.194:1600"
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT


//测试环境(预约服务)
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
#define BASE_URL @"http://192.168.1.90:88"
#define BASE_SLQ_URL  @"http://192.168.1.81:7001"
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

//开发环境(预约服务)
//#define DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//#define BASE_URL @"http://192.168.1.245:88"
//#define BASE_SLQ_URL @"http://192.168.1.236:7001"
//#define DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//开发环境
//#define DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//#define BASE_URL @"http://59.175.197.194:1900"
//#define BASE_SLQ_URL @"http://59.175.197.194:1901"
//#define DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//测试环境(外网)
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//#define BASE_URL @"http://59.175.197.194:1800"
//#define BASE_SLQ_URL  @"http://59.175.197.194:1801"
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

//测试环境(公司内网)
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//#define BASE_URL @"http://192.168.1.168:82"
//#define BASE_SLQ_URL  @"http://192.168.1.160:7001"
//#define TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

//生产环境
//#define PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
//#define BASE_URL @"http://120.24.68.73:82"
//#define BASE_SLQ_URL  @"http://www.whgs.gov.cn:55583"
//#define PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP


//云端HOST
#define URL_HOST [NSString stringWithFormat:@"%@/api",BASE_URL]
#define URL_HOST_L [NSString stringWithFormat:@"%@/api/l",BASE_URL]

//受理区HOST
#define URL_SLQ_HOST  [NSString stringWithFormat:@"%@/api",BASE_SLQ_URL]
#define URL_SLQ_HOST_L  [NSString stringWithFormat:@"%@/api/l",BASE_SLQ_URL]

//正确的返回码
#define corrertCode @"99999"
//登录
#define LoginURL [NSString stringWithFormat:@"%@/passport/login.json",URL_HOST]
//获取验证码
#define GetCodeURL [NSString stringWithFormat:@"%@/passport/get/authCode.json",URL_HOST]
//验证验证码
#define VerifyCodeURL [NSString stringWithFormat:@"%@/passport/auth/code.json",URL_HOST]
//注册
#define RegisterURL [NSString stringWithFormat:@"%@/passport/register.json",URL_HOST]
//重置密码
#define ForgetURL [NSString stringWithFormat:@"%@/passport/resetPwd.json",URL_HOST]
//验证用户类型
#define VerifyUserTypeURL [NSString stringWithFormat:@"%@/forward/get/verifyUserTypeByPhone.json",URL_SLQ_HOST_L]
//上传clientId
#define UploadClientId [NSString stringWithFormat:@"%@/forward/add/taxpayerClientId.json",URL_SLQ_HOST_L]
//获取头像和昵称
#define getUserAvatarAndNameByEasemobIdURL [NSString stringWithFormat:@"%@/friend/get/userAvatarAndNameByEaseomobId.json",URL_HOST_L]

#define ValidateInvoiceURL [NSString stringWithFormat:@"%@/forward/get/invoiceInfoByFpdm.json",URL_SLQ_HOST_L]

//广告页
//#define Advertising [NSString stringWithFormat:@"%@/extend/get/mobileWelcomeImage.json",URL_HOST]
#define Advertising [NSString stringWithFormat:@"%@/extend/get/mobileAdvertisement.json",URL_HOST]

/* 获取地区信息 */
//#define GetAreaListURL [NSString stringWithFormat:@"%@/businessHall/get/areaInfo.json",URL_HOST]

/* 获取包含地市州地区信息 */
#define GetAreaListURL [NSString stringWithFormat:@"%@/businessHall/get/newAreaInfo.json",URL_HOST]

//通知公告推送的json
#define AnnouncementsJson [NSString stringWithFormat:@"%@/forward/tzgg/get/jsonDetail.json",URL_SLQ_HOST_L]

//修改用户信息
#define ModifyUserMessageURL [NSString stringWithFormat:@"%@/user/update/userBasicInfo.json",URL_HOST_L]
//上传头像
#define UploadImageURL [NSString stringWithFormat:@"%@/user/update/avatar.json",URL_HOST_L]
//问题反馈
#define FeedBackURL [NSString stringWithFormat:@"%@/extend/add/questionFeedbackInfo.json",URL_HOST]
//登出
#define LogOutURL [NSString stringWithFormat:@"%@/user/logout.json",URL_HOST_L]
//修改密码
#define ModifyPWURL [NSString stringWithFormat:@"%@/user/modify/password.json",URL_HOST_L]
#define GetTaxOfficeListURL [NSString stringWithFormat:@"%@/forward/taxoffice/get/userAssociateTaxofficeList.json",URL_SLQ_HOST_L]
#define GetAssociateTaxpayerListURL [NSString stringWithFormat:@"%@/forward/get/userAssociateTaxpayerListRefresh.json",URL_SLQ_HOST_L]
#define GetCollectNumURL [NSString stringWithFormat:@"%@/policyRule/get/userCollectionList.json",URL_HOST]
#define GetCollectByRuleType [NSString stringWithFormat:@"%@/policyRule/get/userCollectionListByRuleType.json",URL_HOST]

////
//#define FindRuleURL [NSString stringWithFormat:@"%@/rules/infos",URL_SLQ_HOST_L]
#define Set_TaxOffice_Open_Status [NSString stringWithFormat:@"%@/forward/taxoffice/set/taxofficeOpenStatus.json",URL_SLQ_HOST_L]

#define GetLawListURL [NSString stringWithFormat:@"%@/policyRule/get/policyRuleList.json",URL_HOST]
#define GetLawDetailURL [NSString stringWithFormat:@"%@/policyRule/get/policyRuleDetail.json",URL_HOST]
#define GetHallURL [NSString stringWithFormat:@"%@/businessHall/get/businessHallMainMenu.json",URL_HOST]
//#define GetRuleMainMenuURL [NSString stringWithFormat:@"%@/policyRule/get/policyRuleMainMenu.json",URL_HOST]
#define GetRuleMainMenuURL [NSString stringWithFormat:@"%@/extend/get/recommendPageAds.json",URL_HOST]
#define AddCollectURL [NSString stringWithFormat:@"%@/policyRule/add/userCollection.json",URL_HOST]
#define DeleteCollectURL [NSString stringWithFormat:@"%@/policyRule/delete/userCollection.json",URL_HOST]
#define GetTaxTypeURL [NSString stringWithFormat:@"%@/businessHall/get/taxesInfo.json",URL_HOST]

#define GetContactListURL [NSString stringWithFormat:@"%@/friend/get/userFriendList.json",URL_HOST_L]
#define GetInnerContactListURL [NSString stringWithFormat:@"%@/forward/taxoffice/get/taxofficeContactParentTaxofficeList.json",URL_SLQ_HOST_L]
#define GetEnterpriseContactListURL [NSString stringWithFormat:@"%@/forward/get/taxpayerContactFriendList.json",URL_SLQ_HOST_L]
//非专管员获取权限税务机关列表及下辖的税源科信息
#define GetTaxOfficeParentListURL [NSString stringWithFormat:@"%@/forward/taxoffice/get/taxofficeParentList.json",URL_SLQ_HOST_L]
	/* 获取区局和科室下面的管理员列表 */
#define GetAdminURL [NSString stringWithFormat:@"%@/forward/taxoffice/get/adminByTaxofficeCode.json",URL_SLQ_HOST_L]

//删除申报表
#define DelDeclareListURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationDetailReInit.json",URL_SLQ_HOST_L]

#define GetRecommendContactsURL [NSString stringWithFormat:@"%@/forward/get/userRecommendTaxpayerContactFriendList.json",URL_SLQ_HOST_L]


#define GetUserDetailURL [NSString stringWithFormat:@"%@/forward/get/userDetailInfo.json",URL_SLQ_HOST_L]
#define GetRecommendOfficeListURL [NSString stringWithFormat:@"%@/forward/get/recommendPublicnumberList.json",URL_SLQ_HOST_L]
#define GetInviteListURL [NSString stringWithFormat:@"%@/friend/get/userVerifyMessageList.json",URL_HOST_L]
#define DelectContactURL [NSString stringWithFormat:@"%@/friend/delete/userFriend.json",URL_HOST_L]

#define GetTaxOfficeContactURL [NSString stringWithFormat:@"%@/forward/get/taxofficeContactOfpublicNumber.json",URL_SLQ_HOST_L]
#define GetServiceNOURL [NSString stringWithFormat:@"%@/forward/get/userAssociatePublicnumberList.json",URL_SLQ_HOST_L]
#define GetServiceNODetailURL [NSString stringWithFormat:@"%@/forward/get/publicNumberInfo.json",URL_SLQ_HOST_L]
#define CancelAssociateURL [NSString stringWithFormat:@"%@/forward/delete/associatePublicNumberInfo.json",URL_SLQ_HOST_L]
#define AssociateURL [NSString stringWithFormat:@"%@/forward/associate/publicnumberInfo.json",URL_SLQ_HOST_L]
#define SearchServiceNOURL [NSString stringWithFormat:@"%@/forward/search/publicNumberList.json",URL_SLQ_HOST_L]


#define AddUserURL [NSString stringWithFormat:@"%@/friend/add/userFriend.json",URL_HOST_L]
#define ConfirmAddUserURL [NSString stringWithFormat:@"%@/friend/confirm/addUserFriend.json",URL_HOST_L]


#define GetOpenStatusListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerOpenStatus.json",URL_SLQ_HOST_L]
#define GetTaxPlayerListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerBasicInfoList.json",URL_SLQ_HOST_L]
#define GetTaxPlayerBasicInfoURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerBasicInfoByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetTaxPlayerContactInfoURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerContactByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetTaxPlayerTaxInfoURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerTaxInfoByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetTaxPlayerQualificationInfoURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerQualificationInfo.json",URL_SLQ_HOST_L]
#define GetTaxPlayerTaxApprovedInfoURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerTaxApprovedInfo.json",URL_SLQ_HOST_L]
#define GetTaxPlayerTaxInventoryInfoURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerTaxInventoryList.json",URL_SLQ_HOST_L]
#define GetTaxPlayerTotalRevenueURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerTotalRevenueList.json",URL_SLQ_HOST_L]
#define GetTaxPlayerIncomeTaxApprovedURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerIncomeTaxApprovedList.json",URL_SLQ_HOST_L]

#define GetInvoiceKindListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerInvoiceKindListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetInvoiceCategoryListURL [NSString stringWithFormat:@"%@/forward/tool/get/invoiceCategoryList.json",URL_SLQ_HOST_L]
#define GetInvoiceBoughtListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerInvoiceBoughtListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetInvoiceCancellationListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerInvoiceCancellationListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetInvoiceBoughtMonitorListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerInvoiceBoughtMonitorInfoByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetInvoiceBalancesURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerInvoiceBalancesListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetInvoiceTestOldURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerInvoiceTestOldInfoByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetDocumentCirculationStatusURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerDocumentCirculationStatusListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetDocumentStatusListURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerDocumentStatusList.json",URL_SLQ_HOST_L]
#define GetDocumentApprovalURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerDocumentApprovalResultListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetDocumentOfIllegalURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerDocumentOfIllegalListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetDeclarationCaseURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerDeclareCaseListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetLevyProjectList [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerLevyProjectList.json",URL_SLQ_HOST_L]
#define GetTaxTypeList [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerTaxPaymentTypeList.json",URL_SLQ_HOST_L]
#define GetTaxesList [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerPayTaxesListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetOweTaxesCaseURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerOweTaxesCaseListByTaxpayerNumber.json",URL_SLQ_HOST_L]
#define GetDrawbackCaseURL [NSString stringWithFormat:@"%@/forward/tool/get/taxpayerDrawbackCaseListByTaxpayerNumber.json",URL_SLQ_HOST_L]


//
/* 获取城市列表 */
#define GetCityList [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/cityInfoList.json",URL_SLQ_HOST_L]

/* 获取城市列表(修改) */
#define GetNewCityList [NSString stringWithFormat:@"%@/businessHall/get/cityInfoList.json",URL_HOST]

/* 获取服务首页数据 */
#define GetFWHomeData [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/servicePageInfo.json",URL_SLQ_HOST_L]

/* 校验服务小工具是否有权限使用 */
#define MiniToolsHasPermission [NSString stringWithFormat:@"%@/forward/verify/miniToolsHasPermission.json",URL_SLQ_HOST]

/* 服务厅小工具第2重校验 */
#define ToolVerifyLogin [NSString stringWithFormat:@"%@/forward/verify/miniToolsIsNeedLogin.json",URL_SLQ_HOST]
/* 获取服务页面的小工具列表 */
#define GetToolList [NSString stringWithFormat:@"%@/forward/get/miniToolsOfService.json",URL_SLQ_HOST]
/* 获取开机公告 */
#define GetOpenNotice [NSString stringWithFormat:@"%@/extend/get/notice.json",URL_HOST]
/* 获取服务厅列表 */
#define GetFwtList [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/businessHallListByCityCode.json",URL_SLQ_HOST_L]
/* 根据经纬度，获取附近的服务厅列表 */
#define GetNearFwtList [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/businessHallListByCityCodeAndCoordinates.json",URL_SLQ_HOST_L]
/* 服务厅获取税种信息 */
#define GetFwtTaxList [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/taxListByCityCode.json",URL_SLQ_HOST_L]
/* 获得服务厅列表数据byTaxId byAreaId*/
#define GetFwtListByTax [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/businessHallListByCityCodeAndCondition.json",URL_SLQ_HOST_L]
/* 获得服务厅地铁信息 */
#define GetFwtSubway [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/subwayListByCityCode.json",URL_SLQ_HOST_L]
/* 获得服务厅地区信息 */
#define GetFwtArea [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/areaListByCityCode.json",URL_SLQ_HOST_L]
/* 获得服务厅商圈信息 */
#define GetFwtCbd [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/cbdListByCityCode.json",URL_SLQ_HOST_L]
/* 获得服务厅详细信息 */
#define GetFwtDetail [NSString stringWithFormat:@"%@/taxpayer/forward/servicepage/get/businessHallDetailInfo.json",URL_SLQ_HOST_L]
/* 获得服务厅详细流量信息 */
#define GetFwtLiuliagDetail [NSString stringWithFormat:@"%@/forward/businessHall/get/businessHallSsll.json",URL_SLQ_HOST_L]

#define AssociateEnterpriseURL [NSString stringWithFormat:@"%@/forward/associate/taxpayerContactByOther.json",URL_SLQ_HOST_L]

//获取纳税人关联人信息

#define UpdateTaxpayerContactInfoURL [NSString stringWithFormat:@"%@/forward/update/taxpayerContactInfo.json",URL_SLQ_HOST_L]

//小规模权限验证
#define TaxPayerQualificationURL [NSString stringWithFormat:@"%@/forward/xgmsb/verify/taxpayerQualification.json",URL_SLQ_HOST_L]
//申报登陆验证
#define TaxPayerLoginURL [NSString stringWithFormat:@"%@/forward/xgmsb/verify/taxpayerShenbaoPwd.json",URL_SLQ_HOST_L]
/* 小规模申报 申请开通资格 */
#define TaxPayerDeclarationApplyURL [NSString stringWithFormat:@"%@/forward/xgmsb/apply/taxpayerSJSB.json",URL_SLQ_HOST_L]
/* 小规模申报 数据同步 */
#define TaxPayerSynchronizationDataURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/taxpayerSBDataSynchronization.json",URL_SLQ_HOST_L]
/* 小规模申报 提交申报 */
#define TaxPayerDeclarationSubmitURL [NSString stringWithFormat:@"%@/forward/xgmsb/save/decalrationDataToCtais.json",URL_SLQ_HOST_L]
/* 小规模申报 获取某个税种下的基础数据*/
#define TaxPayerGetDeclarationListDataURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationBasicsData.json",URL_SLQ_HOST_L]
/* 小规模申报 获取申报税种列表*/
#define TaxPayerGetDeclarationTaxTypeListURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationTaxInfo.json",URL_SLQ_HOST_L]
/*小规模申报 获取申报查询列表*/
#define TaxPayerGetSbSuccessTaxListURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationSbSuccessTaxList.json",URL_SLQ_HOST_L]
/*小规模申报 获取查询详情*/
#define TaxPayerGetDeclarationDetailURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationDetailInfo.json",URL_SLQ_HOST_L]
/*小规模申报 下载申报表pdf*/
//#define TaxPayerDownloadPDFURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationPdfDownload.json",URL_SLQ_HOST_L]
#define TaxPayerDownloadPDFURL [NSString stringWithFormat:@"%@/aliyun/forward/xgmsb/get/decalrationPdfDownloadShare.json",URL_SLQ_HOST]

/*小规模申报 下载缴款凭证png*/
#define TaxPayerDownloadPNGURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationJkpzDownload.json",URL_SLQ_HOST_L]
/*小规模申报 获取缴款凭证列表*/
#define TaxPayerGetDeclarationPaymentTaxListURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationPaymentTaxList.json",URL_SLQ_HOST_L]
/*小规模申报 获取缴款凭证详情*/
#define TaxPayerGetDeclarationPaymentTaxDetailURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationPaymentDetailInfo.json",URL_SLQ_HOST_L]
/*小规模申报 获取申报作废列表*/
#define TaxPayerGetTaxCancellationListURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationZFTaxList.json",URL_SLQ_HOST_L]
/*小规模申报 提交申报作废*/
#define TaxPayerSetTaxCancellationURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationZF.json",URL_SLQ_HOST_L]
/*小规模申报 修改申报密码 */
#define TaxPayerDeclarationModifyPwdURL [NSString stringWithFormat:@"%@/forward/xgmsb/modify/decalrationPwd.json",URL_SLQ_HOST_L]
/*小规模申报 找回忘记密码 */
#define TaxPayerDeclarationForgetPwdURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationPwd.json",URL_SLQ_HOST_L]
/*小规模申报 缴款 */
#define TaxPayerDeclarationPayURL [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationMoneyTransfer.json",URL_SLQ_HOST_L]
/*小规模申报 重置数据 */
#define TaxPayerDeclarationReset [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationDataReInit.json",URL_SLQ_HOST_L]
/*小规模申报 刷新税种列表 */
#define TaxPayerDeclarationRefresh [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationTaxListReInit.json",URL_SLQ_HOST_L]
/*小规模申报 同步申报来源状态 */
#define TaxPayerDeclarationSourceState [NSString stringWithFormat:@"%@/forward/xgmsb/get/decalrationTaxListDepReInit.json",URL_SLQ_HOST_L]

//通过企业税号删除企业关联信息
#define CancelAssiociatedByCodeURL [NSString stringWithFormat:@"%@/forward/del/taxpayerContactByOther.json",URL_SLQ_HOST_L]
//关联界面通过企业税号验证企业信息
#define VerifyTaxPayerByCodeURL [NSString stringWithFormat:@"%@/forward/verify/taxpayerInfoByTaxpayerNumber.json",URL_SLQ_HOST_L]
//设置纳税人关联口令或状态
#define SetTaxPayerRelatedCodeOrStatusURL [NSString stringWithFormat:@"%@/forward/set/taxpayerRelatedCodeOrRelatedCodeStatus.json",URL_SLQ_HOST_L]
//获取纳税联系人状态
#define GetTaxPayerContactStatusURL [NSString stringWithFormat:@"%@/forward/get/taxpayerContactStatus.json",URL_SLQ_HOST_L]
//设置纳税联系人关联 2为取消关联 3为关联
#define SetTaxPayerContactRelatedCodeURL [NSString stringWithFormat:@"%@/forward/set/taxpayerContactRelatedCode.json",URL_SLQ_HOST_L]
//获取纳税人小工具权限
#define GetTaxPayerContactToolPermissionURL [NSString stringWithFormat:@"%@/forward/get/taxpayerContactPermissionId.json",URL_SLQ_HOST_L]
//设置纳税人小工具权限
#define SetTaxPayerContactToolPermissionURL [NSString stringWithFormat:@"%@/forward/set/taxpayerContactPermissionId.json",URL_SLQ_HOST_L]
//在设置界面通过企业税号验证企业信息
#define VerifyTaxPayerURL [NSString stringWithFormat:@"%@/forward/get/taxpayerInfo.json",URL_SLQ_HOST_L]
//激活企业
#define ActiveEnterpriseURL [NSString stringWithFormat:@"%@/forward/activate/userAssociateTaxpayer.json",URL_SLQ_HOST_L]

/* 获得推送列表 */
#define GetMessageList [NSString stringWithFormat:@"%@/forward/get/pushMessageList.json",URL_SLQ_HOST_L]

//申报表
//税款缴纳
#define taxPayment [NSString stringWithFormat:@"%@/work_table2/taxPayment.html",BASE_SLQ_URL]
//所有税种类
#define vat_main_table [NSString stringWithFormat:@"%@/work_table2/vat_main_table.html",BASE_SLQ_URL]
#define vat_detailed_table [NSString stringWithFormat:@"%@/work_table2/vat_detailed_table.html",BASE_SLQ_URL]
#define vat_affiliated_table [NSString stringWithFormat:@"%@/work_table2/vat_affiliated_table.html",BASE_SLQ_URL]
#define vat_reduction_table [NSString stringWithFormat:@"%@/work_table2/vat_reduction_table.html",BASE_SLQ_URL]
#define corporate_income_tax2015_table [NSString stringWithFormat:@"%@/work_table2/corporate_income_tax2015_table.html",BASE_SLQ_URL]
#define culture_table [NSString stringWithFormat:@"%@/work_table2/culture_table.html",BASE_SLQ_URL]
#define culture_affiliated_table [NSString stringWithFormat:@"%@/work_table2/culture_affiliated_table.html",BASE_SLQ_URL]
// 新增所得税A类
#define tax2015A_table [NSString stringWithFormat:@"%@/work_table2/corporate_income_tax2015A_table.html",BASE_SLQ_URL]
#define tax2015A_table_fb1 [NSString stringWithFormat:@"%@/work_table2/corporate_income_tax2015A_table_fb1.html",BASE_SLQ_URL]
#define tax2015A_table_fb2 [NSString stringWithFormat:@"%@/work_table2/corporate_income_tax2015A_table_fb2.html",BASE_SLQ_URL]
#define tax2015A_table_fb3 [NSString stringWithFormat:@"%@/work_table2/corporate_income_tax2015A_table_fb3.html",BASE_SLQ_URL]
//财务报表类
#define balance_sheet_table [NSString stringWithFormat:@"%@/work_table2/balance_sheet_table.html",BASE_SLQ_URL]
#define profit_table [NSString stringWithFormat:@"%@/work_table2/profit_table.html",BASE_SLQ_URL]
#define cash_flow_table [NSString stringWithFormat:@"%@/work_table2/cash_flow_table.html",BASE_SLQ_URL]



#pragma mark - 预约服务
//获取全局栏目菜单接口
#define GetMenuAll [NSString stringWithFormat:@"%@/recommend/get/MenuAll.json",URL_HOST]
//获取登录用户自定义栏目菜单接口
#define GetLoginMenuAll [NSString stringWithFormat:@"%@/recommend/get/UserMenu.json",URL_HOST_L]
//更新用户自定义栏目菜单到数据库
#define UpdatetLoginMenuAll [NSString stringWithFormat:@"%@/recommend/add/UserMenu.json",URL_HOST_L]
//根据用户选中菜单栏目，获取对应的列表信息
#define GetContentList [NSString stringWithFormat:@"%@/recommend/get/contentList.json",URL_HOST]

//客户端点击 分享调用此接口
#define ShareMenu [NSString stringWithFormat:@"%@/recommend/add/ShareNum.json",URL_HOST]
//纳税人-评论接口
#define CommentMenu [NSString stringWithFormat:@"%@/recommend/add/CommentInfo.json",URL_HOST]
//纳税人-收藏添加取消接口
#define CollectionMenu [NSString stringWithFormat:@"%@/recommend/user/Collection.json",URL_HOST_L]
//纳税人-获取收藏列表接口¶
#define UserCollectionMenu [NSString stringWithFormat:@"%@/recommend/get/UserCollectionList.json",URL_HOST_L]
//纳税人-获取收藏状态内容评论数
#define UserCollectionStatus [NSString stringWithFormat:@"%@/recommend/get/CollectionStateAndCommentNum.json",URL_HOST]

//获取纳税人，，服务页面，，静态链接地址
#define GetUrlLinkInfo [NSString stringWithFormat:@"%@/businessHall/get/UrlLinkInfo.json",URL_HOST]



//获取预约状态
#define userYYStatus [NSString stringWithFormat:@"%@/yyfw/yy/get/userYYStatus.json",URL_SLQ_HOST_L]
//获取服务厅
#define hallList [NSString stringWithFormat:@"%@/yyfw/yy/get/hallList.json",URL_SLQ_HOST_L]
//获取业务列表
#define swjgYWInfo [NSString stringWithFormat:@"%@/yyfw/yy/get/swjgYWInfo.json",URL_SLQ_HOST_L]
//提交预约
#define userYyOrder [NSString stringWithFormat:@"%@/yyfw/yy/add/userYyOrder.json",URL_SLQ_HOST_L]
//获取推荐时段
#define userYyOrderRecommendTime [NSString stringWithFormat:@"%@/yyfw/yy/get/userYyOrderRecommendTime.json",URL_SLQ_HOST_L]
//获取订单详情
#define userYyfwOrderDetailInfo [NSString stringWithFormat:@"%@/yyfw/yy/get/userYyfwOrderDetailInfo.json",URL_SLQ_HOST_L]
//我的预约列表
#define userHistoryYyOrderInfoList [NSString stringWithFormat:@"%@/yyfw/yy/get/userHistoryYyOrderInfoList.json",URL_SLQ_HOST_L]
//取消预约
#define cancelUserYyOrderStatus [NSString stringWithFormat:@"%@/yyfw/yy/set/cancelUserYyOrderStatus.json",URL_SLQ_HOST_L]
//排号
#define userOrderToQueue [NSString stringWithFormat:@"%@/yyfw/pd/add/userOrderToQueue.json",URL_SLQ_HOST_L]
//当前排队信息
#define userOrderPdInfo [NSString stringWithFormat:@"%@/yyfw/pd/get/userOrderPdInfo.json",URL_SLQ_HOST_L]
//重新排号
#define userOrderToQueueAgain [NSString stringWithFormat:@"%@/yyfw/pd/add/userOrderToQueueAgain.json",URL_SLQ_HOST_L]
//二维码信息
#define userYyOrderOperatorInfo [NSString stringWithFormat:@"%@/yyfw/jh/get/userYyOrderOperatorInfo.json",URL_SLQ_HOST_L]
//对方爽约
#define nsrOperSwrSy [NSString stringWithFormat:@"%@/yyfw/jh/get/nsrOperSwrSy.json",URL_SLQ_HOST_L]
//评价
#define nsrEvaluateSwrInfo [NSString stringWithFormat:@"%@/yyfw/pj/add/nsrEvaluateSwrInfo.json",URL_SLQ_HOST_L]
//评价标签
#define nsrEvaluateSwrInfoList [NSString stringWithFormat:@"%@/yyfw/pj/get/nsrEvaluateSwrInfoList.json",URL_SLQ_HOST_L]






#pragma mark - 税银互动
//获取银行列表
#define GetBankList [NSString stringWithFormat:@"%@/extend/getBankInfoListByCityCode.json",URL_HOST]
//获取银行详情
#define GetBankInfo [NSString stringWithFormat:@"%@/extend/getBankInfoById.json",URL_HOST]
//提交申请
#define syhdOrder [NSString stringWithFormat:@"%@/syhd/add/syhdOrder.json",URL_HOST_L]
//我的订单
#define syhdOrderListByPhone [NSString stringWithFormat:@"%@/syhd/get/syhdOrderListByPhone.json",URL_HOST_L]
//订单详情
#define syhdOrderDetailById [NSString stringWithFormat:@"%@/syhd/get/syhdOrderDetailById.json",URL_HOST_L]
//取消申请
#define syhdOrderInfoById [NSString stringWithFormat:@"%@/syhd/update/syhdOrderInfoById.json",URL_HOST_L]



//涉税查询
#define sscxInfoList [NSString stringWithFormat:@"%@/extend/get/sscxInfoList.json",URL_HOST]



#pragma mark - 金三申报

//验证纳税人当前操作企业是否可以使用金3申报 *
#define taxpayerQualification [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/verify/taxpayerQualification.json",URL_SLQ_HOST_L]
//申报密码的验证 *
#define taxpayerDeclarationPwd [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/verify/taxpayerDeclarationPwd.json",URL_SLQ_HOST_L]
//申报数据同步 *
#define taxpayerDeclarationDataSynchronization [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerDeclarationDataSynchronization.json",URL_SLQ_HOST_L]
//获取申报主页面列表 *
#define taxpayerDeclarationTaxInfoList [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerDeclarationTaxInfoList.json",URL_SLQ_HOST_L]
//获取申报主页面列表详情 *
#define taxpayerDeclarationTaxBasicInfoAndTableInfo [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerDeclarationTaxBasicInfoAndTableInfo.json",URL_SLQ_HOST_L]
//税种申报 *
#define taxpayerDeclarationTaxToServer [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/save/taxpayerDeclarationTaxToServer.json",URL_SLQ_HOST_L]
//获取可以作废的税种列表 *
#define taxpayerDeclarationCanBeCancelTaxList [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerDeclarationCanBeCancelTaxList.json",URL_SLQ_HOST_L]
//作废税种 *
#define taxpayerDeclarationTaxCanceled [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/do/taxpayerDeclarationTaxCanceled.json",URL_SLQ_HOST_L]
//税种缴款 *
#define taxpayerDeclarationTaxPayment [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/do/taxpayerDeclarationTaxPayment.json",URL_SLQ_HOST_L]
//税款缴纳 *
#define GT3taxPayment [NSString stringWithFormat:@"%@/work_table3/taxPayment1.html",BASE_SLQ_URL]
//重置税种基础数据 *
#define taxpayerDeclarationTaxDataReset [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/do/taxpayerDeclarationTaxDataReset.json",URL_SLQ_HOST_L]
//忘记申报密码 *
#define getTaxpayerDeclarationPwd [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerDeclarationPwd.json",URL_SLQ_HOST_L]
//修改申报密码 *
#define modifyTaxpayerDeclarationPwd [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/modify/taxpayerDeclarationPwd.json",URL_SLQ_HOST_L]
//根据查询时间获取纳税人可以查询申报明细的税种列表 *
#define taxpayerSBDetailTaxList [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerSBDetailTaxList.json",URL_SLQ_HOST_L]
//查询某个税种的申报明细信息，即获取pdf *
#define taxpayerSBDetailUrl [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerSBDetailUrl.json",URL_SLQ_HOST_L]
//更新pdf，即重新生成用户的申报明细pdf *
#define taxpayerSBDetailUrlReInit [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerSBDetailUrlReInit.json",URL_SLQ_HOST_L]
//根据时间查询纳税人可以查询缴款凭证的税种列表 *
#define taxpayerJKPZTaxList [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerJKPZTaxList.json",URL_SLQ_HOST_L]
//查询缴款凭证pdf *
#define taxpayerJKPZUrl [NSString stringWithFormat:@"%@/taxpayer/forward/OS/gt3/get/taxpayerJKPZUrl.json",URL_SLQ_HOST_L]


#pragma mark - OAuth

#define OAuthKey @"77d5f59d0cf0497dc87e3f5854b0d5ee"
#define OAuthSecret @"054dbd6ea67fcc79"
#define SIGN(T,PW,PHONE) [NSString stringWithFormat:@"oauth_consumer_key=%@&oauth_nonce=%llu&oauth_signature_method=HMAC-SHA1&oauth_timestamp=%llu&oauth_version=1.0&x_auth_model=client_auth&password=%@&phone=%@",OAuthKey,T,T/1000,PW,PHONE]

//通知
#define ShowAlertNotificaion @"ShowAlertNotificaion"        //网络错误提示通知
#define CollectStatusChangeNotification @"CollectStatusChangeNotification"
#define FriendsChangeNotification @"FriendsChangeNotification"
#define NeedReLoginNotificaion @"NeedReLoginNotificaion"
#define LawClickSearchNotification @"LawClickSearchNotification"
#define MapDrawLineNotification @"MapDrawLineNotification"
#define LogoutNotification @"LogoutNotification"
#define ReturnToRootNoficaion @"asd1312455@$@$!@$!@"
#define RefreshChatListNoficaion @"RefreshChatListNoficaion"
#define ServiceViewNotification @"ServiceViewNotification"//服务也刷新

#define myenterprise @"MyEnterpriseTableView"

#define SaveToolPermission @"SaveToolPermission"
#define ClickInvitationNotification @"ClickInvitationNotification"
#define GetMessageListNotification @"GetMessageListNotification"
#define ClientIdNoficaion @"ClientIdNoficaion"
#define AppointmentStateNotification @"AppointmentStateNotification"
#define CheckUpdateNotification @"CheckUpdateNotification"//检查pgy更新
#define AppointmentDetailNotification @"AppointmentDetailNotification"      //预约详情刷新通知
#define GT3TaxDeclarationNotification @"GT3TaxDeclarationNotification"      //预约详情刷新通知


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//获取沙盒路径图片
#define imgNameOfFile(imgName,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(imgName) ofType:(type)]]


// 单例
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}
#define Color(c)          [UIColor colorWithRed:(c)/255.0 green:(c)/255.0 blue:(c)/255.0 alpha:1]


#define ThemeColor [UIColor colorWithRed:25.0/255 green:133.0/255 blue:196.0/255 alpha:1]
#define ButtonFilledColor [UIColor colorWithRed:15.0/255 green:111.0/255 blue:166.0/255 alpha:1]
#define ColorRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define ColorRGBO(r,g,b,o) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(o)/100.0]
#define BackGroundColor Color(242)
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define LineColor RGBACOLOR(222, 225, 228, 1)       //分割线颜色
#define HeaderHeight 22         //组头高度
#define HeaderCellHeight 10         //组头高度
#define SectionColor Color(242)
#define TextColor ColorRGB(51,49,49)
#define DarkLineColor ColorRGB(188, 186, 193)

#define IS_DEVICE_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_DEVICE_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_DEVICE_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_DEVICE_iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_DEVICE_iPadAir ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536, 2048), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_DEVICE_iPad2 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(768, 1024), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_DEVICE_iPadPro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(2048, 2732), [[UIScreen mainScreen] currentMode].size) : NO)



#define TableCellEdge (IS_DEVICE_iPhone6P||IS_DEVICE_iPhone6?20:15)
#define RowHeight (IS_DEVICE_iPhone6P||IS_DEVICE_iPhone6?50:44)
#define CellImageSize (IS_DEVICE_iPhone6P||IS_DEVICE_iPhone6?25:20)

#define NetworkError @""
#define DataError @"获取数据失败"
#define PositioningError @"定位失败，请打开定位权限"
#define ServiceError @"服务器异常，请稍后重试"

#define LawHeight (IS_DEVICE_iPhone6||IS_DEVICE_iPhone6P?215:185)


#define ImageRowHeight (IS_DEVICE_iPhone6P?80:70)
#define ButtonHeight (IS_DEVICE_iPhone6P?50:40)


//屏幕的宽、高
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//占位图
#define news_defaultStr @"news_default"

//适配
#define AutomaticSizeWidth(value) ((value)/320.0f*[UIScreen mainScreen].bounds.size.width/2)
#define AutomaticSizeHeight(value) ((value)/568.0f*[UIScreen mainScreen].bounds.size.height/2)
#define LableTextFont kScreenHeight/40

/**
 *	永久存储对象
 *
 *  NSUserDefaults保存的文件在tmp文件夹里
 *
 *	@param	object      需存储的对象
 *	@param	key         对应的key
 */
#define DEF_PERSISTENT_SET_OBJECT(object, key)                                                                                                 \
({                                                                                                                                             \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];                                                                          \
[defaults setObject:object forKey:key];                                                                                                    \
[defaults synchronize];                                                                                                                    \
})

/**
 *	取出永久存储的对象
 *
 *	@param	key     所需对象对应的key
 *	@return	key     所对应的对象
 */
#define DEF_PERSISTENT_GET_OBJECT(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]


/**
 *  清除 NSUserDefaults 保存的所有数据
 */
#define DEF_PERSISTENT_REMOVE_ALLDATA   [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]]


/**
 *  清除 NSUserDefaults 保存的指定数据
 */
#define DEF_PERSISTENT_REMOVE(_key)                                         \
({                                                                          \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];       \
[defaults removeObjectForKey:_key];                                     \
[defaults synchronize];                                                 \
})


//缓存文件名称
#define Configuration @"Configuration.plist"
//缓存KEY
#define SettingInfo @"SettingInfo"
#define ImageSwitch @"ImageSwitch"              //小图模式key
#define AdDataInfo @"AdDataInfo"              //广告时间key
#define AdImgUrlInfo @"AdImgUrlInfo"              //广告图片地址key
#define toolButtonInfo @"toolButtonInfo"            //小规模模块key
#define serviceBannerInfo @"serviceBannerInfo"            //服务界面banner图key
#define cityListInfo @"cityListInfo"          //城市列表key
#define radioInfo @"radioInfo"          //广播key
#define recommendedBannerInfo @"recommendedBannerInfo"      //推荐界面banner图key
#define recommendedBannerInfo @"recommendedBannerInfo"      //推荐界面banner图key
#define refreshShopping @"refreshShopping"        //刷新业务商店列表

//个推企业版
#define GETUI_ID            @"o8qIpa0kGb8HwEmv5T0zS9"
#define GETUI_KEY           @"HTzsAgvEeA9gnhCFzHUO56"
#define GETUI_SECRET        @"PWOZHfLEy2AXkxMUvySdh8"
//个推企业测试版
#define GETUI_ID_TEST           @"EfaDip3mUUADu5cBx8IA02"
#define GETUI_KEY_TEST          @"2Cz06eXAmf9lPNgkMCois6"
#define GETUI_SECRET_TEST       @"HdYjp5Refl89ukPkRqQ7c5"
//个推appstore版
#define GETUI_ID_AppStore           @"CXQvVv5fxF6GtNd3oAFtt1"
#define GETUI_KEY_AppStore          @"k8TETBqal17gMAANeWEn49"
#define GETUI_SECRET_AppStore       @"0aS7rjfXRW9Fdy5cgLMOT6"
//个推appstore测试版
#define GETUI_ID_TEST_AppStore          @"APsU59kBbaAXXkpsTwRv15"
#define GETUI_KEY_TEST_AppStore         @"VljM6D1C0J7k532iLPtm24"
#define GETUI_SECRET_TEST_AppStore      @"WfZCY8cyWi6vwQChOcPL08"

//正式友盟
#define UMENG_KEY       @"55a5d99267e58eb00e00875d"
//测试友盟
#define UMENG_KEY_TEST  @"5705bc52e0f55a9144001504"

//正式蒲公英
#define PGY_KEY         @"d63283930a59897e7553f17dca041dfc"
//测试蒲公英
#define PGY_KEY_TEST    @"9ce4180745e9696766db7d97f1e1cb9b"

//正式环信
#define EASEMOB_KEY                 @"joojee2014#sqt"
#define APNS_CERT_NAME              @"sqt_nsr_dis"//企业版
#define APNS_CERT_NAME_APPSTORE     @"sqt_nsr_dis_appstore"//appStore测试版
//测试环信
#define EASEMOB_KEY_TEST                @"joojee2014#test1121"
#define APNS_CERT_NAME_TEST             @"sqt_nsr_dev"//企业测试版
#define APNS_CERT_NAME_APPSTORE_TEST    @"sqt_nsr_dev_appstore"//appStore测试版

#endif

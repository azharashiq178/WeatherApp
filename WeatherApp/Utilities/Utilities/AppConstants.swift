//
//  AppConstants.swift
//  FanTazTech
//
//  Created by Fahid Attique on 06/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//


import UIKit

/**
 * General Class singleton constants
 */

let userDefaults: UserDefaults = UserDefaults.standard
let notifCenter: NotificationCenter = NotificationCenter.default
let application = UIApplication.shared
let appDelegate = application.delegate as! AppDelegate
let appUtility = AppUtility.sharedInstance


//let reachabilityManager = ReachabilityManager.sharedInstance








/**
 * Social Media Keys
 */


let googleClientID           = "322869943825-79bntlu2rkejfhimb31t27skn58b8toi.apps.googleusercontent.com"
let googleSDKAPIKey          = "AIzaSyCndwQAX9tLnfKAMZDjv4T0y9X8lra0yBQ"









/**
 * General constants
 */

let deviceScale:CGFloat = UIScreen.main.scale



/**
 * Alert Messages and titles
 */
//let titleServerError                    = "Error"
let titleServerError                    = ""
let titleLocationError                  = "Location Error"
let titleNetworkError                   = "Limited/No Connectivity"
let titleNoPaymentMethodError           = "Add Payment Method"


let titleSelectPhoneNumber              = "Select Phone number"
let titleSelectLang                     = "Select Language"
let titleSelectLangs                    = "Select Languages"
let titleDeletePhoto                    = "Delete Photo"
let titleAccessDenied                   = "Access denied"
let titleValidationFailed               = "Validation Failed"
let titleSelectCertification            = "Select Certification"




let messageServerError                  = "Server is not responding"
let messageNetworkError                 = "Please try again later, once your network connectivity is available"
let messageCancelledError               = "Requested Cancelled"
let messageNoPaymentMethodError         = "Please add your payment method first"
let messageConnectingErrorUser          = "Unable to connect because of a poor internet connection. Please find a stronger connection and try again."
let messageConnectingErrorInterpreter   = "Unable to connect because of a poor internet connection. Please find a stronger connection and try again."

let messageEnterSocialSecurityNumber    = "Please enter Social Security Number"
let messageSelectAnImage                = "Please select an image"
let messageUnableToSave                 = "Unable to save in Documents"
let messageEnterLast4SSN                = "Please enter last 4 digits of your social security number"



let messageStripeValidationFailed       = "Please enter valid inputs."
let messageStripeValidationMonthFailed  = "Please enter valid expiry month field"
let messageStripeValidationYearFailed   = "Please enter valid expiry year field"
let messageStripeValidationExpiryFailed = "Please enter expiry date field"
let messageStripeValidationAddressZip   = "Please enter zip code field"

let messagePhoneValidationFailed        = "Please enter valid phone number."
let messageDisagreedTerms               = "You need to agree to the Terms of Service & Privacy Policy to complete the registeration"
let messageUserProfileValidationFailed  = "Please enter all name fields"
let messageMinimumLanguageSelection     = "Please select at least two languages."
let messageMinimumCertificationSelection = "Please select at least one certification type."

let messageAddThirdCallerFailed         = "Could not connect to the specified number"

let messageTokenExpired                 = "Your session has been expired. Please login again."
let messageAPICancelled                 = "Process is cancelled."






let buttonOK                            = "OK"
let buttonLogout                        = "Logout"
let buttonSend                          = "Send"
let buttonDontSend                      = "Don't Send"
let buttonDelete                        = "Delete"
let buttonCancel                        = "Cancel"
let buttonSettings                      = "Settings"
let buttonEndCall                       = "End Call"
let buttonYES                           = "Yes"
let buttonNO                            = "No"
let buttonClose                         = "Close"
let buttonContactUs                     = "Contact Us"
let buttonGotIt                         = "Got it"
let buttonGoToAppstore                  = "Go to App Store"
let buttonVerify                        = "Verify"
let buttonCamera                        = "Camera"
let buttonGallery                       = "Gallery"




/**
 * App keys
 */
let keyAuthToken                        = "appToken"
let keydeviceToken                         = "deviceToken"
let keyIntroViewSeen                    = "isIntroViewSeen"
let keyAppUser                          = "appUser"
let keyExistingJob                      = "existingJob"


/**
 * Date Patterns
 */
let datePattern_Display_Time            = "HH:mm:ss"
let datePattern_Display_TimeAM          = "hh:mm a"
let datePattern_Display_DateAndTime     = "MMM dd, yyyy - hh:mm a"
let datePattern_Display_Date            = "MM-dd-YYYY"
let datePattern_Display_DriverHome_Date = "dd/MM/YYYY"
let datePattern_Server                  = "MM-dd-yyyy"
let pastDelivery_datePattern            = "dd-MM-yyyy"
let pastDelivery_weekdatePattern        = "EEEE (dd-LLL-yyyy)"
let datePattern_CompletedJob            = "yyyy-MM-dd HH:mm:ss"
let datePattern_DriverDashboard         = "E dd LLLL YYYY"








/**
 * NSNotification Names
 */

let profileDataUpdated        = "profileDataUpdated"






/**
 * Appstore URL
 */

let appstoreURL        = ""




/**
 *  Folder Paths
 */

let userAssetsFolderName                = "UserAssets"
let userTempFolderName                  = "TempFolder"






/**
 *  Image's Placeholder Sizes
 */

let placeHolderImageSize: CGSize = CGSize(width: 100.0, height: 100.0)












/**
 * Documents
 */

let temporaryDocumentFolder                = "Temporary Documents"
let permanentUserDocumentFolder            = "User Documents"





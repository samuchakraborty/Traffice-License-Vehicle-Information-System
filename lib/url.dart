///
///
///
///
/// User Url
const String baseUrl = "http://10.0.2.2:3000/";
const String userLoginUrl = baseUrl + "user/signin";
const String userProfileUrl = baseUrl + "user/userprofile/";

const String userApplyLicenseUrl = baseUrl + "user/applyLicense";

const String userAddVehicleUrl = baseUrl + "user/addVechile";
const String userAllVehicleInformationUrl = baseUrl + "user/getVechile/";

/// Police
///

const String policeLoginUrl = baseUrl + "police/signIn";
const String policeSignUpUrl = baseUrl + "police/signUp";
const String policeProfileUrl = baseUrl + "police/getInformation"; // query params batchId
const String searchVehicleUrl =
    baseUrl + "police/getVehicle"; // query params = vc

const String searchLicenseUrl =
    baseUrl + "police/getLicense"; // query params = license

/// admin
///

const String adminGetUserUrl =
    baseUrl + "admin/user"; // query params = license

const String adminGetVechileUrl =
    baseUrl + "admin/vehicle";



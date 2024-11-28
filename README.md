# GetterSetter

Sample Input :
======================================
int     mesi_CostDistributionCode;
int     mesi_CallHuntingId;
int     mesi_Status;

string  meC_CompanyName;
string  meC_UserGroupName;
string  meC_AnnLanguage;
string  meC_AttachCode;
string  meC_GroupPrivateNumber;

Sample Output:
========================================
void mcfn_setCostDistributionCode(int siL_CostDistributionCode) { mesi_CostDistributionCode = siL_CostDistributionCode; }
void mcfn_setCallHuntingId(int siL_CallHuntingId) { mesi_CallHuntingId = siL_CallHuntingId; }
void mcfn_setStatus(int siL_Status) { mesi_Status = siL_Status; }
void mcfn_setCompanyName(string CL_CompanyName) { meC_CompanyName = CL_CompanyName; }
void mcfn_setUserGroupName(string CL_UserGroupName) { meC_UserGroupName = CL_UserGroupName; }
void mcfn_setAnnLanguage(string CL_AnnLanguage) { meC_AnnLanguage = CL_AnnLanguage; }
void mcfn_setAttachCode(string CL_AttachCode) { meC_AttachCode = CL_AttachCode; }
void mcfn_setGroupPrivateNumber(string CL_GroupPrivateNumber) { meC_GroupPrivateNumber = CL_GroupPrivateNumber; }
int mcfn_getCostDistributionCode() { return mesi_CostDistributionCode; }
int mcfn_getCallHuntingId() { return mesi_CallHuntingId; }
int mcfn_getStatus() { return mesi_Status; }
string mcfn_getCompanyName() { return meC_CompanyName; }
string mcfn_getUserGroupName() { return meC_UserGroupName; }
string mcfn_getAnnLanguage() { return meC_AnnLanguage; }
string mcfn_getAttachCode() { return meC_AttachCode; }
string mcfn_getGroupPrivateNumber() { return meC_GroupPrivateNumber; }





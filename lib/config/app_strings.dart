const createAnAccount = 'Create an Account';
const createProfile = 'Create profile';
const fullName = 'Full Name';
const firstName = 'First Name';
const lastName = 'Last Name';
const enterFullName = 'enter full name';
const johnDoe = 'johndoe@gmail.com';
const emailAddress = 'Email Address';
const enterEmailAddress = 'enter email address';
const enterEmailLinked = 'Enter email linked to your account';
const cellPhone = 'Cell Phone';
const enterCellPhone = 'enter cell phone';
const password = 'Password';
const enterPwd = 'Enter your password';
const otpCode = 'Otp Code';
const enterOtpCode = 'Enter Otp Code';
const enterConfirmPwd = 'Re-enter your password';
const forgotPassword = 'Forgot Password ?';
const dontHaveAccount = "Don't have an account";
const send = 'Send';
const adminLogin = 'Admin Login';
const loginToAcc = 'Login to your account';
const forgotPass = 'Forgot Password';
const welcomeBack = 'Welcome back! login to your\naccount';
const enterPass = 'Enter the email associated with your account to receive OTP';
const resetPass = 'Reset Password';
const setNewPassword = 'Set New Password';
const setNewPasswordTextInfo = 'Set new password to continue to account\nlogin!';
const didNotReceiveCode = 'Didn’t receive a code?';
const sendOtp = 'Send OTP';
const enterPassword = 'enter password';
const confirmPassword = 'Confirm Password';
const newPassword = 'New Password';
const currentPassword = 'Current Password';
const haveAnAccount = 'Already have an account? ';
const dontHaveAnAccount = 'Don\'t have an account? ';
const forgortPassword = 'Forgot Password';
const login = 'Login';
const generateOtp = 'Generate OTP';
const register = 'Register Account';
const employeeLogin = 'Employee Login';
const signUp = 'Sign Up';
const nextStep = 'Next step';
const back = 'Back';
const dob = 'Date Of Birth';
const gender = 'Gender';
const payrollID = 'Payroll ID';
const pinCodeVerification = 'OTP Verification';
const pinCodeInstruction = 'Enter the code sent to your email or phone number';
const payrollProfile = 'Payroll profile';
const emailVerified = 'Email Verified';
const emailSuccessfullyVerified = 'Email successfully verified.\nContinue setting up your account';
const payRollInstruction =
    'Provide the exact information as it appears in your employers\npayroll profile';
const pinResentInstruction = 'Didnt recieve any code? ';
const resend = 'Resend';
const verifyEmail = 'Verify your email';

const emptyEmailField = 'Email field cannot be empty!';

const emptyTextField = 'Field cannot be empty!';
const emptyPasswordField = 'Password field cannot be empty';
const invalidEmailField =
    "Email provided isn't valid.Try another email address";
const passwordLengthError = 'Password length must be greater than 6';
const emailRegex =
    r'[a-zA-Z0-9+._%-+]{1,256}\@[a-zA-Z0-9][a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
const phoneNumberRegex = r'0[789][01]\d{8}';
const phoneNumberLengthError = 'Phone number must be 11 digits';
const invalidPhoneNumberField =
    "Number provided isn't valid.Try another phone number";

const joinTheCommunity = 'Join the community and create your \nmusic profile';

const agreeTo = 'I agree to the ';
const termsOfService = 'Terms of Service';
const acknowledgement = ' and acknowledge that our ';
const privacyPolicy = 'Privacy Policy';

// const updatePassword = 'Update Password';
// const ssn = 'SSN';
// const entrssn = 'enter SSN';
// const dateOfBirth = 'Date of Birth';
// const enterDateOfBirth = 'dd/mm/yy';
// const address = 'Address';
// const enterAddress = 'enter address';
// const city = 'City';
// const enterCity = 'enter city';
// const profile = 'Profile';
// const next = 'Next';
// const enterEmailOrPhone = 'Enter your Email Address/Phone number';
// const selectEmployer = 'Select Employer';
// const selectYEmployer = 'Select a company to sign in with.';
// const employeeId = 'Employee ID';
// const selectTransferType = 'Select account transfer Type';
// const accountName = 'Account name';
// const rountingNumber = 'Rounting number';
// const updateBankAccnt = 'Update Bank account';
//
// const paycheckBal = 'Paycheck Balance';
// const bankAndCard = 'Bank Account and card';
// const bankAccount = 'Bank Account';
// const transferHistory = 'Transfer History';
// const notifications = 'Notifications';
// const faq = 'FAQs';
// const earnTransfer = 'Earn free Transfer';
// const support = 'Support';
// const securityAndPrivacy = 'Security & Privacy';
// const logout = 'Logout';
//
// const instantTransfer = 'Instant Transfer';
// const completed = 'Completed';
// const amount = 'Amount';
// const appliedToPaycheck = 'Applied to paycheck';
// const reference = 'Reference';
//
// const home = 'Home';
// const cardManagement = 'Card Management';
// const financeLiteracy = 'Financial Literacy';
// const withdrawAndTransfer = 'Withdraw/Transfer';
//
// const invite = r'Invite a co worker and get $5';
// const inviteDesc =
//     r'Invite a friend and you get $5 after their first transaction';
// const copyInvite = 'Copy Invite LInk';
//
// const availableBalance = 'Available balance';
// const lastUpdatedOn = 'Last updated on';
// const currentPaycircle = 'Current Pay Circle';
// const lastPayCycle = 'Last pay Cycle';
// const assignedEmployer = 'Assigned Employer';
//
// const businessName = 'Business Name';
// const noOfEmployees = 'No of Employees';
// const action = 'Action';
// const disbursementTypeShort = 'Disbursement \nType';
// const refNumber = 'Reference Number';
// const tryAgain = 'Try Again';
// const generateOtpLabel = 'Enter your Email Address/Phone number';
// const generateOtpSubTitle =
//     'Enter your email or phone number to receive the one time password';
// const receiveOtp = 'Enter  your email or phone number to receive OTP';
// const optFailMsg = 'The code you entered is incorrect!';
//
// const passwordSetInstruction =
//     'Password must  contain at least one uppercase letter, one number, one special character(e.g !, # or %)  and must be  8 character or more.';
// const slideOne =
//     'Make any day payday, life can be unpredictable and sometimes payday is just too far away ';
// const slideTwo = 'Get the money you earned and the peace of mind you deserve';
// const slideThree =
//     'Express Wages puts financial freedom and control in the palm of your hand';
//
// const forgotPwd = 'Forgot Password';
// const forgotPwdSubtitle =
//     'Enter  the email or password associated with your account,\n we will send  an email with OTP  to reset your password';
const enterCode = 'Please enter the code we sent to your mail';
// const createNewPwd = 'Create new password';
// const pwdInstruction =
//     'Password must  contain at least one uppercase letter, one number, one special character(e.g !, # or %)  and must be  8 character or more.';
// const sendOTP = 'Send OTP';
const resetPwd = 'Reset Password';
// const notFound = 'We seem to have run into a bit of a problem with this page, kindly reload.';
// const noDataScreen = 'No data found for this search';
//
// const updateProfile = 'Update Profile';
// const bankAccountDetails = 'Bank account details';
// const kycDocRejected =
//     'Document was not verified, please submit a new document';
// const kycDocVerificationPending =
//     'We have recieved your ID and is currently being reviewed';
// const startKycRegisteration = 'Start KYC registration';
// const startKycInfo =
//     'This allows Express Wages to identify and verify the identity of employees in a complaint way with regulations in force';
// const start = 'Start';
// const submit = 'Submit';
// const toDashboard = 'Continue to Dashboard';
// const country = 'Country';
// const street = 'Street';
// const state = 'State';
// const postalCode = 'Postal Code';
// const altStreet = 'Alt Street';
// const noActiveCards = 'You do not Have Any Active Card';
// const save = 'Save';
// const payCycle = 'Pay Cycle';
// const autoPay = 'Auto Pay';
// const selectDate = 'Select Date';
// const kycCompleted = 'KYC Completed';
// const kycCompletedInfo =
//     'Your have successfully completed your KYC registration, you now have full access to your dashboard';
// const transferEarningsText =
//     'Tell your co worker about Express Wages. Once they have successfully enrolled in the app with your referral you will be able to make the first transfer for free. ';
// const faq1 = 'Is this a high-interest-rate, loan for the employee?';
// const faq2 =
//     'When an employee gets a payday advance, whose money are they getting?';
// const faq3 = 'How do employees repay their payday advances?';
// const faq4 =
//     'Should our employees download the express wages app now and be ready if they need n emergency payday advance?';
// const faq5 = r'What if employee needs more money than $200 maximum?';
// const faq6 =
//     r'Are there anyway employees can get a payday advance without paying $4.95 fee';
// const faq7 =
//     'How much work/book keeping/involvement do employers have for our workers to get a payday advance?';
// const faq8 =
//     'Can our company use Express Wages for Payday advances if we don’t offer employee direct deposit?';
// const reply1 =
//     r'No. This is not a loan - there is no interest. Express Wages simply gives your employees access to wages simply gives your employees access to wages they have already earned after their shift is complete daily up to 70% of wages or $200 per day.';
// const reply2 =
//     "Express Wages covers all the costs and risks of lending. It's their money. Yours is safe and sound, as it should be.";
// const reply3 =
//     "This is done systematically through the app and payroll platform. It will be deducted from your employee's next paycheck.";
// const reply4 =
//     'Yes, it is always best to be prepared before bad things happen. do yourself a favor, and set up now, so it is there';
// const reply5 =
//     r'You can get up to $200 a day! They will have to make a separate request the following day.';
// const reply6 =
//     'Yes, they can put their requested amount on a credit card at low cost for instant access ';
// const reply7 =
//     'That is the beauty of Express Wages, employers are not involved. Express Wages do all the heavy lifting at low cost or effort for you. You can’t beat that!';
// const reply8 =
//     'Yes, it is always best to be prepared before bad things happen. do yourself a favor, and set up now, so it is there';
// const requestStatus = 'Request Status';
// const resolveDate = 'Resolve Date';
// const recentTransactions = 'Recent transactions';
//
// const legalUrl = 'https://expresswages.com/terms-and-conditions/';

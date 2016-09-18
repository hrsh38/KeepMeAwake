function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 18-Sep-2016 01:15:18.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx8 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1_xoffset = [3.21798729e-12;4.13633971e-15;3.23117379e-12;8.799676e-19;5.766085e-07;5.6100936e-15;4.16667848e-17;2.65389653e-14];
x1_step1_gain = [20.6694611095978;112.767182386352;123.497696091759;1160.91555582092;2.00000115321766;2.00359826211895;14.3329698826607;34.951691423598];
x1_step1_ymin = -1;

% Layer 1
b1 = [2.0339638116041323102;-1.5653488720776471688;-1.0372498454232330634;-0.55909591985696349692;-0.21626936856487299909;-0.79237673645930351007;0.71107661558859069917;-1.0414878164514158598;-1.2198143440317528174;-1.8494838819098933236];
IW1_1 = [-0.75806260828294358411 -0.47925306059837718964 1.1532205116866465211 -0.3292032947689259581 0.45231471436110448625 -0.1395385258299370046 0.0070072792815548679002 -0.77649753717449998547;0.8694370882967673575 -1.0953160476796779399 0.42184858416448761664 -0.77753058586057011148 -0.11595757532760729569 0.80896878650095505048 -0.21366039528488739441 -0.51339697963279751214;1.1355299183111304817 0.22501290346561961253 0.60542835528504046483 0.57827512894608135152 -0.36256422094487822383 0.41639157553074124252 -0.14912726445493054706 1.0661392640687290534;0.38298723341129953246 1.0724730976269840621 -0.99046948597852779717 0.40254074826803476483 -0.96630332024519260958 0.1898536410987963774 -0.62562195121526265051 0.85950447699521015377;1.0999473686722851529 0.16546174766121554689 -0.65701575031399261917 -0.61649245270409946951 0.71502059471663070855 -0.17823913888419673501 -0.97183547885058896298 -0.57728858820163198029;-0.30558351182103021815 -1.2833462036701246411 -0.42317552482299614081 -0.033593604934741658208 -0.41711933842771103942 0.66059372290577877962 1.47778923129444828 0.17610074403565287304;0.61666113949930201343 -0.78719333015733472525 0.59886156332590267937 -0.9121655901594263316 -0.80657162269863569293 0.51076223641416618193 -0.37052777337444015027 -0.4533392166093704323;-0.97299520830764096857 -0.73423522335245938741 0.65052118813952830578 0.1873768735303696642 -0.41959303450587931428 -0.75680546218691746585 0.65190967145100298108 0.54467852471985600538;0.10366580571299474633 -0.89285780489894639445 0.96492743797007463069 0.56792372868692875265 0.74653080155666906581 -0.66668456407733500679 -1.0068499016568979165 -0.58660686776923864905;-0.69607113609858461967 -1.1420153312052263583 -0.23911327094944467841 0.82637119641968626027 0.5644102230699225009 -0.20735408107783503961 -0.28323160225658794431 0.77168763749575697286];

% Layer 2
b2 = -0.22887329110734147553;
LW2_1 = [-1.0204750684738508326 1.06677383579234486 -0.93754996950004798606 -1.189995536901158113 -1.200612118057396982 2.3358094851150550397 -0.38611488338812449683 0.56317960284670565141 -1.4463945135995930347 -0.54013454622053536092];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = logsig_apply(repmat(b2,1,Q) + LW2_1*a1);

% Output 1
y1 = a2;
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
y = bsxfun(@minus,x,settings_xoffset);
y = bsxfun(@times,y,settings_gain);
y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Positive Transfer Function
function a = logsig_apply(n)
a = 1 ./ (1 + exp(-n));
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

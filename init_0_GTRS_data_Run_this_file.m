% 文件名: init_GTRS_aero.m
% 描述: GTRS倾转旋翼机气动数据初始化脚本

disp('Loading GTRS Aerodynamic Database...');

run('init_Fuselage_Aero_Table.m'); 
run('init_Wing_Free_Table.m'); run('init_Wing_Slide_Table.m'); 
run('init_WingWake_Deflection_Table.m'); 
run('init_Horizontal_Table.m'); run('init_Horizontal_C_D_Table.m');
run('init_Vetical_1_Table.m'); run('init_Vetical_2_Table.m');

% 0. 定义单位换算系数

SampleTime = 0.005;

guidanceType = 0 ;

%----转动惯量
slugft2kgm = 1.35582; 
%----长度
ft2m = 0.3048;
m2ft = 1/ft2m;
in2m = 0.0254;
in2ft = 1/12;
%----角度
rad2deg = 180/pi;
deg2rad = pi/180;

%----重量
lb2kg = 0.4536;
%----力
lbf2N = 4.448;

%----力矩
lbfft2Nm = 1.356;

% === 1. 定义倾转机转动惯量 单位slug *ft^2
Ixx = 52795 ; Iyy = 21360 ; Izz = 66335 ;
Ixz = 1234;
K_II = [-20.5 -11.24 9.26 -1.76];

mass = 403.7; %slug 重量
g = 32.2; % ft/s^2 重力加速度
 
% ==== 2. 各部件位置坐标 单位 in
%---重心---注意中心会随倾转改变
pos_x_CG = 300; pos_y_CG = 0; pos_z_CG = 81.65;
%---短舱重心
pos_x_Nac = 291.7; pos_y_Nac = 193; pos_z_Nac = 118;
%---短舱旋转支点
pos_x_H = 300; pos_y_H = 193; pos_z_H = 100;
%---右机翼气动中心
pos_x_W = 291.7; pos_y_W = 96.6; pos_z_W = 96;

%---机身气动中心
pos_x_F = 293; pos_y_F = 0; pos_z_F = 84;
%----平尾气动中心
pos_x_HW = 560; pos_y_HW = 0; pos_z_HW = 103;
%----垂尾气动中心
pos_x_V = 570; pos_y_V = 115.69; pos_z_V = 77;

% ===== 旋翼参数
L_n = 4.667;%ft  %桨毂安装高度 
R = 12.5;  %ft  %旋翼半径

theta_0_R = 0.750; %rad 配平悬停总距
theta_0_W = 1.187; %rad 配平前飞总距
theta_0 = 40*deg2rad; %rad 桨根安装角
theta_twist = -41*deg2rad; %rad 总扭转（根部到尖部）
a_sound = 1116.45; %ft/s 声速
alpha_r0 = 0; %rad 桨叶零升迎角修正

I_b = 102.5; %桨叶挥舞惯性矩slug·ft²
c_R = 14/12; % ft 桨叶弦长 
rho = 0.002376; %(slugs/ft^3) 空气密度

% ===== 机翼参数
c_w = 5.225; %ft 机翼弦长
S_max = 56; %ft^2 最大滑流区面积
u_max = 1181/12; %ft/s 临界飞行速度
b_w = 32.17; %ft 翼展
S_w = 181; %ft^2 翼面积
i_w = 0; %rad 机翼安装角
lambda_w = -6.5*deg2rad; % rad 机翼后掠角

K_coeffs=[1.6 0]; %机翼诱导速度倍率5个数后4个为0
K_FWO = 1.4; %襟翼对旋翼下洗流的卸载系数
K_FWDF = -0.0035; %1/deg

C_Y_beta=0; C_Y_p=0; C_Y_r=0;
C_lp_C_LWP = -0.774;

% ===== 机身参数
LLANG = 0; % ft^2
DLANG = -0.5;
LBFO = -7.23; % ft^2
DBFO = -1.56; % ft^2
MBFO = 66.5; % ft^3

% ===== 平尾参数
s_HW = 50.25;  % ft^2  平尾面积
c_HW = 3.92; % ft 平尾弦长
i_H = 0; % 平尾安装角 (rad)
%  平尾诱导速度计算参数
h_HW = [-0.5838, 0.01158, 0.5967, 0.002547,-2.2519];

tau_e = 0.518; D_ke = 0.24;

%    平尾气动参数
K_HNU = 0.8;C_LHB = -0.00422;
D_WB = 1; C_MHO =0; C_MHA = 0;

% ===== 垂尾参数
S_v = 20.25; % ft^2
i_v = 0; % 垂尾安装角
D_Kr = 0.24; tau_r = 0.27;

disp('GTRS Aero Data Loaded Successfully!');
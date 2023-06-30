
%% Versuch1 Volumenstrom-Signal-Kennlinie

Ue1 = [-10; -9; -8; -7; -6; -5; -4; -3; -2; -1; 0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10]';
QLh30 = [ -6.75; -6.36; -5.84; -5.30; -4.73; -4.12; -3.40; -2.55; -1.65; -0.71; -0.01; 0.61; 1.55; 2.46; 3.30; 4.04; 4.67; 5.25; 5.81; 6.34; 6.81]';
QLd30 = [ -6.87; -6.34; -5.86; -5.31; -4.70; -4.09; -3.38; -2.55; -1.65; -0.72; -0.01; 0.63; 1.56; 2.47; 3.30; 4.05; 4.67; 5.28; 5.85; 6.36; 6.81]';


QLh20 = [ -5.43; -5.10; -4.66; -4.24; -3.80; -3.31; -2.73; -2.06; -1.33; -0.57; -0.01; 0.49; 1.24; 1.97; 2.65; 3.24; 3.73; 4.21; 4.65; 5.05; 5.43]';
QLd20 = [ -5.49; -5.10; -4.69; -4.25; -3.77; -3.30; -2.72; -2.06; -1.33; -0.57; -0.01; 0.49; 1.24; 1.97; 2.65; 3.24; 3.74; 4.21; 4.67; 5.07; 5.43]';

%% Anstieg an Ue = 5Volt bestimmen
 Q30 = 0.732*5-4.05;
 QL30 = 0.732*Ue1-Q30;

 Q20 = 0.5861*5-3.24;
 QL20 = 0.5861*Ue1-Q20;
 

%% Tabellen für 20 und 30bar

Volumenstrom_Signal_30bar = table(Ue1,QLh30,QLd30);
Volumenstrom_Signal_20bar = table(Ue1,QLh20,QLd20);

% %a

figure (Name= "1_Volumenstrom-Sginal-Kennlinie_30bar");

plot(Volumenstrom_Signal_30bar,"Ue1",["QLh30","QLd30"]);
hold on;
grid on;
plot(Ue1,QL30);

%%p = polyfit(Ue1,QLh30);

figure (Name= "1_Volumenstrom-Sginal-Kennlinie_20bar");

plot(Volumenstrom_Signal_20bar,"Ue1",["QLh20","QLd20"])
hold on;
grid on;
plot(Ue1,QL20);
disp(QL30);
disp(QL20);

%% Versuch2 Druck-Signal-Kennlinie


Ue2 = [ -0.5; -0.4; -0.3; -0.2; -0.15; -0.1; -0.08; -0.06; -0.04; -0.02; 0; 0.02; 0.04; 0.06; 0.08; 0.1; 0.15; 0.2; 0.3; 0.4; 0.5]';

pAh = [02.35;03.16;04.26;06.02;07.16;08.49;09.25;10.05;10.88;11.18;12.03;12.56;13.45;14.40;15.36;15.60;18.13;19.91;22.97;25.36;27.04]';
pAr = [02.11;02.79;03.84;05.95;07.10;08.52;09.17;09.99;10.83;11.06;11.93;12.56;13.47;14.44;15.43;15.66;18.25;20.10;23.07;25.37;27.04]';

pBh = [28.93;28.21;27.16;25.47;24.21;22.86;22.05;21.22;20.33;20.04;19.12;18.47;17.48;16.55;15.55;15.24;12.50;10.54;07.34;05.01;03.46]';
pBr = [29.01;28.45;27.59;25.70;24.61;23.27;22.53;21.70;20.85;20.58;19.60;18.90;17.83;16.80;15.77;15.40;12.56;10.48;07.22;04.99;03.46]';

for i=1:1:21
    pA(i) = (pAr(i)+pAh(i))/2;
    pB(i) = (pBr(i)+pBh(i))/2;
    pLh(i) = (pAh(i)-pBh(i));
    pLr(i) = (pAr(i)-pBr(i));
    pSh(i) = (pAh(i)+pBh(i));
    pSr(i) = (pAr(i)+pBr(i));
    
end
%% a)
figure (Name= '2a_Druck-Signal_Kennlinie+KpU');
Druck_Signal_kennlinie = table(Ue2,pLh,pLr);
KpU = (3818/50);
KpU_funktion= KpU*Ue2-7.67;

%%Näherung 4.Grades: -103.8*x^4-106.6*x^3+48.23*x^2+76.36*x-7.36

plot(Druck_Signal_kennlinie,"Ue2",["pLr","pLh"]);
hold on;
grid on;
plot(Ue2,KpU_funktion);

%% d)
figure (Name= '2d_Summendruckverlauf');
Summendruckverlauf = table(Ue2,pA,pB,pSh,pSr);
plot(Summendruckverlauf,"Ue2",["pSh","pSr","pA","pB"]);


%% Versuch3 Volumenstrom_Lastdruck_Kennlinie
U2 = [2;2;2;2;2;2;2;2]';
U5 = [5;5;5;5;5;5;5;5]';
U8 = [8,8,8,8,8,8,8,8];
plq2= [0.49;4;8;12;16;20;24;28.95];
plq5= [1.72;4;8;12;16;20;24;29.97];
plq8= [3.35;4;8;12;16;20;24;29.04];
QL2 = [1.54;1.44;1.30;1.17;1.02;0.85;0.61;0.00];
QL5 = [3.88;3.71;3.42;3.08;2.74;2.28;1.70;0.00];
QL8 = [5.78;5.71;5.23;4.70;4.10;3.40;2.47;0.00];

figure (Name = 'Volumenstrom_Lastdruck');
grid on;
% 
plot(plq2,QL2);
plot3(plq2,U2,QL2);
hold on;
plot3(plq5,U5,QL5);
hold on;
plot3(plq8,U8,QL8);
xlabel('pL');
ylabel('Ue');
zlabel('Ql');
grid on;

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\96\153","\231\78\183\113"),function(v42) if (v9(v42,2)==81) then v30=v8(v11(v42,1,2 -1 ));return "";else local v100=0;local v101;while true do if (v100==0) then v101=v10(v8(v42,16));if v30 then local v121=0;local v122;while true do if (v121==0) then v122=v13(v101,v30);v30=nil;v121=1;end if (v121==1) then return v122;end end else return v101;end break;end end end end);local function v31(v43,v44,v45) if v45 then local v102=0;local v103;while true do if (0==v102) then v103=(v43/((5 -3)^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v103-(v103%(1 -0)) ;end end else local v104=0;local v105;while true do if (v104==0) then v105=2^(v44-1) ;return (((v43%(v105 + v105))>=v105) and 1) or 0 ;end end end end local function v32() local v46=v9(v27,v29,v29);v29=v29 + 1 ;return v46;end local function v33() local v47,v48=v9(v27,v29,v29 + (4 -2) );v29=v29 + 2 ;return (v48 * 256) + v47 ;end local function v34() local v49=0;local v50;local v51;local v52;local v53;while true do if (v49==0) then v50,v51,v52,v53=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;v49=1;end if (v49==1) then return (v53 * 16777216) + (v52 * 65536) + (v51 * 256) + v50 ;end end end local function v35() local v54=v34();local v55=v34();local v56=1;local v57=(v31(v55,1,20) * (2^32)) + v54 ;local v58=v31(v55,21,31);local v59=((v31(v55,32)==1) and  -1) or 1 ;if (v58==0) then if (v57==0) then return v59 * 0 ;else local v109=0;while true do if (0==v109) then v58=1;v56=0;break;end end end elseif (v58==2047) then return ((v57==0) and (v59 * (1/(619 -(555 + 64))))) or (v59 * NaN) ;end return v16(v59,v58-1023 ) * (v56 + (v57/(2^52))) ;end local function v36(v60) local v61=0;local v62;local v63;while true do if (v61==0) then v62=nil;if  not v60 then v60=v34();if (v60==0) then return "";end end v61=1;end if (v61==2) then v63={};for v110=1, #v62 do v63[v110]=v10(v9(v11(v62,v110,v110)));end v61=3;end if (v61==1) then v62=v11(v27,v29,(v29 + v60) -1 );v29=v29 + v60 ;v61=2;end if (v61==3) then return v14(v63);end end end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v64={};local v65={};local v66={};local v67={v64,v65,nil,v66};local v68=v34();local v69={};for v77=1,v68 do local v78=0;local v79;local v80;while true do if (v78==0) then v79=v32();v80=nil;v78=1;end if (v78==1) then if (v79==1) then v80=v32()~=0 ;elseif (v79==2) then v80=v35();elseif (v79==3) then v80=v36();end v69[v77]=v80;break;end end end v67[3]=v32();for v81=1,v34() do local v82=0;local v83;while true do if (0==v82) then v83=v32();if (v31(v83,1,932 -(857 + 74) )==(568 -(367 + 201))) then local v117=0;local v118;local v119;local v120;while true do if (v117==0) then v118=v31(v83,2,3);v119=v31(v83,4,6);v117=1;end if (v117==1) then v120={v33(),v33(),nil,nil};if (v118==0) then local v124=0;while true do if (0==v124) then v120[3]=v33();v120[4]=v33();break;end end elseif (v118==1) then v120[3]=v34();elseif (v118==2) then v120[3]=v34() -(2^16) ;elseif (v118==(930 -(214 + 713))) then local v283=0;while true do if (v283==0) then v120[1 + 2 ]=v34() -(2^16) ;v120[4]=v33();break;end end end v117=2;end if (v117==2) then if (v31(v119,1 + 0 ,1)==1) then v120[2]=v69[v120[2]];end if (v31(v119,2,2)==1) then v120[3]=v69[v120[880 -(282 + 595) ]];end v117=3;end if (v117==3) then if (v31(v119,1640 -(1523 + 114) ,3 + 0 )==1) then v120[4]=v69[v120[4]];end v64[v81]=v120;break;end end end break;end end end for v84=1,v34() do v65[v84-1 ]=v39();end return v67;end local function v40(v71,v72,v73) local v74=v71[1];local v75=v71[2];local v76=v71[3];return function(...) local v86=v74;local v87=v75;local v88=v76;local v89=v38;local v90=1 -0 ;local v91= -1;local v92={};local v93={...};local v94=v20("#",...) -(1066 -(68 + 997)) ;local v95={};local v96={};for v106=0,v94 do if (v106>=v88) then v92[v106-v88 ]=v93[v106 + 1 ];else v96[v106]=v93[v106 + 1 ];end end local v97=(v94-v88) + 1 ;local v98;local v99;while true do v98=v86[v90];v99=v98[1271 -(226 + 1044) ];if (v99<=32) then if (v99<=(65 -50)) then if (v99<=7) then if (v99<=3) then if (v99<=1) then if (v99==0) then local v134=0;local v135;while true do if (v134==0) then v135=v98[2];do return v21(v96,v135,v91);end break;end end else v96[v98[2]]={};end elseif (v99>2) then v96[v98[2]]=v73[v98[3]];else local v139=v98[2];local v140,v141=v89(v96[v139](v96[v139 + 1 ]));v91=(v141 + v139) -1 ;local v142=0;for v251=v139,v91 do local v252=0;while true do if (v252==0) then v142=v142 + 1 ;v96[v251]=v140[v142];break;end end end end elseif (v99<=5) then if (v99>4) then v96[v98[2]]=v98[3];else local v145=v98[119 -(32 + 85) ];local v146=v96[v145];local v147=v96[v145 + 2 ];if (v147>0) then if (v146>v96[v145 + 1 ]) then v90=v98[3];else v96[v145 + 3 ]=v146;end elseif (v146<v96[v145 + 1 ]) then v90=v98[3];else v96[v145 + 3 ]=v146;end end elseif (v99==6) then if  not v96[v98[2]] then v90=v90 + 1 + 0 ;else v90=v98[1 + 2 ];end else v96[v98[2]]=v73[v98[3]];end elseif (v99<=11) then if (v99<=9) then if (v99==8) then local v150=v98[2];v96[v150](v21(v96,v150 + 1 ,v91));else local v151=v98[2];local v152=v96[v151 + (959 -(892 + 65)) ];local v153=v96[v151] + v152 ;v96[v151]=v153;if (v152>0) then if (v153<=v96[v151 + 1 ]) then v90=v98[3];v96[v151 + 3 ]=v153;end elseif (v153>=v96[v151 + 1 ]) then local v327=0;while true do if (v327==0) then v90=v98[3];v96[v151 + (7 -4) ]=v153;break;end end end end elseif (v99>10) then v96[v98[3 -1 ]]= #v96[v98[3]];else v96[v98[2]]=v96[v98[3]];end elseif (v99<=13) then if (v99==12) then v96[v98[2]]=v72[v98[3]];else local v160=0;local v161;local v162;local v163;local v164;while true do if (v160==0) then v161=v98[2];v162,v163=v89(v96[v161](v21(v96,v161 + 1 ,v98[4 -1 ])));v160=1;end if (v160==1) then v91=(v163 + v161) -1 ;v164=0;v160=2;end if (v160==2) then for v328=v161,v91 do local v329=0;while true do if (v329==0) then v164=v164 + 1 ;v96[v328]=v162[v164];break;end end end break;end end end elseif (v99==14) then v96[v98[352 -(87 + 263) ]]=v96[v98[3]]%v96[v98[4]] ;else local v166=v98[2];do return v96[v166](v21(v96,v166 + 1 ,v98[3]));end end elseif (v99<=(203 -(67 + 113))) then if (v99<=19) then if (v99<=17) then if (v99>(12 + 4)) then local v167=0;local v168;while true do if (0==v167) then v168=v98[2];v96[v168]=v96[v168](v21(v96,v168 + 1 ,v98[3]));break;end end else v96[v98[2]]=v98[3] + v96[v98[4]] ;end elseif (v99==(44 -26)) then for v253=v98[2],v98[3] do v96[v253]=nil;end else local v170=0;local v171;local v172;while true do if (v170==1) then for v330=v171 + 1 ,v91 do v15(v172,v96[v330]);end break;end if (v170==0) then v171=v98[2];v172=v96[v171];v170=1;end end end elseif (v99<=21) then if (v99>20) then v96[v98[2]]=v72[v98[3]];else v96[v98[2]]=v98[3] + v96[v98[4]] ;end elseif (v99==22) then v96[v98[2]]=v96[v98[3]] + v98[4] ;else local v177=0;local v178;local v179;local v180;local v181;while true do if (v177==0) then v178=v98[2 + 0 ];v179,v180=v89(v96[v178](v21(v96,v178 + 1 ,v98[3])));v177=1;end if (v177==1) then v91=(v180 + v178) -1 ;v181=0 -0 ;v177=2;end if (v177==2) then for v331=v178,v91 do local v332=0;while true do if (v332==0) then v181=v181 + 1 ;v96[v331]=v179[v181];break;end end end break;end end end elseif (v99<=27) then if (v99<=25) then if (v99==(976 -(802 + 150))) then local v182=v98[2];do return v96[v182](v21(v96,v182 + 1 ,v98[3]));end else local v183=v98[2];local v184=v96[v183];for v255=v183 + (2 -1) ,v91 do v15(v184,v96[v255]);end end elseif (v99==26) then v96[v98[2]]=v96[v98[3]] + v98[6 -2 ] ;else v90=v98[3];end elseif (v99<=29) then if (v99>28) then local v187=v98[2];local v188=v96[v187 + 2 ];local v189=v96[v187] + v188 ;v96[v187]=v189;if (v188>0) then if (v189<=v96[v187 + 1 ]) then v90=v98[3];v96[v187 + 3 ]=v189;end elseif (v189>=v96[v187 + 1 + 0 ]) then v90=v98[3];v96[v187 + 3 ]=v189;end else v96[v98[2]]=v96[v98[3]]%v98[4] ;end elseif (v99<=30) then local v192=0;local v193;local v194;while true do if (v192==0) then v193=v98[2];v194=v96[v98[3]];v192=1;end if (1==v192) then v96[v193 + 1 ]=v194;v96[v193]=v194[v98[4]];break;end end elseif (v99==31) then do return;end else local v273=0;local v274;while true do if (v273==0) then v274=v98[2];do return v21(v96,v274,v91);end break;end end end elseif (v99<=48) then if (v99<=40) then if (v99<=(1033 -(915 + 82))) then if (v99<=34) then if (v99>33) then v96[v98[2]]=v96[v98[3]][v98[4]];else v96[v98[2]]={};end elseif (v99>(99 -64)) then local v198=0;local v199;local v200;local v201;while true do if (v198==1) then v201=v96[v199 + 2 ];if (v201>0) then if (v200>v96[v199 + 1 + 0 ]) then v90=v98[3];else v96[v199 + 3 ]=v200;end elseif (v200<v96[v199 + 1 ]) then v90=v98[3];else v96[v199 + 3 ]=v200;end break;end if (0==v198) then v199=v98[2];v200=v96[v199];v198=1;end end else for v256=v98[2],v98[3] do v96[v256]=nil;end end elseif (v99<=38) then if (v99>37) then v96[v98[2]][v98[3]]=v96[v98[4]];elseif v96[v98[2]] then v90=v90 + 1 ;else v90=v98[3];end elseif (v99>39) then local v204=0;local v205;while true do if (v204==0) then v205=v98[2];v96[v205]=v96[v205](v21(v96,v205 + 1 ,v98[3]));break;end end else local v206=0;local v207;local v208;while true do if (0==v206) then v207=v98[2];v208=v96[v98[3 -0 ]];v206=1;end if (v206==1) then v96[v207 + 1 ]=v208;v96[v207]=v208[v98[4]];break;end end end elseif (v99<=44) then if (v99<=42) then if (v99>41) then v96[v98[1189 -(1069 + 118) ]]=v98[3];else local v211=0;local v212;while true do if (v211==0) then v212=v98[2];v96[v212]=v96[v212](v21(v96,v212 + 1 ,v91));break;end end end elseif (v99>43) then if  not v96[v98[2]] then v90=v90 + 1 ;else v90=v98[3];end else v96[v98[2]]=v96[v98[6 -3 ]]%v98[4] ;end elseif (v99<=46) then if (v99==45) then local v214=0;local v215;while true do if (v214==0) then v215=v98[2];v96[v215]=v96[v215]();break;end end else local v216=0;local v217;local v218;local v219;local v220;while true do if (v216==1) then v91=(v219 + v217) -1 ;v220=0 -0 ;v216=2;end if (2==v216) then for v337=v217,v91 do local v338=0;while true do if (v338==0) then v220=v220 + 1 ;v96[v337]=v218[v220];break;end end end break;end if (v216==0) then v217=v98[2];v218,v219=v89(v96[v217](v21(v96,v217 + 1 ,v91)));v216=1;end end end elseif (v99==47) then if (v96[v98[2]]==v98[4]) then v90=v90 + 1 ;else v90=v98[3];end else local v221=0;local v222;local v223;local v224;while true do if (0==v221) then v222=v87[v98[1 + 2 ]];v223=nil;v221=1;end if (v221==2) then for v339=1,v98[6 -2 ] do local v340=0;local v341;while true do if (0==v340) then v90=v90 + 1 ;v341=v86[v90];v340=1;end if (v340==1) then if (v341[1]==10) then v224[v339-1 ]={v96,v341[3]};else v224[v339-(3 -2) ]={v72,v341[3]};end v95[ #v95 + 1 ]=v224;break;end end end v96[v98[2]]=v40(v222,v223,v73);break;end if (v221==1) then v224={};v223=v18({},{[v7("\154\117\213\78\93\176\34","\77\197\42\188\32\57\213\90")]=function(v342,v343) local v344=0;local v345;while true do if (v344==0) then v345=v224[v343];return v345[1][v345[2]];end end end,[v7("\63\114\85\43\163\253\14\73\94\54","\148\96\45\59\78\212")]=function(v346,v347,v348) local v349=v224[v347];v349[1][v349[2]]=v348;end});v221=2;end end end elseif (v99<=56) then if (v99<=52) then if (v99<=50) then if (v99>(67 -(10 + 8))) then do return v96[v98[2]]();end else local v225=v98[2];local v226,v227=v89(v96[v225](v21(v96,v225 + 1 ,v91)));v91=(v227 + v225) -1 ;local v228=0;for v258=v225,v91 do local v259=0;while true do if (v259==0) then v228=v228 + 1 ;v96[v258]=v226[v228];break;end end end end elseif (v99>51) then local v229=v87[v98[3]];local v230;local v231={};v230=v18({},{[v7("\207\47\95\188\244\21\78","\210\144\112\54")]=function(v260,v261) local v262=0;local v263;while true do if (v262==0) then v263=v231[v261];return v263[1][v263[2]];end end end,[v7("\185\17\163\26\76\186\38\143\131\54","\235\230\78\205\127\59\211\72")]=function(v264,v265,v266) local v267=0;local v268;while true do if (v267==0) then v268=v231[v265];v268[1][v268[2]]=v266;break;end end end});for v269=3 -2 ,v98[4] do v90=v90 + 1 ;local v270=v86[v90];if (v270[1]==10) then v231[v269-1 ]={v96,v270[3]};else v231[v269-1 ]={v72,v270[3]};end v95[ #v95 + 1 ]=v231;end v96[v98[2]]=v40(v229,v230,v73);else v96[v98[2]]=v96[v98[3]];end elseif (v99<=54) then if (v99>53) then v90=v98[3];else do return v96[v98[2]]();end end elseif (v99==55) then local v236=0;local v237;local v238;local v239;local v240;while true do if (v236==0) then v237=v98[444 -(416 + 26) ];v238,v239=v89(v96[v237](v96[v237 + 1 ]));v236=1;end if (v236==2) then for v356=v237,v91 do local v357=0;while true do if (v357==0) then v240=v240 + 1 ;v96[v356]=v238[v240];break;end end end break;end if (v236==1) then v91=(v239 + v237) -1 ;v240=0;v236=2;end end else v96[v98[2]]=v96[v98[3]]%v96[v98[4]] ;end elseif (v99<=60) then if (v99<=58) then if (v99>57) then local v242=0;local v243;while true do if (v242==0) then v243=v98[2];v96[v243]=v96[v243](v21(v96,v243 + 1 ,v91));break;end end elseif v96[v98[2]] then v90=v90 + 1 ;else v90=v98[3];end elseif (v99==59) then if (v96[v98[2]]==v98[4]) then v90=v90 + 1 ;else v90=v98[3];end else do return;end end elseif (v99<=62) then if (v99==(194 -133)) then local v244=v98[2];v96[v244]=v96[v244]();else local v246=0;local v247;while true do if (v246==0) then v247=v98[2];v96[v247](v21(v96,v247 + 1 ,v91));break;end end end elseif (v99<=63) then v96[v98[2]][v98[3]]=v96[v98[4]];elseif (v99>(28 + 36)) then v96[v98[2]]= #v96[v98[3]];else v96[v98[2]]=v96[v98[4 -1 ]][v98[4]];end v90=v90 + 1 ;end end;end return v40(v39(),{},v28)(...);end return v23("LOL!0D3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E7365727403053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C00243Q0012073Q00013Q0020405Q0002001207000100013Q002040000100010003001207000200013Q002040000200020004001207000300053Q002Q060003000A0001000100041B3Q000A0001001207000300063Q002040000400030007001207000500083Q002040000500050009001207000600083Q00204000060006000A00063000073Q000100062Q000A3Q00064Q000A8Q000A3Q00044Q000A3Q00014Q000A3Q00024Q000A3Q00053Q001207000800013Q00204000080008000B0012070009000C3Q001207000A000D3Q000630000B0001000100052Q000A3Q00074Q000A3Q00094Q000A3Q00084Q000A3Q000A4Q000A3Q000B4Q0033000C000B4Q0032000C00016Q000C6Q001F3Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q002100025Q00122A000300014Q000B00045Q00122A000500013Q0004240003002100012Q000C00076Q0033000800024Q000C000900014Q000C000A00024Q000C000B00034Q000C000C00044Q0033000D6Q0033000E00063Q00201A000F000600012Q0017000C000F4Q003A000B3Q00022Q000C000C00034Q000C000D00044Q0033000E00014Q000B000F00014Q000E000F0006000F001014000F0001000F2Q000B001000014Q000E00100006001000101400100001001000201A0010001000012Q0017000D00104Q0031000C6Q003A000A3Q000200201C000A000A00022Q00370009000A4Q000800073Q00010004090003000500012Q000C000300054Q0033000400024Q000F000300046Q00036Q001F3Q00017Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001C3Q0006305Q000100012Q00158Q000C000100014Q000C000200024Q000C000300024Q002100046Q000C000500034Q003300066Q0023000700074Q0017000500074Q001900043Q000100204000040004000100122A000500024Q001100030005000200122A000400034Q0017000200044Q003A00013Q000200262F000100180001000400041B3Q001800012Q003300016Q002100026Q000F000100026Q00015Q00041B3Q001B00012Q000C000100044Q0032000100016Q00016Q001F3Q00013Q00013Q000A3Q0003073Q0067657466656E7603043Q006C696E6B03213Q00D9D7CF35F5E18851C1C2C831E3B9CE109FC0D4282QA9C6099ED7CD72EBB5C4398703083Q007EB1A3BB4586DBA7030A3Q006C6F6164737472696E6703043Q0067616D65030C3Q00482Q74704765744173796E6303903Q002BD93ED5EF798265C2F530D964C2F537C53FC7E930C838C6F32DD92FCBE86DCE25C8B301DA22D2A4719A2D97A534C565C1AD72987FC1AC739F2BC3A47B9878C4F8769F2B91F8719C2FC4F9229D29C7A96CDF2BD2B322C879C1F974952CC4FD279B7DC3A8749A7D9CA970987DC7AF749579C6AF74C87CC6A975CC7CC7AB6CE62FDCB971987895EF3ADE3EC0F16DC13FC403053Q009C43AD4AA5026Q00F03F01163Q0006253Q001400013Q00041B3Q00140001001207000100014Q003D0001000100022Q000C00025Q00122A000300033Q00122A000400044Q0011000200040002001026000100020002001207000100053Q001207000200063Q0020270002000200072Q000C00045Q00122A000500083Q00122A000600094Q0017000400064Q003100026Q003A00013Q00022Q003D00010001000200041B3Q0015000100204000013Q000A2Q001F3Q00017Q00",v17(),...);
-- ⚠️ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\10\4","\80\36\42\174\21"),function(v42) if (v9(v42,2)==81) then local v93=0;while true do if (0==v93) then v30=v8(v11(v42,1,2 -1 ));return "";end end else local v94=0;local v95;while true do if (v94==0) then v95=v10(v8(v42,16));if v30 then local v123=0;local v124;while true do if (v123==0) then v124=v13(v95,v30);v30=nil;v123=1;end if (v123==1) then return v124;end end else return v95;end break;end end end end);local function v31(v43,v44,v45) if v45 then local v96=0;local v97;while true do if (0==v96) then v97=(v43/((5 -3)^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v97-(v97%(1 -0)) ;end end else local v98=0;local v99;while true do if (v98==0) then v99=2^(v44-1) ;return (((v43%(v99 + v99))>=v99) and 1) or 0 ;end end end end local function v32() local v46=0;local v47;while true do if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + (2 -1) ;v46=1;end if (v46==1) then return v47;end end end local function v33() local v48=0;local v49;local v50;while true do if (v48==1) then return (v50 * 256) + v49 ;end if (0==v48) then v49,v50=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;v48=1;end end end local function v34() local v51,v52,v53,v54=v9(v27,v29,v29 + 3 );v29=v29 + (623 -(555 + 64)) ;return (v54 * 16777216) + (v53 * 65536) + (v52 * 256) + v51 ;end local function v35() local v55=0;local v56;local v57;local v58;local v59;local v60;local v61;while true do if (1==v55) then v58=1;v59=(v31(v57,1,20) * (2^(963 -(857 + 74)))) + v56 ;v55=2;end if (v55==2) then v60=v31(v57,21,31);v61=((v31(v57,32)==1) and  -1) or 1 ;v55=3;end if (v55==0) then v56=v34();v57=v34();v55=1;end if (v55==3) then if (v60==0) then if (v59==0) then return v61 * 0 ;else local v125=0;while true do if (v125==0) then v60=1;v58=0;break;end end end elseif (v60==2047) then return ((v59==0) and (v61 * (1/0))) or (v61 * NaN) ;end return v16(v61,v60-1023 ) * (v58 + (v59/(2^(620 -(367 + 201))))) ;end end end local function v36(v62) local v63=0;local v64;local v65;while true do if (v63==0) then v64=nil;if  not v62 then v62=v34();if (v62==0) then return "";end end v63=1;end if (v63==2) then v65={};for v103=1, #v64 do v65[v103]=v10(v9(v11(v64,v103,v103)));end v63=3;end if (1==v63) then v64=v11(v27,v29,(v29 + v62) -1 );v29=v29 + v62 ;v63=2;end if (v63==3) then return v14(v65);end end end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v66=0;local v67;local v68;local v69;local v70;local v71;local v72;while true do if (2==v66) then for v105=1,v34() do local v106=v32();if (v31(v106,1,1 + 0 )==0) then local v119=0;local v120;local v121;local v122;while true do if (v119==1) then v122={v33(),v33(),nil,nil};if (v120==0) then local v128=0;while true do if (0==v128) then v122[3 + 0 ]=v33();v122[4]=v33();break;end end elseif (v120==1) then v122[3]=v34();elseif (v120==2) then v122[3 -0 ]=v34() -(2^16) ;elseif (v120==3) then v122[3]=v34() -(2^16) ;v122[4]=v33();end v119=2;end if (v119==3) then if (v31(v121,3,3)==1) then v122[1274 -(226 + 1044) ]=v72[v122[4]];end v67[v105]=v122;break;end if (v119==2) then if (v31(v121,1,1)==1) then v122[2]=v72[v122[2]];end if (v31(v121,2,1067 -(68 + 997) )==1) then v122[3]=v72[v122[3]];end v119=3;end if (0==v119) then v120=v31(v106,2,3);v121=v31(v106,4,6);v119=1;end end end end for v107=1,v34() do v68[v107-1 ]=v39();end return v70;end if (v66==1) then v71=v34();v72={};for v109=1,v71 do local v110=0;local v111;local v112;while true do if (v110==1) then if (v111==1) then v112=v32()~=0 ;elseif (v111==(929 -(214 + 713))) then v112=v35();elseif (v111==3) then v112=v36();end v72[v109]=v112;break;end if (v110==0) then v111=v32();v112=nil;v110=1;end end end v70[3]=v32();v66=2;end if (v66==0) then v67={};v68={};v69={};v70={v67,v68,nil,v69};v66=1;end end end local function v40(v73,v74,v75) local v76=v73[1];local v77=v73[2];local v78=v73[3];return function(...) local v79=v76;local v80=v77;local v81=v78;local v82=v38;local v83=4 -3 ;local v84= -1;local v85={};local v86={...};local v87=v20("#",...) -(118 -(32 + 85)) ;local v88={};local v89={};for v100=0,v87 do if (v100>=v81) then v85[v100-v81 ]=v86[v100 + 1 ];else v89[v100]=v86[v100 + 1 ];end end local v90=(v87-v81) + 1 ;local v91;local v92;while true do local v101=0;while true do if (v101==0) then v91=v79[v83];v92=v91[1];v101=1;end if (v101==1) then if (v92<=31) then if (v92<=(15 + 0)) then if (v92<=7) then if (v92<=3) then if (v92<=1) then if (v92>0) then local v141=0;local v142;local v143;local v144;while true do if (v141==0) then v142=v80[v91[3]];v143=nil;v141=1;end if (v141==2) then for v317=1,v91[4] do local v318=0;local v319;while true do if (v318==0) then v83=v83 + 1 ;v319=v79[v83];v318=1;end if (v318==1) then if (v319[1]==43) then v144[v317-1 ]={v89,v319[3]};else v144[v317-1 ]={v74,v319[3]};end v88[ #v88 + 1 ]=v144;break;end end end v89[v91[2]]=v40(v142,v143,v75);break;end if (1==v141) then v144={};v143=v18({},{[v7("\113\47\62\116\74\21\47","\26\46\112\87")]=function(v320,v321) local v322=0;local v323;while true do if (v322==0) then v323=v144[v321];return v323[1][v323[2]];end end end,[v7("\134\28\165\113\168\182\75\176\188\59","\212\217\67\203\20\223\223\37")]=function(v324,v325,v326) local v327=0;local v328;while true do if (v327==0) then v328=v144[v325];v328[1][v328[2]]=v326;break;end end end});v141=2;end end else local v145=0;local v146;local v147;local v148;local v149;while true do if (v145==2) then for v329=v146,v84 do local v330=0;while true do if (v330==0) then v149=v149 + 1 ;v89[v329]=v147[v149];break;end end end break;end if (1==v145) then v84=(v148 + v146) -1 ;v149=0;v145=2;end if (0==v145) then v146=v91[3 -1 ];v147,v148=v82(v89[v146](v89[v146 + 1 ]));v145=1;end end end elseif (v92>2) then local v150=0;local v151;local v152;local v153;while true do if (v150==1) then v153=v89[v151 + 2 ];if (v153>0) then if (v152>v89[v151 + 1 ]) then v83=v91[3];else v89[v151 + 3 ]=v152;end elseif (v152<v89[v151 + (1 -0) ]) then v83=v91[3];else v89[v151 + 3 ]=v152;end break;end if (v150==0) then v151=v91[2];v152=v89[v151];v150=1;end end else v89[v91[2]]=v91[3] + v89[v91[4]] ;end elseif (v92<=5) then if (v92>(354 -(87 + 263))) then v89[v91[2]]= #v89[v91[3]];else local v156=0;local v157;while true do if (v156==0) then v157=v91[2];v89[v157](v21(v89,v157 + 1 ,v84));break;end end end elseif (v92==6) then v89[v91[2]]=v75[v91[3]];else v89[v91[2]]=v89[v91[3]][v91[184 -(67 + 113) ]];end elseif (v92<=11) then if (v92<=9) then if (v92==8) then v83=v91[3];else local v163=0;local v164;local v165;while true do if (v163==0) then v164=v91[2];v165=v89[v164];v163=1;end if (v163==1) then for v331=v164 + 1 + 0 ,v84 do v15(v165,v89[v331]);end break;end end end elseif (v92==10) then local v166=0;local v167;while true do if (v166==0) then v167=v91[2];v89[v167](v21(v89,v167 + 1 ,v84));break;end end else v89[v91[2]]=v89[v91[3]]%v91[4] ;end elseif (v92<=13) then if (v92==12) then for v257=v91[4 -2 ],v91[3] do v89[v257]=nil;end else v89[v91[2]]=v91[3] + v89[v91[4]] ;end elseif (v92==(11 + 3)) then if (v89[v91[7 -5 ]]==v91[4]) then v83=v83 + 1 ;else v83=v91[3];end else v89[v91[2]]();end elseif (v92<=(975 -(802 + 150))) then if (v92<=19) then if (v92<=17) then if (v92>(42 -26)) then local v170=0;local v171;while true do if (v170==0) then v171=v91[2];v89[v171]=v89[v171](v21(v89,v171 + 1 ,v84));break;end end else local v172=v91[2];do return v89[v172](v21(v89,v172 + 1 ,v91[3]));end end elseif (v92>(32 -14)) then v89[v91[2]]=v89[v91[3]]%v91[4] ;else v89[v91[2 + 0 ]]=v89[v91[1000 -(915 + 82) ]]%v89[v91[4]] ;end elseif (v92<=21) then if (v92>20) then local v175=0;local v176;local v177;local v178;while true do if (2==v175) then for v332=1,v91[4] do local v333=0;local v334;while true do if (v333==1) then if (v334[1]==(121 -78)) then v178[v332-(1 + 0) ]={v89,v334[3]};else v178[v332-1 ]={v74,v334[3]};end v88[ #v88 + 1 ]=v178;break;end if (v333==0) then v83=v83 + 1 ;v334=v79[v83];v333=1;end end end v89[v91[2 -0 ]]=v40(v176,v177,v75);break;end if (0==v175) then v176=v80[v91[3]];v177=nil;v175=1;end if (v175==1) then v178={};v177=v18({},{[v7("\133\178\161\220\190\136\176","\178\218\237\200")]=function(v335,v336) local v337=0;local v338;while true do if (v337==0) then v338=v178[v336];return v338[1][v338[2]];end end end,[v7("\137\138\232\213\161\188\232\212\179\173","\176\214\213\134")]=function(v339,v340,v341) local v342=0;local v343;while true do if (v342==0) then v343=v178[v340];v343[1][v343[2]]=v341;break;end end end});v175=2;end end else do return;end end elseif (v92>22) then local v179=v91[2];local v180,v181=v82(v89[v179](v21(v89,v179 + 1 ,v84)));v84=(v181 + v179) -1 ;local v182=1187 -(1069 + 118) ;for v259=v179,v84 do local v260=0;while true do if (v260==0) then v182=v182 + (2 -1) ;v89[v259]=v180[v182];break;end end end else v89[v91[2]]();end elseif (v92<=27) then if (v92<=25) then if (v92>24) then local v183=v91[2];local v184,v185=v82(v89[v183](v21(v89,v183 + 1 ,v84)));v84=(v185 + v183) -1 ;local v186=0;for v261=v183,v84 do local v262=0;while true do if (0==v262) then v186=v186 + (1 -0) ;v89[v261]=v184[v186];break;end end end else local v187=0;local v188;local v189;local v190;local v191;while true do if (v187==1) then v84=(v190 + v188) -1 ;v191=0;v187=2;end if (v187==0) then v188=v91[1 + 1 ];v189,v190=v82(v89[v188](v89[v188 + 1 ]));v187=1;end if (2==v187) then for v348=v188,v84 do local v349=0;while true do if (v349==0) then v191=v191 + 1 ;v89[v348]=v189[v191];break;end end end break;end end end elseif (v92==26) then if v89[v91[3 -1 ]] then v83=v83 + 1 ;else v83=v91[3];end else local v192=0;local v193;local v194;while true do if (0==v192) then v193=v91[2 + 0 ];v194=v89[v91[3]];v192=1;end if (v192==1) then v89[v193 + 1 ]=v194;v89[v193]=v194[v91[4]];break;end end end elseif (v92<=29) then if (v92>28) then local v195=0;local v196;local v197;local v198;local v199;while true do if (v195==0) then v196=v91[2];v197,v198=v82(v89[v196](v21(v89,v196 + 1 ,v91[3])));v195=1;end if (v195==1) then v84=(v198 + v196) -1 ;v199=0;v195=2;end if (v195==2) then for v350=v196,v84 do local v351=0;while true do if (v351==0) then v199=v199 + 1 ;v89[v350]=v197[v199];break;end end end break;end end elseif  not v89[v91[2]] then v83=v83 + 1 ;else v83=v91[3];end elseif (v92>(821 -(368 + 423))) then v89[v91[2]]=v75[v91[3]];else local v202=0;local v203;local v204;local v205;while true do if (v202==1) then v205=v89[v203] + v204 ;v89[v203]=v205;v202=2;end if (2==v202) then if (v204>0) then if (v205<=v89[v203 + 1 ]) then local v375=0;while true do if (v375==0) then v83=v91[3];v89[v203 + 3 ]=v205;break;end end end elseif (v205>=v89[v203 + 1 ]) then local v376=0;while true do if (v376==0) then v83=v91[9 -6 ];v89[v203 + 3 ]=v205;break;end end end break;end if (v202==0) then v203=v91[2];v204=v89[v203 + 2 ];v202=1;end end end elseif (v92<=47) then if (v92<=39) then if (v92<=35) then if (v92<=(51 -(10 + 8))) then if (v92>32) then v89[v91[2]]=v74[v91[3]];else local v208=0;local v209;while true do if (v208==0) then v209=v91[2];v89[v209]=v89[v209](v21(v89,v209 + 1 ,v84));break;end end end elseif (v92==34) then do return v89[v91[2]]();end else local v210=v91[2];do return v21(v89,v210,v84);end end elseif (v92<=(142 -105)) then if (v92==(478 -(416 + 26))) then if (v89[v91[2]]==v91[12 -8 ]) then v83=v83 + 1 ;else v83=v91[3];end else local v211=0;local v212;local v213;local v214;while true do if (v211==0) then v212=v91[2];v213=v89[v212 + 2 ];v211=1;end if (v211==2) then if (v213>0) then if (v214<=v89[v212 + 1 ]) then v83=v91[2 + 1 ];v89[v212 + 3 ]=v214;end elseif (v214>=v89[v212 + 1 ]) then local v379=0;while true do if (v379==0) then v83=v91[3];v89[v212 + 3 ]=v214;break;end end end break;end if (v211==1) then v214=v89[v212] + v213 ;v89[v212]=v214;v211=2;end end end elseif (v92>38) then v89[v91[2]]=v89[v91[4 -1 ]] + v91[4] ;else v83=v91[3];end elseif (v92<=43) then if (v92<=41) then if (v92>40) then v89[v91[2]]=v89[v91[3]] + v91[4] ;else local v218=0;local v219;local v220;while true do if (v218==0) then v219=v91[2];v220=v89[v219];v218=1;end if (v218==1) then for v352=v219 + 1 ,v84 do v15(v220,v89[v352]);end break;end end end elseif (v92>(480 -(145 + 293))) then v89[v91[2]]=v89[v91[3]];else v89[v91[2]]=v74[v91[3]];end elseif (v92<=45) then if (v92==44) then local v225=0;local v226;while true do if (v225==0) then v226=v91[2];v89[v226]=v89[v226](v21(v89,v226 + 1 ,v91[3]));break;end end else do return v89[v91[2]]();end end elseif (v92>46) then if v89[v91[2]] then v83=v83 + 1 ;else v83=v91[433 -(44 + 386) ];end elseif  not v89[v91[2]] then v83=v83 + 1 ;else v83=v91[3];end elseif (v92<=55) then if (v92<=(1537 -(998 + 488))) then if (v92<=49) then if (v92>48) then v89[v91[2]]= #v89[v91[3]];else v89[v91[2]]=v89[v91[3]];end elseif (v92==(16 + 34)) then v89[v91[2]]={};else local v231=0;local v232;local v233;while true do if (v231==1) then v89[v232 + 1 ]=v233;v89[v232]=v233[v91[4]];break;end if (v231==0) then v232=v91[2 + 0 ];v233=v89[v91[3]];v231=1;end end end elseif (v92<=53) then if (v92==(824 -(201 + 571))) then local v234=0;local v235;while true do if (v234==0) then v235=v91[2];do return v21(v89,v235,v84);end break;end end else local v236=0;local v237;local v238;local v239;while true do if (v236==1) then v239=v89[v237 + 2 ];if (v239>0) then if (v238>v89[v237 + 1 ]) then v83=v91[3];else v89[v237 + (1141 -(116 + 1022)) ]=v238;end elseif (v238<v89[v237 + 1 ]) then v83=v91[3];else v89[v237 + 3 ]=v238;end break;end if (v236==0) then v237=v91[2];v238=v89[v237];v236=1;end end end elseif (v92>54) then do return;end else v89[v91[2]]=v91[3];end elseif (v92<=59) then if (v92<=57) then if (v92>56) then v89[v91[2]]=v91[3];else v89[v91[2]]=v89[v91[3]]%v89[v91[4]] ;end elseif (v92>58) then local v245=0;local v246;while true do if (v245==0) then v246=v91[2];do return v89[v246](v21(v89,v246 + 1 ,v91[3]));end break;end end else for v263=v91[2],v91[3] do v89[v263]=nil;end end elseif (v92<=61) then if (v92==60) then v89[v91[2]]={};else v89[v91[2]]=v89[v91[3]][v91[4]];end elseif (v92>62) then local v250=0;local v251;while true do if (v250==0) then v251=v91[2];v89[v251]=v89[v251](v21(v89,v251 + 1 ,v91[3]));break;end end else local v252=0;local v253;local v254;local v255;local v256;while true do if (v252==1) then v84=(v255 + v253) -1 ;v256=0;v252=2;end if (v252==2) then for v353=v253,v84 do local v354=0;while true do if (v354==0) then v256=v256 + 1 ;v89[v353]=v254[v256];break;end end end break;end if (v252==0) then v253=v91[2];v254,v255=v82(v89[v253](v21(v89,v253 + 1 ,v91[3])));v252=1;end end end v83=v83 + 1 ;break;end end end end;end return v40(v39(),{},v28)(...);end return v23("LOL!0D3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E7365727403053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C00243Q0012063Q00013Q0020075Q0002001206000100013Q002007000100010003001206000200013Q002007000200020004001206000300053Q00062E0003000A000100010004083Q000A0001001206000300063Q002007000400030007001206000500083Q002007000500050009001206000600083Q00200700060006000A00061500073Q000100062Q002B3Q00064Q002B8Q002B3Q00044Q002B3Q00014Q002B3Q00024Q002B3Q00053Q001206000800013Q00200700080008000B0012060009000C3Q001206000A000D3Q000615000B0001000100052Q002B3Q00074Q002B3Q00094Q002B3Q00084Q002B3Q000A4Q002B3Q000B4Q0030000C000B4Q002D000C00014Q0023000C6Q00373Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q003C00025Q001236000300014Q000500045Q001236000500013Q0004350003002100012Q002A00076Q0030000800024Q002A000900014Q002A000A00024Q002A000B00034Q002A000C00044Q0030000D6Q0030000E00063Q002027000F000600012Q003E000C000F4Q0020000B3Q00022Q002A000C00034Q002A000D00044Q0030000E00014Q0005000F00014Q0038000F0006000F00100D000F0001000F2Q0005001000014Q003800100006001000100D0010000100100020270010001000012Q003E000D00104Q0019000C6Q0020000A3Q000200200B000A000A00024Q0009000A4Q000400073Q000100041E0003000500012Q002A000300054Q0030000400024Q0010000300044Q002300036Q00373Q00017Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001C3Q0006155Q000100012Q00218Q002A000100014Q002A000200024Q002A000300024Q003C00046Q002A000500034Q003000066Q000C000700074Q003E000500074Q002800043Q0001002007000400040001001236000500024Q002C000300050002001236000400034Q003E000200044Q002000013Q000200262400010018000100040004083Q001800012Q003000016Q003C00026Q0010000100024Q002300015Q0004083Q001B00012Q002A000100044Q002D000100014Q002300016Q00373Q00013Q00013Q00063Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403213Q00D9D7CF35F5E18851C1C2C831E3B9CE109FC0D4282QA9C6099EC5F57DEB9CD347DF03083Q007EB1A3BB4586DBA7026Q00F03F010F3Q00061A3Q000D00013Q0004083Q000D0001001206000100013Q001206000200023Q0020330002000200032Q002A00045Q001236000500043Q001236000600054Q003E000400064Q001900026Q002000013Q00022Q000F0001000100010004083Q000E000100200700013Q00062Q00373Q00017Q00",v17(),...);
-- ⚠️ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--
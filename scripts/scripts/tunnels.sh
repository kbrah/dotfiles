#!/bin/bash


sudo ssh f158783@172.17.0.12 -L 4002:psrvfwfimkeh01.palvelu.verkko:80  \
  -L 10001:fimtestensemble.tays.fi:57772 \
  -L 1451:psrvfwsql4clu3.palvelu.verkko:1451 \
  -L 1521:psrvflora10x-vip.tays.fi:1521 \
  -L 1522:psrvflrac4x-vip.tays.fi:1521 \
  -L 4001:psrvfwfimkeh01.palvelu.verkko:3389 \
  -L 4002:psrvfwfimkeh01.palvelu.verkko:80 \
  -L 4003:psrvfwfimkeh01.palvelu.verkko:443 \
  -L 4011:psrvfwlaketest.palvelu.verkko:3389 \
  -L 4012:psrvfwlaketest2.palvelu.verkko:3389 \
  -L 4013:psrvwlasktst.palvelu.verkko:3389 \
  -L 4014:psrvpwfimtest.palvelu.verkko:3389 \
  -L 4021:psrvfwtute1.palvelu.verkko:3389 \
  -L 4022:psrvfwtute2.palvelu.verkko:3389 \
  -L 4023:psrvfwlsktut01.palvelu.verkko:3389 \
  -L 4030:psrvfwesb.palvelu.verkko:3389 \
  -L 4031:psrvfwesb01.palvelu.verkko:3389 \
  -L 4032:psrvfwesb02.palvelu.verkko:3389 \
  -L 4033:psrvfwesb03.palvelu.verkko:3389 \
  -L 4034:psrvfwwebapi01.palvelu.verkko:3389 \
  -L 4035:psrvfwwebapi02.palvelu.verkko:3389 \
  -L 4036:psrvfwwebapi03.palvelu.verkko:3389 \
  -L 4037:psrvfwlabonweb.palvelu.verkko:3389 \
  -L 4038:10.25.201.239:3389 \
  -L 4039:psrvfwosasweb.palvelu.verkko:3389 \
  -L 4040:psrvfwlaskutus.palvelu.verkko:3389 \
  -L 4041:psrvfwsov1.palvelu.verkko:3389 \
  -L 4042:psrvfwsov2.palvelu.verkko:3389 \
  -L 4043:psrvfwanalys1.palvelu.verkko:3389 \
  -L 4044:psrvfwanalys2.palvelu.verkko:3389 \
  -L 4051:psrvfw01.palvelu.verkko:3389 \
  -L 4052:psrvfw02.palvelu.verkko:3389 \
  -L 5001:psrvfwlaketest.palvelu.verkko:3389 \
  -L 5002:psrvfwlaketest.palvelu.verkko:443 \
  -L 5003:psrvfwlaketest.palvelu.verkko:80 \
  -L 5341:psrvfwjenkins.palvelu.verkko:5341 \
  -L 6001:psrvflwebtest.tays.fi:80 \
  -L 6002:psrvflwebtest.tays.fi:443 \
  -L portaalitesti.fimlabpalvelu.fi:80:portaalitesti.fimlabpalvelu.fi:80 \
  -L portaalitesti.fimlabpalvelu.fi:443:portaalitesti.fimlabpalvelu.fi:443 \
  -L 7001:psrvfwjenkins.palvelu.verkko:3389 \
  -L 7990:psrvfwjenkins.palvelu.verkko:7990 \
  -L 7999:psrvfwjenkins.palvelu.verkko:7999 \
  -L psrvfwjenkins:8084:psrvfwjenkins.palvelu.verkko:8080 \
  -L 8085:psrvfljenkins01.tays.fi:8080 \
  -L 81:psrvfwjenkins.palvelu.verkko:81 \
  -L 82:psrvfwjenkins.palvelu.verkko:82 \
  -L 9000:psrvfwjenkins.palvelu.verkko:9000 \
  -L tiketti.fimlab.fi:80:tiketti.fimlab.fi:80 \
  -L tiketti.fimlab.fi:443:tiketti.fimlab.fi:443 -tt &

  

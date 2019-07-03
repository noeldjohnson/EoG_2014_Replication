use "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\State data cleaned.dta", clear

/* BEGIN NEW STUFF */

g pubshemp = (pcc/pccpub)/lf
label var pubshemp "Fed, state, local govt share of labor force"

replace corrate = corrate[_n-7] if (year == 2007) & (fips == fips[_n-7])

g pubshemp70 = pubshemp[_n-35] if (year == 2007) & (fips == fips[_n-35])
label var pubshemp70 "Fed, state, local govt share of labor force in 1972"

g govtot70 = govtot[_n-35] if (year == 2007) & (fips == fips[_n-35])
label var govtot70  "SL total spending (% of personal income) in 1972"

g goved70 = goved[_n-35] if (year == 2007) & (fips == fips[_n-35])
label var goved70   "SL education spending (% of personal income) in 1972"

g govcap70 = govcap[_n-35] if (year == 2007) & (fips == fips[_n-35])
label var govcap70  "SL capital spending (% of personal income) in 1972"
g govcap85 = govcap[_n-22] if (year == 2007) & (fips == fips[_n-22])
label var govcap85  "SL capital spending (% of personal income) in 1985"

g govcon70 = govcon1[_n-35] if (year == 2007) & (fips == fips[_n-35])
label var govcon70 "SL total - capital (% of personal income) in 1972"
g govcon85 = govcon1[_n-22] if (year == 2007) & (fips == fips[_n-22])
label var govcon85 "SL total - capital (% of personal income) in 1985"

g govconnoed70 = govtot[_n-35] - goved[_n-35] - govcap[_n-35] if (year == 2007) & (fips == fips[_n-32])
label var govconnoed70 "SL total – education - capital (% of personal income) in 1972"

g taxburden70 = taxburden[_n-35] if (year == 2007) & (fips == fips[_n-35])
label var taxburden70 "SL tax burden (% of personal income) in 1972"
g taxburden85 = taxburden[_n-22] if (year == 2007) & (fips == fips[_n-22])
label var taxburden85 "SL tax burden (% of personal income) in 1985"

/* END OF NEW STUFF */

g sch12pl40 = sch12pl[_n-67]        if (year == 2007) & (fips == fips[_n-67])    
label var sch12pl40 "Percentage of 25+ pop with 12 or more years of schooling in 1940"
g sch12pl50 = sch12pl[_n-57]        if (year == 2007) & (fips == fips[_n-57])    
label var sch12pl50 "Percentage of 25+ pop with 12 or more years of schooling in 1950"
g sch12pl60 = sch12pl[_n-47]        if (year == 2007) & (fips == fips[_n-47])    
label var sch12pl60 "Percentage of 25+ pop with 12 or more years of schooling in 1960"

g sch16pl60 = sch16pl[_n-47]        if (year == 2007) & (fips == fips[_n-47])    
label var sch16pl60 "Percentage of 25+ pop with 16+ years of schooling in 1960"
g sch16pl70 = sch16pl[_n-37]        if (year == 2007) & (fips == fips[_n-37])    
label var sch16pl70 "Percentage of 25+ pop with 16+ years of schooling in 1970"
g sch16pl80 = sch16pl[_n-27]        if (year == 2007) & (fips == fips[_n-27])    
label var sch16pl80 "Percentage of 25+ pop with 16+ years of schooling in 1980"
g sch16pl90 = sch16pl[_n-17]        if (year == 2007) & (fips == fips[_n-17])    
label var sch16pl90 "Percentage of 25+ pop with 16+ years of schooling in 1990"

g sch0_1260 = sch0_12[_n-45]        if (year == 2007) & (fips == fips[_n-47])    
label var sch0_1260 "Percentage of 25+ pop with 0-12 years of schooling in 1960"
g sch0_1270 = sch0_12[_n-37]        if (year == 2007) & (fips == fips[_n-37])    
label var sch0_1270 "Percentage of 25+ pop with 0-12 years of schooling in 1970"
g sch0_1280 = sch0_12[_n-27]        if (year == 2007) & (fips == fips[_n-27])    
label var sch0_1280 "Percentage of 25+ pop with 0-12 years of schooling in 1980"
g sch0_1290 = sch0_12[_n-17]        if (year == 2007) & (fips == fips[_n-17])    
label var sch0_1290 "Percentage of 25+ pop with 0-12 years of schooling in 1990"

g elf00 = elf[_n-77]                if (year == 2007) & (fips == fips[_n-77])    
label var elf00 "Enthnolinguistic Fractionalization in 1900"
g elf40 = elf[_n-67]                if (year == 2007) & (fips == fips[_n-67])    
label var elf40 "Enthnolinguistic Fractionalization in 1940"
g elf50 = elf[_n-57]                if (year == 2007) & (fips == fips[_n-57])    
label var elf50 "Enthnolinguistic Fractionalization in 1950"
g elf60 = elf[_n-47]                if (year == 2007) & (fips == fips[_n-47])    
label var elf60 "Enthnolinguistic Fractionalization in 1960"
replace elf00 = elf60 if fips == 2
replace elf40 = elf60 if fips == 2
replace elf50 = elf60 if fips == 2
replace elf00 = elf60 if fips == 15
replace elf40 = elf60 if fips == 15
replace elf50 = elf60 if fips == 15

g elfnow50 = elfnow[_n-57]          if (year == 2007) & (fips == fips[_n-57])    
label var elfnow50 "Enthnolinguistic Fractionalization no white in 1950"
g elfnow60 = elfnow[_n-47]          if (year == 2007) & (fips == fips[_n-47])    
label var elfnow60 "Enthnolinguistic Fractionalization no white in 1960"
g elfnow70 = elfnow[_n-37]          if (year == 2007) & (fips == fips[_n-37])    
label var elfnow70 "Enthnolinguistic Fractionalization no white in 1970"
replace elfnow50 = elfnow60 if fips == 2
replace elfnow50 = elfnow60 if fips == 15

g blackpop00 = blackpop[_n-77]      if (year == 2007) & (fips == fips[_n-77])    
label var blackpop00 "Percentage of black population in 1900"
g blackpop40 = blackpop[_n-67]      if (year == 2007) & (fips == fips[_n-67])    
label var blackpop40 "Percentage of black population in 1940"
g blackpop50 = blackpop[_n-57]      if (year == 2007) & (fips == fips[_n-57])    
label var blackpop50 "Percentage of black population in 1950"
g blackpop60 = blackpop[_n-47]      if (year == 2007) & (fips == fips[_n-47])    
label var blackpop60 "Percentage of black population in 1960"
replace blackpop00 = blackpop60 if fips == 2
replace blackpop40 = blackpop60 if fips == 2
replace blackpop50 = blackpop60 if fips == 2
replace blackpop00 = blackpop60 if fips == 15
replace blackpop40 = blackpop60 if fips == 15
replace blackpop50 = blackpop60 if fips == 15

g  lpop70     = lpoptot[_n-37]    if (year == 2007) & (fips == fips[_n-37])    
g  lpop75     = lpoptot[_n-32]    if (year == 2007) & (fips == fips[_n-32])    
g  lpop07     = lpoptot           if (year == 2007)    
g  grpop7007  = (lpop07-lpop70)/37
label var lpop70      "Log of population in 1970"
label var lpop75      "Log of population in 1975"
label var lpop07      "Log of population in 2007"
label var grpop7007   "Growth rate in population 70-07"

g       lcaplf70   = lcaplf[_n-37]    if (year == 2007) & (fips == fips[_n-37])    
g       lcaplf85   = lcaplf[_n-22]    if (year == 2007) & (fips == fips[_n-22])    
g       lgsppriv77 = lgsppriv[_n-30]  if (year == 2007) & (fips == fips[_n-30])    
g       lnfgsppr75 = lnfgsppr[_n-32]  if (year == 2007) & (fips == fips[_n-32])    
label var lcaplf70     "Log of capital per labor force in 1970"
label var lcaplf85     "Log of capital per labor force in 1985"
label var lgsppriv77   "Log of private GSP per worker in 1977"
label var lnfgsppr75   "Log of private non-farm GSP per worker in 1975"

sort  fips year
drop  if year < 1975
drop  if year > 2007


/*  Create cross-sectional data set  */

egen pcc10  = mean(pcc) if year < 2001, by(fips)
label var pcc10  "Mean public corruption convictions 75-00"
replace pcc10 = pcc10[_n-7] if year == 2007 & (fips == fips[_n-7])
egen pccpub10 = mean(pccpub) if year < 2001, by(fips)
label var pccpub10  "Mean public corruption rates per public employee 75-00"
replace pccpub10 = pccpub10[_n-7] if year == 2007 & (fips == fips[_n-7])
egen pccpop7500 = mean(pccpop) if year < 2001, by(fips)
label var pccpop7500 "Mean public corruption rates per 100,000 people 75-00"
replace pccpop7500 = pccpop7500[_n-7] if year == 2007 & (fips == fips[_n-7])
move  corrate pccpop7500 
egen pccpop7507 = mean(pccpop) if year < 2008, by(fips)
label var pccpop7507 "Mean public corruption rates per 100,000 people 75-07"
replace pccpop7507 = pccpop7507[_n-7] if year == 2007 & (fips == fips[_n-7])
move  corrate pccpop7507 
egen pccpop7590 = mean(pccpop) if year < 1991, by(fips)
label var pccpop7590 "Mean public corruption rates per 100,000 people 75-90"
replace pccpop7590 = pccpop7590[_n-20] if year == 2007 & (fips == fips[_n-20])
move  corrate pccpop7590 
egen pccpop9107 = mean(pccpop) if year > 1990, by(fips)
label var pccpop9107 "Mean public corruption rates per 100,000 people 91-07"
replace pccpop9107 = pccpop9107[_n-7] if year == 2007 & (fips == fips[_n-7])
move  corrate pccpop9107 

gen  blcorrper699 = blcorrper6[_n-8]   if year == 2007 & (fips == fips[_n-8])
gen  blcorrper3899 = blcorrper38[_n-8] if year == 2007 & (fips == fips[_n-8])
label var blcorrper699 "Overall Corruption Perception by State House Reporters in 1999" 
label var blcorrper3899 "Average Corruption Perception by State House Reporters in 1999" 
move  corrate blcorrper699
move  corrate blcorrper3899
drop blcorrper6 blcorrper38

egen  invshgsp10    = mean(invshgsp), by(fips)
egen  invshgspnf10  = mean(invshgspnf), by(fips)
egen  invshper10    = mean(invshper), by(fips)
egen  invsht10      = mean(invsht), by(fips)
egen  invshpr10     = mean(invshpr), by(fips)
egen  invshprt10    = mean(invshprt), by(fips)
label var invshgsp10 "Mean investment share (Y=private GSP) 75-07"
label var invshgspnf10 "Mean investment share (Y=private non-farm GSP) 77-07"
label var invshper10 "Mean investment share (Y=real personal income) 75-07"
label var invsht10   "Mean investment share (Y=real nontransfer personal income) 75-07"
label var invshpr10  "Mean investment share (Y=real private personal income) 75-07"
label var invshprt10 "Mean investment share (Y= real private nontransfer income) 75-07"
  
g  emppop0    = emppop[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
g  emppop1    = emppop            if (year == 2007)    

g  lpop0      = lpoptot[_n-32]    if (year == 2007) & (fips == fips[_n-32])    
g  lpop1      = lpoptot           if (year == 2007)    

g  llf0       = llf[_n-32]        if (year == 2007) & (fips == fips[_n-32])    
g  llf1       = llf               if (year == 2007)    

g  lemp0      = lemp[_n-32]       if (year == 2007) & (fips == fips[_n-32])    
g  lemp1      = lemp              if (year == 2007)    

g  lpremp0    = lpremp[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
g  lpremp1    = lpremp            if (year == 2007)    

g  grpop10    = (lpop1-lpop0)/32
g  grlf10     = (llf1-llf0)/32
g  gremp10    = (lemp1-lemp0)/32
g  grpremp10  = (lpremp1-lpremp0)/32

g  lpopdif    = (lpop1-lpop0)
g  llfdif     = (llf1-llf0)
g  lempdif    = (lemp1-lemp0)
g  lprempdif  = (lpremp1-lpremp0)

label var emppop0     "Employment-population ratio in initial year"
label var emppop1     "Employment-population ratio in final year"
label var lpop0       "Log of population in initial year"
label var lpop1       "Log of population in final year"
label var llf1        "Log of labor force in final year"
label var llf0        "Log of labor force in initial year"
label var llf1        "Log of labor force in final year"
label var lemp0       "Log of total full-time nonag employment in initial year"
label var lemp1       "Log of total full-time nonag employment in final year"
label var lpremp0     "Log of total full-time nonag private employment in initial year"
label var lpremp1     "Log of total full-time nonag private employment in final year"
label var grpop10     "Growth rate in population"
label var grlf10      "Growth rate in labor force"
label var gremp10     "Growth rate in total full-time nonag employment"
label var grpremp10   "Growth rate in total full-time nonag private employment"
label var lpopdif     "Log Difference in population"
label var llfdif      "Log Difference in labor force"
label var lempdif     "Log Difference in log of total full-time nonag employment"
label var lprempdif   "Log Difference in log of total full-time nonag private employment"

g  lcap70      = lcap[_n-37]       if (year == 2007) & (fips == fips[_n-37])    
g  lcap07      = lcap              if (year == 2007)    

g  lcapemp70   = lcapemp[_n-37]    if (year == 2007) & (fips == fips[_n-37])    
g  lcapemp07   = lcapemp           if (year == 2007)    

g  lcappremp70 = lcappremp[_n-37]  if (year == 2007) & (fips == fips[_n-37])    
g  lcappremp07 = lcappremp         if (year == 2007)    

g  lcaplf07    = lcaplf            if (year == 2007)    

g  lcapinc70   = lcapinc[_n-37]    if (year == 2007) & (fips == fips[_n-32])    
g  lcapinc07   = lcapinc           if (year == 2007)    

g  lcapdif      = (lcap07-lcap70)
g  lcapempdif   = (lcapemp07-lcapemp70)
g  lcapprempdif = (lcappremp07-lcappremp70)
g  lcaplfdif    = (lcaplf07-lcaplf70)
g  lcapincdif   = (lcapinc07-lcapinc70)

label var lcap70        "Log of capital stock in 1975"
label var lcap07        "Log of capital stock in final year"
label var lcapemp70     "Log of capital per worker (all nonag employment) in 1970"
label var lcapemp07     "Log of capital per worker (all nonag employment) in 2007"
label var lcappremp70   "Log of capital per worker (all nonag private employment) in 1970"
label var lcappremp07   "Log of capital per worker (all nonag private employment) in 2007"
label var lcaplf70      "Log of capital per labor force in 1970"
label var lcaplf07      "Log of capital per labor force in 2007"
label var lcapinc70     "Log of capital to income ratio in 1970"
label var lcapinc07     "Log of capital to income ratio in 2007"
label var lcapdif      "Log Difference in capital stock"
label var lcapempdif   "Log Difference in capital per worker (all nonag employment)"
label var lcapprempdif "Log Difference in capital per worker (all nonag private employment)"
label var lcaplfdif    "Log Difference in capital per labor force"
label var lcapincdif   "Log Difference in capital to income ratio"

g lrtotinc00  = lrtotinc[_n-32]   if (year == 2007) & (fips == fips[_n-32])    
g lrtotinc01  = lrtotinc          if (year == 2007)    

g lrtotinc10  = lrtotinc1[_n-32]  if (year == 2007) & (fips == fips[_n-32])    
g lrtotinc11  = lrtotinc1         if (year == 2007)    

g lrinc00     = lrinc[_n-32]      if (year == 2007) & (fips == fips[_n-32])    
g lrinc01     = lrinc             if (year == 2007)    

g lrinc10     = lrinc1[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
g lrinc11     = lrinc1            if (year == 2007)    

g lrinclf0    = lrinclf[_n-32]    if (year == 2007) & (fips == fips[_n-32])    
g lrinclf1    = lrinclf           if (year == 2007)    
 
g lrtinc0     = lrtinc[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
g lrtinc1     = lrtinc            if (year == 2007)    

g lrnfinc0    = lrnfinc[_n-32]    if (year == 2007) & (fips == fips[_n-32])    
g lrnfinc1    = lrnfinc           if (year == 2007)    

g lrnftinc0   = lrnftinc[_n-32]   if (year == 2007) & (fips == fips[_n-32])    
g lrnftinc1   = lrnftinc          if (year == 2007)    

g lrprinc0    = lrprinc[_n-32]    if (year == 2007) & (fips == fips[_n-32])    
g lrprinc1    = lrprinc           if (year == 2007)    

g lrprtinc0   = lrprtinc[_n-32]   if (year == 2007) & (fips == fips[_n-32])    
g lrprtinc1   = lrprtinc          if (year == 2007)    

g lrprnfinc0  = lrprnfinc[_n-32]  if (year == 2007) & (fips == fips[_n-32])    
g lrprnfinc1  = lrprnfinc         if (year == 2007)    

g lrprnftinc0 = lrprnftinc[_n-32]   if (year == 2007) & (fips == fips[_n-32])    
g lrprnftinc1 = lrprnftinc          if (year == 2007)    

g lrlabinc0   = lrlabinc[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
g lrlabinc1   = lrlabinc            if (year == 2007)    

g lgsppriv0   = lgsppriv[_n-30]     if (year == 2007) & (fips == fips[_n-30])    
g lgsppriv1   = lgsppriv            if (year == 2007)    
g lnfgsppr90  = lnfgsppr[_n-17]     if (year == 2007) & (fips == fips[_n-17])    
g lnfgsppr91  = lnfgsppr[_n-16]     if (year == 2007) & (fips == fips[_n-16])    
g lnfgsppr0   = lnfgsppr[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
replace lnfgsppr0 = lnfgsppr[_n-30] if (year == 2007) & (fips == fips[_n-30]) & (fips == 2)     
replace lnfgsppr0 = lnfgsppr[_n-30] if (year == 2007) & (fips == fips[_n-30]) & (fips == 11)     
replace lnfgsppr0 = lnfgsppr[_n-30] if (year == 2007) & (fips == fips[_n-30]) & (fips == 15)     
g lnfgsppr1   = lnfgsppr            if (year == 2007) 

g  grtotinc0     = (lrtotinc01-lrtotinc00)/32
g  grtotinc1     = (lrtotinc11-lrtotinc10)/32
g  grinc0        = (lrinc01-lrinc00)/32
g  grinc1        = (lrinc11-lrinc10)/32
g  grinclf       = (lrinclf1-lrinclf0)/32
g  grtinc        = (lrtinc1-lrtinc0)/32
g  grnfinc       = (lrnfinc1-lrnfinc0)/32
g  grnftinc      = (lrnftinc1-lrnftinc0)/32
g  grprinc       = (lrprinc1-lrprinc0)/32
g  grprtinc      = (lrprtinc1-lrprtinc0)/32
g  grprnfinc     = (lrprnfinc1-lrprnfinc0)/32
g  grprnftinc    = (lrprnftinc1-lrprnftinc0)/32
g  grlabinc      = (lrlabinc1-lrlabinc0)/32
g  grgsppriv     = (lgsppriv1-lgsppriv0)/30
g  grnfgsppr     = (lnfgsppr1-lnfgsppr0)/32
replace  grnfgsppr        = (lnfgsppr1-lnfgsppr0)/30 if fips == 2
replace  grnfgsppr        = (lnfgsppr1-lnfgsppr0)/30 if fips == 11
replace  grnfgsppr        = (lnfgsppr1-lnfgsppr0)/30 if fips == 15
g  grnfgsppr7590 = (lnfgsppr90-lnfgsppr0)/16
replace  grnfgsppr        = (lnfgsppr90-lnfgsppr0)/15 if fips == 2
replace  grnfgsppr        = (lnfgsppr90-lnfgsppr0)/15 if fips == 11
replace  grnfgsppr        = (lnfgsppr90-lnfgsppr0)/15 if fips == 15
g  grnfgsppr9107 = (lnfgsppr1-lnfgsppr91)/16
g  lrtotinc0dif  = (lrtotinc01-lrtotinc00)
g  lrtotinc1dif  = (lrtotinc11-lrtotinc10)
g  lrinc0dif     = (lrinc01-lrinc00)
g  lrinc1dif     = (lrinc11-lrinc10)
g  lrinclfdif    = (lrinclf1-lrinclf0)
g  lrlabincdif   = (lrlabinc1-lrlabinc0)

label var lrtotinc00  "Log of real total income in initial year"
label var lrtotinc10  "Log of real total income in initial year using TTMB"
label var lrinc00     "Log of real personal income per worker in initial year"
label var lrinc10     "Log of real personal income per worker using TTMB in initial year"
label var lrinclf0    "Log of real personal income per labor force using TTMB in initial year"
label var lrtinc0     "Log of real nontransfer personal income per worker in initial year"
label var lrnfinc0    "Log of real nonfarm personal income per worker in initial year"
label var lrnftinc0   "Log of real nonfarm nontransfer personal income per worker in initial year"
label var lrprinc0    "Log of real private personal income per worker in initial year"
label var lrprtinc0   "Log of real private nontransfer personal income per worker in initial year"
label var lrprnfinc0  "Log of real private nonfarm personal income per worker in initial year"
label var lrprnftinc0 "Log of real private nonfarm nontransfer personal income per worker in initial year"
label var lrlabinc0   "Log of real labor income per worker in initial year"
label var lgsppriv0   "Log of private GSP per worker in initial year"
label var lnfgsppr0   "Log of private non-farm GSP per worker in initial year"

label var lrtotinc01  "Log of real total income in final year"
label var lrtotinc11  "Log of real total income in final year using TTMB"
label var lrinc01     "Log of real personal income per worker in final year"
label var lrinc11     "Log of real personal income per worker using TTMB in final year"
label var lrinclf1    "Log of real personal income per labor force using TTMB in final year"
label var lrtinc1     "Log of real nontransfer personal income per worker in final year"
label var lrnfinc1    "Log of real nonfarm personal income per worker in final year"
label var lrnftinc1   "Log of real nonfarm nontransfer personal income per worker in final year"
label var lrprinc1    "Log of real private personal income per worker in final year"
label var lrprtinc1   "Log of real private nontransfer personal income per worker in final year"
label var lrprnfinc1  "Log of real private nonfarm personal income per worker in final year"
label var lrprnftinc1 "Log of real private nonfarm nontransfer personal income per worker in final year"
label var lrlabinc1   "Log of real labor income per worker in final year"
label var lgsppriv1   "Log of private GSP per worker in final year"
label var lnfgsppr1   "Log of private non-farm GSP per worker in final year"

label var grtotinc0   "Growth rate in real total income"
label var grtotinc1   "Growth rate in real total income using TTMP"
label var grinc0      "Growth rate in real personal income per worker"
label var grinc1      "Growth rate in real personal income per worker using TTMP"
label var grinclf     "Growth rate in real personal income per labor force using TTMP"
label var grtinc     "Growth rate in real nontransfer personal income per worker"
label var grnfinc    "Growth rate in real nonfarm personal income per worker"
label var grnftinc   "Growth rate in real nonfarm nontransfer personal income per worker"
label var grprinc    "Growth rate in real private personal income per worker"
label var grprtinc   "Growth rate in real private nontransfer personal income per worker"
label var grprnfinc  "Growth rate in real private nonfarm personal income per worker"
label var grprnftinc "Growth rate in real private nonfarm nontransfer personal income per worker"
label var grlabinc      "Growth rate in real labor income per worker"
label var grgsppriv     "Growth rate in private GSP per worker"
label var grnfgsppr     "Growth rate in private non-farm GSP per worker"
label var grnfgsppr7590 "Growth rate in private non-farm GSP per worker 1975-90"
label var grnfgsppr9107 "Growth rate in private non-farm GSP per worker 1991-07"

label var lrtotinc0dif  "Log Difference in log of real total income"
label var lrtotinc1dif  "Log Difference in log of real total income using TTMP"
label var lrinc0dif     "Log Difference in log of real personal income per worker"
label var lrinc1dif     "Log Difference in log of real personal income per worker using TTMP"
label var lrinclfdif    "Log Difference in log of real personal income per labor force using TTMP"
label var lrlabincdif   "Log Difference in log of real labor income per worker"

egen schmeanlf10  = mean(schmeanlf), by(fips)
label var schmeanlf10  "Mean years of schooling in labor force 75-05"
egen sch16pl10 = mean(sch16pl), by(fips)
label var sch16pl10 "Mean percentage of the 25+ population with 16+ years of schooling 80-07"
egen sch0_1210 = mean(sch0_12), by(fips)
label var sch0_1210 "Mean percentage of the 25+ population with 0-12 years of schooling 80-07"


g schmed0      = schmed[_n-32]         if (year == 2007) & (fips == fips[_n-32])    
g schmean0     = schmean[_n-32]        if (year == 2007) & (fips == fips[_n-32])    
g schmeanlf0   = schmeanlf[_n-32]      if (year == 2007) & (fips == fips[_n-32])    
g schmedsq0    = schmed0*schmed0       if (year == 2007) & (fips == fips[_n-32])    
g schmeansq0   = schmean0*schmean0     if (year == 2007) & (fips == fips[_n-32])    
g schmeanlfsq0 = schmeanlf0*schmeanlf0 if (year == 2007) & (fips == fips[_n-32])    
g schmed1      = schmed                if (year == 2007)    
g schmean1     = schmed                if (year == 2007)    
g schmeanlf1   = schmeanlf             if (year == 2007)     
g schmedsq1    = schmed1*schmed1       if (year == 2007) 
g schmeansq1   = schmean1*schmean1     if (year == 2007) 
g schmeanlfsq1 = schmeanlf1*schmeanlf1 if (year == 2007) 

g schmeddif    = schmed1-schmed0       if (year == 2007) & (fips == fips[_n-32])   
g schmeandif   = schmean1-schmean0     if (year == 2007) & (fips == fips[_n-32])   
g schmeanlfdif = schmeanlf1-schmeanlf0 if (year == 2007) & (fips == fips[_n-32])   
g schmedsqdif  = schmedsq1-schmedsq0   if (year == 2007) & (fips == fips[_n-32])   
g schmeansqdif = schmeansq1-schmeansq0 if (year == 2007) & (fips == fips[_n-32])   
g schmedinvdif  = (1/schmed1)-(1/schmed0)     if (year == 2007) & (fips == fips[_n-32])   
g schmeaninvdif = (1/schmean1)-(1/schmean0)   if (year == 2007) & (fips == fips[_n-32])   

label var schmed0  "Median years of schooling in 30+ pop in initial year"
label var schmean0 "Mean years of schooling in 30+ pop in initial year"
label var schmeanlf0 "Mean years of schooling in labor force in initial year"
label var schmedsq0  "Square of median years of schooling in 30+ pop in initial year"
label var schmeansq0 "Square of mean years of schooling in 30+ pop in initial year"
label var schmeanlfsq0 "Square of mean years of schooling in labor force in initial year"
label var schmed1  "Median years of schooling in 30+ pop in final year"
label var schmean1 "Mean years of schooling in 30+ pop in final year"
label var schmeanlf1 "Mean years of schooling in labor force in final year"
label var schmedsq1  "Square of median years of schooling in 30+ pop in final year"
label var schmeansq1 "Square of mean years of schooling in 30+ pop in final year"
label var schmeanlfsq1 "Square of mean years of schooling in labor force in final year"
label var schmeddif  "Change in median years of schooling in 30+ pop"
label var schmeandif "Change in mean years of schooling in 30+ pop"
label var schmeanlfdif "Change in mean years of schooling in labor force"
label var schmedsqdif  "Change in square of median years of schooling in 30+ pop"
label var schmeansqdif "Change in square of mean years of schooling in 30+ pop"
label var schmedinvdif  "Change in inverse of median years of schooling in 30+ pop"
label var schmeaninvdif "Change in inverse of mean years of schooling in 30+ pop"

move sch16pl60 sch16pl10
move sch16pl70 sch16pl10
move sch16pl80 sch16pl10
move sch0_1260 sch0_1210
move sch0_1270 sch0_1210 
move sch0_1280 sch0_1210


egen explf10  = mean(explf), by(fips)
label var explf10  "Mean experience of labor force 70-07"

g exp0     = exp[_n-32]         if (year == 2007) & (fips == fips[_n-32])    
g exp1     = exp                if (year == 2007)    
g expdif   = exp1-exp0          if (year == 2007) & (fips == fips[_n-32])   
g expsq0   = expsq[_n-32]       if (year == 2007) & (fips == fips[_n-32])    
g expsq1   = expsq              if (year == 2007)    
g expsqdif = expsq1-expsq0      if (year == 2007) & (fips == fips[_n-32])   
label var exp0     "Experience of 18-64 population in initial year"
label var exp1     "Experience of 18-64 population in final year"
label var expdif   "Change in experience of 18-64 population"
label var expsq0   "Experience squared of 18-64 population in initial year"
label var expsq1   "Experience squared of 18-64 population in final year"
label var expsqdif "Change in experience squared of 32-64 population"

g explf0     = explf[_n-32]       if (year == 2007) & (fips == fips[_n-32])    
g explf1     = explf              if (year == 2007)    
g explfdif   = explf1-explf0      if (year == 2007) & (fips == fips[_n-32])   
g explfsq0   = explfsq[_n-32]     if (year == 2007) & (fips == fips[_n-32])    
g explfsq1   = explfsq            if (year == 2007)    
g explfsqdif = explfsq1-explfsq0  if (year == 2007) & (fips == fips[_n-32])   
label var explf0     "Experience of labor force in initial year"
label var explf1     "Experience of labor force in final year"
label var explfdif   "Change in experience of labor force"
label var explfsq0   "Experience squared of labor force in initial year"
label var explfsq1   "Experience squared of labor force in final year"
label var explfsqdif "Change in experience squared of labor force"

egen p0_410         = mean(p0_4), by(fips)
label var p0_410    "Mean share of population aged 0-4 75-05"
egen p5_910         = mean(p5_9), by(fips)
label var p5_910    "Mean share of population aged 5-9 75-05"
egen p10_1410       = mean(p10_14), by(fips)
label var p10_1410  "Mean share of population aged 10-14 75-05"
egen p15_1910       = mean(p15_19), by(fips)
label var p15_1910  "Mean share of population aged 15-19 75-05"
egen p20_2410       = mean(p20_24), by(fips)
label var p20_2410  "Mean share of population aged 20-24 75-05"
egen p25_2910       = mean(p25_29), by(fips)
label var p25_2910  "Mean share of population aged 25-29 75-05"
egen p30_3410       = mean(p30_34), by(fips)
label var p30_3410  "Mean share of population aged 30-34 75-05"
egen p35_3910       = mean(p35_39), by(fips)
label var p35_3910  "Mean share of population aged 35-39 75-05"
egen p40_4410       = mean(p40_44), by(fips)
label var p40_4410  "Mean share of population aged 40-44 75-05"
egen p45_4910       = mean(p45_49), by(fips)
label var p45_4910  "Mean share of population aged 45-49 75-05"
egen p50_5410       = mean(p50_54), by(fips)
label var p50_5410  "Mean share of population aged 50-54 75-05"
egen p55_5910       = mean(p55_59), by(fips)
label var p55_5910  "Mean share of population aged 55-59 75-05"
egen p60_6410       = mean(p60_64), by(fips)
label var p60_6410  "Mean share of population aged 60-64 75-05"
egen p65_6910       = mean(p65_69), by(fips)
label var p65_6910  "Mean share of population aged 65-69 75-05"
egen p70_7410       = mean(p70_74), by(fips)
label var p70_7410  "Mean share of population aged 70-74 75-05"
egen p75_7910       = mean(p75_79), by(fips)
label var p75_7910  "Mean share of population aged 75-79 75-05"

egen depr10    = mean(depr), by(fips)
label var depr10  "Mean depreciation rate 70-07"

egen prsenr10  = mean(prsenr), by(fips)
label var prsenr10 "Mean enrollment in Primary and Secondary Education 75-05"

g prsenr0  = prsenr[_n-32]   if (year == 2007) & (fips == fips[_n-32])    
label var prsenr0  "Initial Enrollment in Primary and Secondary Education"

egen highenr10 = mean(highenr), by(fips)
label var highenr10 "Mean enrollment in Higher Education 75-05"

g highenr0     = highenr[_n-32]   if (year == 2007) & (fips == fips[_n-32])    
label var highenr0 "Initial Enrollment in Higher Education"

egen govtot10 = mean(govtot), by(fips)
label var govtot10  "Mean SL total spending (% of personal income)"
egen goved10 = mean(goved), by(fips)
label var goved10   "Mean SL education spending (% of personal income)"
egen govhigh10 = mean(govhigh), by(fips)
label var govhigh10 "Mean SL highway spending (% of personal income)"
egen govheho10 = mean(govheho), by(fips)
label var govheho10 "Mean SL health and hospital spending (% of personal income)"
egen govcap10 = mean(govcap), by(fips)
label var govcap10  "Mean SL capital spending (% of personal income)"
egen govcon110 = mean(govcon1), by(fips)
label var govcon110 "Mean SL total - capital (% of personal income)"
egen govcon210 = mean(govcon2), by(fips)
label var govcon210 "Mean SL total – education (% of personal income)"
egen govcon310 = mean(govcon3), by(fips)
label var govcon310 "Mean SL total – education – highway (% of personal income)"
egen govcon410 = mean(govcon4), by(fips)
label var govcon410 "Mean SL total – education – highway – health (% of personal income)"
egen taxburden10 = mean(taxburden), by(fips)
label var taxburden10 "Mean SL tax burden (% of personal income)"


/* Create Freedom Variables */

g frasier_all81   = frasier_all[_n-26]    if (year == 2007) & (fips == fips[_n-26])    
g frasier_govt81  = frasier_govt[_n-26]   if (year == 2007) & (fips == fips[_n-26])    
g frasier_tax81   = frasier_tax[_n-26]    if (year == 2007) & (fips == fips[_n-26])    
g frasier_labor81 = frasier_labor[_n-26]  if (year == 2007) & (fips == fips[_n-26])    
g frasier_all85   = frasier_all[_n-22]    if (year == 2007) & (fips == fips[_n-22])    
g frasier_govt85  = frasier_govt[_n-22]   if (year == 2007) & (fips == fips[_n-22])    
g frasier_tax85   = frasier_tax[_n-22]    if (year == 2007) & (fips == fips[_n-22])    
g frasier_labor85 = frasier_labor[_n-22]  if (year == 2007) & (fips == fips[_n-22])    
g frasier_all90   = frasier_all[_n-17]    if (year == 2007) & (fips == fips[_n-17])    
g frasier_govt90  = frasier_govt[_n-17]   if (year == 2007) & (fips == fips[_n-17])    
g frasier_tax90   = frasier_tax[_n-17]    if (year == 2007) & (fips == fips[_n-17])    
g frasier_labor90 = frasier_labor[_n-17]  if (year == 2007) & (fips == fips[_n-17])    
g merc_person01   = merc_person[_n-6]     if (year == 2007) & (fips == fips[_n-6])    
g merc_regulate01 = merc_regulate[_n-6]   if (year == 2007) & (fips == fips[_n-6])    
g merc_economic01 = merc_economic[_n-6]   if (year == 2007) & (fips == fips[_n-6])    
g merc_all07      = merc_all      if (year == 2007) 
g merc_fiscal07   = merc_fiscal   if (year == 2007) 
g merc_person07   = merc_person   if (year == 2007) 
g merc_regulate07 = merc_regulate if (year == 2007) 
g merc_economic07 = merc_economic if (year == 2007) 

g prot90   = protestant[_n-27]    if (year == 2007) & (fips == fips[_n-27])    
g cath90   = catholic[_n-27]      if (year == 2007) & (fips == fips[_n-27])    
g rtw70    = 0
replace rtw70 = 1 if rtwpass   <= 1970
replace rtw70 = 0 if rtwrepeal != .
label var prot90   "Percent Protestant in 1990"
label var cath90   "Percent Catholic in 1990"
label var rtw70    "1 if Right to Work in 1990"

    
keep if year == 2007
g    period = 0

/* Merge Industrial Mix */

sort  period fips
merge period fips using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\mixpanel.dta"
drop  if _merge == 2
drop  _merge


move period year
label var period "Time period (0 = 75-07)

label var mix0 "Percentage of production in manufacturing in initial year"
label var mix1 "Percentage of production in manufacturing in final year"
label var mixm "Percentage of production in manufacturing averaged over all years"
label var struci "Percentage gain in industrial composition using weights from initial year"
label var struce "Percentage gain in industrial composition using weights from final year"
label var strucm "Percentage gain in industrial composition using weights averaged over all years"
move  mixm struci

drop  poptot lpoptot
drop  pcc pccpub pccpop
drop  prsenr highenr
drop  lf llf emp-explfsq
drop  govtot-taxburden
drop  p0_4-p75_79
drop  y1950-y2000
drop  frasier_all-merc_economic 
drop  protestant catholic 
drop  rtwpass rtwrepeal 


/* Merge Instruments */

sort  fips
merge fips using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\instruments set for cross-section data.dta"
tab   _merge
drop  _merge

move elf00 grate 
move elf40 grate 
move elf50 grate 
move elf60 grate 
move elfnow50 grate 
move elfnow60 grate 
move elfnow70 grate 
move blackpop00 grate 
move blackpop40 grate 
move blackpop50 grate 
move blackpop60 grate 

move sch12pl40 grate
move sch12pl50 grate
move sch12pl60 grate

drop elf elfnow blackpop

move common cath90 
move civil cath90 
move civil_dur cath90 
move confed cath90 
move civil_north cath90 
move civil_south cath90 
move common_south cath90
 


compress

save "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\State cross-section data 75-07.dta", replace


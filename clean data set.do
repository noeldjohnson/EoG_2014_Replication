use "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\State data.dta", clear

sort  fips year


/* Label Dummy Variables */

label var fips	      "Numeric FIPS state code"
label var state	      "2-letter state code"
label var year	      "year"
label var beareg	      "number (1-8) of BEA region"
label var comreg	      "number (1-9) of Commerce Dept region"
label var north	      "1 for Commerce Dept region North of 4"
label var ncent	      "1 for Commerce Dept region North Central of 4"
label var south	      "1 for Commerce Dept region South of 4"
label var west	      "1 for Commerce Dept region West of 4"


/* Label Economic Freedom data */

label var frasier_all     "Frasier index - overall"
label var frasier_govt    "Frasier index – government size"
label var frasier_tax     "Frasier index - taxation"
label var frasier_labor   "Frasier index – labor market"
label var merc_all        "Mercatus Freedom - overall"
label var merc_fiscal     "Mercatus Freedom - fiscal"
label var merc_person     "Mercatus Freedom - personal"
label var merc_regulate   "Mercatus Freedom - regulatory"
label var merc_economic   "Mercatus Freedom - economic"


/* Label Initial Conditions data */

label var slave	      "1 for slave state"
label var common	      "1 for common law origin"
label var civil	      "1 for civil law origin"
label var civil_dur    "civil law duration"
label var confed	      "1 for Confederate state"
label var civil_north  "1 for civil law origin and Northern state"
label var civil_south  "1 for civil law origin and Confederate state"
label var common_south "1 for common law origin and Confederate state"
label var cooldays     "number of cool days"
label var slave1860    "number of slaves in 1860"
label var mining1880   "Percentage of income earned from mining in 1880"
label var soldiermort  "soldier mortality rate in 1832 & 1855"
label var origineng    "English origin"
label var originfr     "French origin"
label var originsp     "Spanish origin"
label var origindu     "Dutch origin"
label var temp         "Avg. temperature"
label var rain         "Avg. rainfall"
label var distintwat   "Distance to navigable water"
label var distocean    "Distance to ocean"
label var catholic     "Percent Catholic"
label var protestant   "Percent Protestant"
label var rtwpass      "Year that Right to Work Passed"
label var rtwrepeal    "Year that Right to Work Repealed"

/* Merge in corruption variables */

sort  fips year
merge fips year using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\Corruption 75-08.dta"
rename  pccperpubemp pccpub
gen       pccpop = pcc /(poptotal*100)
label var pccpop "public corruption rate per 100,000 population" 
tab     _merge
drop if _merge == 2
drop    _merge 


/* Create Deflators */

g cpiinfl         = ln(cpi)-ln(cpi[_n-1])
g deflate         = (stdefbfh)
replace deflate   = exp(cpiinfl+ln(deflate[_n-1])) if year > 2000
g stdefinfl       = ln(deflate)-ln(deflate[_n-1])
replace deflate   = deflate/100 
label var deflate "State-level deflator (constructed)"


/* Choose Variables */

g poptot    = (poptotal)
g lpoptot   = log(poptot)
g lf        = (labforce)
g llf       = log(lf)
g emp       = (blsnemp)
g lemp      = log(emp)
g premp     = (blspnemp)
g lpremp	= log(premp)

label var poptot   "Total population"
label var lpoptot  "Log of total population"
label var lf       "Labor force from TTMB paper"
label var llf      "Log of labor force from TTMB paper"
label var emp      "Total full-time nonag employment"
label var lemp     "Log of total full-time nonag employment"
label var premp    "Total full-time nonag private employment"
label var lpremp   "Log of total full-time nonag private employment"


/* Create gsp series */

g gsppriv3gr      = ln(gsppriv3)-ln(gsppriv3[_n-1])
g       gsppriv   = (taxgsppr)
replace gsppriv   = exp(gsppriv3gr+ln(gsppriv[_n-1])) if year > 1997
replace gsppriv   = gsppriv/blspnemp 
g      lgsppriv   = log(gsppriv)

g nfgsppr3gr      = ln(nfgsppr3)-ln(nfgsppr3[_n-1])
g       nfgsppr   = (ssgsp)
replace nfgsppr   = exp(nfgsppr3gr+ln(nfgsppr[_n-1])) if year > 1997
replace nfgsppr   = nfgsppr/blspnemp 
g      lnfgsppr   = log(nfgsppr)

label var gsppriv   "Private GSP per worker (constructed)"
label var lgsppriv  "Log of private GSP per worker (constructed)"
label var nfgsppr   "Private non-farm GSP per worker (constructed)"
label var lnfgsppr  "Log of private non-farm GSP per worker (constructed)"


/* Create income series */

g rtotinc   = (perinc)                /(cpi)
g lrtotinc  = log(rtotinc)
g rtotinc1  = (rpinct)
g lrtotinc1 = log(rtotinc1)
g rinc      = (perinc)                /(cpi*blsnemp)
g lrinc     = log(rinc)
g rinc1     = (rpinct)                /(blsnemp)
g lrinc1    = log(rinc1)
g rinclf    = (rpinct)                /(lf)
g lrinclf   = log(rinclf)
g rtinc     = (perinc-trpay)          /(cpi*blsnemp)
g lrtinc    = log(rtinc)
g rnfinc    = (nfearn)                /(cpi*blsnemp)
g lrnfinc   = log(rnfinc)
g rnftinc   = (nfearn-trpay)          /(cpi*blsnemp)
g lrnftinc  = log(rnftinc)
g       rprinc    = (perinc-incsic900)        /(cpi*blspnemp) if year < 1990
replace rprinc    = (perinc-incnai2000)       /(cpi*blspnemp) if year > 1989
g       lrprinc   = log(rprinc)
g       rprtinc   = (perinc-incsic900-trpay)  /(cpi*blspnemp) if year < 1990
replace rprtinc   = (perinc-incnai2000-trpay) /(cpi*blspnemp) if year > 1989
g       lrprtinc  = log(rprtinc)
g       rprnfinc  = (nfearn-incsic900)        /(cpi*blspnemp) if year < 1990
replace rprnfinc  = (nfearn-incnai2000)       /(cpi*blspnemp) if year > 1989
g       lrprnfinc = log(rprnfinc)
g       rprnftinc = (nfearn-incsic900-trpay)  /(cpi*blspnemp) if year < 1990
replace rprnftinc = (nfearn-incnai2000-trpay) /(cpi*blspnemp) if year > 1989
g       lrprnftinc = log(rprnftinc)

label var rtotinc   "Real total income"
label var lrtotinc  "Log of real total income"
label var rtotinc1  "Real total income using TTMB"
label var lrtotinc1 "Log of real total income using TTMB"
label var rinc      "Real personal income per worker"
label var lrinc     "Log of real personal income per worker"
label var rinc1     "Real personal income per worker using TTMB"
label var lrinc1    "Log of real personal income per worker using TTMB"
label var rinclf    "Real personal income per labor force using TTMB"
label var lrinclf   "Log of real personal income per labor force using TTMB"
label var rtinc     "Real nontransfer personal income per worker"
label var lrtinc    "Log of real nontransfer personal income per worker"
label var rnfinc    "Real nonfarm personal income per worker"
label var lrnfinc   "Log of real nonfarm personal income per worker"
label var rnftinc   "Real nonfarm nontransfer personal income per worker"
label var lrnftinc  "Log of real nonfarm nontransfer personal income per worker"
label var rprinc    "Real private personal income per worker"
label var lrprinc   "Log of real private personal income per worker"
label var rprtinc   "Real private nontransfer personal income per worker"
label var lrprtinc  "Log of real private nontransfer personal income per worker"
label var rprnfinc  "Real private nonfarm personal income per worker"
label var lrprnfinc "Log of real private nonfarm personal income per worker"
label var rprnftinc "Real private nonfarm nontransfer personal income per worker"
label var lrprnftinc "Log of real private nonfarm nontransfer personal income per worker"


/* Create investment series */

g grinvnewgr      = ln(grinvnew1)-ln(grinvnew1[_n-1])
g invtot          = (grinvrrk1)
replace invtot    = exp(grinvnewgr+ln(invtot[_n-1]))         if year > 1993

g       linvtot    = log(invtot)
g       invshgsp   = invtot /(gsppriv) 
g       invshgspnf = invtot /(nfgsppr) 
g       invshper   = invtot /((perinc)/cpi)                      
g       invsht     = invtot /((perinc-trpay)/cpi)                
g       invshpr    = invtot /((perinc-incsic900)/cpi)         if year < 1990          
replace invshpr    = invtot /((perinc-incnai2000)/cpi)        if year > 1989    
g       invshprt   = invtot /((perinc-incsic900-trpay)/cpi)   if year < 1990  
replace invshprt   = invtot /((perinc-incnai2000-trpay)/cpi)  if year > 1989    
g       depr       = dep1rr                                   if year < 1990
replace depr       = dep1new                                  if year > 1989    

label var invtot     "Real investment (constructed)"
label var linvtot    "Log of real investment (constructed)"
label var invshgsp   "Real investment share (Y=private GSP)"
label var invshgspnf "Real investment share (Y=private GSP)"
label var invshper   "Real investment share (Y=real personal income)"
label var invsht     "Real investment share (Y=real nontransfer personal income)"
label var invshpr    "Real investment share (Y=real private personal income)"
label var invshprt   "Real investment share (Y= real private nontransfer income)"
label var depr       "Depreciation rate"


/* Create capital stock series */

g k1newgr         = ln(k1new)-ln(k1new[_n-1])
g cap             = (k1rr)
replace cap       = exp(k1newgr+ln(cap[_n-1]))       if year > 1993

g lcap      = log(cap)
g capemp    = cap/emp
g lcapemp   = log(capemp)
g cappremp  = cap/premp
g lcappremp = log(cappremp)
g caplf     = cap/lf
g lcaplf    = log(caplf)
g capinc    = cap/(perinc/cpi)
g lcapinc   = log(capinc)

label var cap       "Capital stock (constructed)"
label var lcap      "Log of capital stock (constructed)"
label var capemp    "Capital per worker (all nonag employment)"
label var lcapemp   "Log of capital per worker (all nonag employment)"
label var cappremp  "Capital per worker (all nonag private employment)"
label var lcappremp "Log of capital per worker (all nonag private employment)"
label var caplf     "Capital per labor force"
label var lcaplf    "Log of capital per labor force"
label var capinc    "Capital to income ratio"
label var lcapinc   "Log of capital to income ratio"


/* using labor force to create real wage */

g rlabinc   = (labpay)/(cpi*lf)
g lrlabinc  = log(rlabinc)

label var rlabinc   "Real labor income per worker"
label var lrlabinc  "Log of real labor income per worker"


g sch0_4  = (tyr0_4)/tpop25
g sch0_12 = (tyr0_8+tyr9_11+tyr12)/tpop25
g sch12pl = (tyr12+tyr13_15+tyr16pl)/tpop25
g sch1315 = (tyr13_15)/tpop25
g sch16pl = (tyr16pl)/tpop25
g schmed  = tmedcen
g schmean = tmeanms
g schmeanlf = tmeanttmb

label var sch0_4  "Percentage of 25+ pop with 0-4 years of schooling"
label var sch0_12 "Percentage of 25+ pop with 0-12 years of schooling"
label var sch12pl "Percentage of 25+ pop with 12 or more years of schooling"
label var sch1315 "Percentage of 25+ pop with 13-15 years of schooling"
label var sch16pl "Percentage of 25+ pop with 16 or more years of schooling"
label var schmed  "Median years of schooling in 25+ pop from Census"
label var schmean "Mean years of schooling in 25+ pop from Mulligan Sala-i-Martin"
label var schmeanlf "Mean years of schooling in labor force from TTMB paper"

g exp     = ((pop25_29*27.5)+(pop30_34*32.5)+(pop35_39*37.5)+(pop40_44*42.5)+(pop45_49*47.5)+(pop50_54*52.5)+(pop55_59*57.5)+(pop60_64*62.5)) / ((pop25_29)+(pop30_34)+(pop35_39)+(pop40_44)+(pop45_49)+(pop50_54)+(pop55_59)+(pop60_64)) - schmed - 6 
g expsq   = exp^2
g explf   = expttmb
g explfsq = expttmb^2
label var exp     "Average experience of 25-64 workforce"
label var expsq   "Average experience squared of 25-64 workforce"
label var explf   "Average experience of labor force from TTMB paper"
label var explfsq "Average experience squared of labor force from TTMB paper"

g emppop  = lf/pop18_64
label var emppop "Employment-population ratio"

move prsenr explfsq
label var prsenr  "Enrollment rate in primary and secondary education" 
move highenr prsenr
label var highenr "Enrollment rate in higher education" 

g elf = 1 - ((popwh/poptotd)^2) - ((popbl/poptotd)^2) - ((popas/poptotd)^2) - ((popind/poptotd)^2) 
g elfnow = 1 - ((popbl/poptotd)^2) - ((popas/poptotd)^2) - ((popind/poptotd)^2) - ((popoth/poptotd)^2)     
g blackpop = popbl/poptotd 
label var elf "Enthnolinguistic Fractionalization using white, black, Asian and Indian pops"
label var elfnow "Enthnolinguistic Fractionalization using black, Asian and Indian pops"
label var blackpop "Percentage of population that is black"

g p0_4    = (pop0_4)/poptot
g p5_9    = (pop5_9)/poptot
g p10_14  = (pop10_14)/poptot
g p15_19  = (pop15_19)/poptot
g p20_24  = (pop20_24)/poptot
g p25_29  = (pop25_29)/poptot
g p30_34  = (pop30_34)/poptot
g p35_39  = (pop35_39)/poptot
g p40_44  = (pop40_44)/poptot
g p45_49  = (pop45_49)/poptot
g p50_54  = (pop50_54)/poptot
g p55_59  = (pop55_59)/poptot
g p60_64  = (pop60_64)/poptot
g p65_69  = (pop65_69)/poptot
g p70_74  = (pop70_74)/poptot
g       p75_79  = (pop75_79)/poptot     
replace p75_79  = (pop75_84)/(2*poptot) if year == 1950
replace p75_79  = (pop75p)/(3*poptot)   if year == 1940

label var p0_4      "Share of population aged 0-4 years"
label var p5_9      "Share of population aged 5-9 years"
label var p10_14    "Share of population aged 10-14 years"
label var p15_19    "Share of population aged 15-19 years"
label var p20_24    "Share of population aged 20-24 years"
label var p25_29    "Share of population aged 25-29 years"
label var p30_34    "Share of population aged 30-34 years"
label var p35_39    "Share of population aged 35-39 years"
label var p40_44    "Share of population aged 40-44 years"
label var p45_49    "Share of population aged 45-49 years"
label var p50_54    "Share of population aged 50-54 years"
label var p55_59    "Share of population aged 55-59 years"
label var p60_64    "Share of population aged 60-64 years"
label var p65_69    "Share of population aged 65-69 years"
label var p70_74    "Share of population aged 70-74 years"
label var p75_79    "Share of population aged 75-79 years"

g govtot  = sltotgex/perinc
g goved   = sltoedgex/perinc
g govhigh = slhighgex/perinc
g govheho = slhehogex/perinc
g govcap  = sltotcex/perinc
g govcon1 = govtot-govcap
g govcon2 = govtot-goved
g govcon3 = govtot-goved-govhigh
g govcon4 = govtot-goved-govhigh-govheho
g taxburden = slttax/perinc

label var govtot  "SL total spending (% of personal income)"
label var goved   "SL education spending (% of personal income)" 
label var govhigh "SL highway spending (% of personal income)"
label var govheho "SL health and hospital spending (% of personal income)"
label var govcap  "SL capital spending (% of personal income)"
label var govcon1 "SL total - capital (% of personal income)"
label var govcon2 "SL total – education (% of personal income)"
label var govcon3 "SL total – education – highway (% of personal income)"
label var govcon4 "SL total – education – highway – health (% of personal income)"
label var taxburden "SL tax burden (% of personal income)"

g y1950 = 0
g y1951 = 0
g y1952 = 0
g y1953 = 0
g y1954 = 0
g y1955 = 0
g y1956 = 0
g y1957 = 0
g y1958 = 0
g y1959 = 0
g y1960 = 0
g y1961 = 0
g y1962 = 0
g y1963 = 0
g y1964 = 0
g y1965 = 0
g y1966 = 0
g y1967 = 0
g y1968 = 0
g y1969 = 0
g y1970 = 0
g y1971 = 0
g y1972 = 0
g y1973 = 0
g y1974 = 0
g y1975 = 0
g y1976 = 0
g y1977 = 0
g y1978 = 0
g y1979 = 0
g y1980 = 0
g y1981 = 0
g y1982 = 0
g y1983 = 0
g y1984 = 0
g y1985 = 0
g y1986 = 0
g y1987 = 0
g y1988 = 0
g y1989 = 0
g y1990 = 0
g y1991 = 0
g y1992 = 0
g y1993 = 0
g y1994 = 0
g y1995 = 0
g y1996 = 0
g y1997 = 0
g y1998 = 0
g y1999 = 0
g y2000 = 0
replace y1950 = 1 if year == 1950
replace y1951 = 1 if year == 1951
replace y1952 = 1 if year == 1952
replace y1953 = 1 if year == 1953
replace y1954 = 1 if year == 1954
replace y1955 = 1 if year == 1955
replace y1956 = 1 if year == 1956
replace y1957 = 1 if year == 1957
replace y1958 = 1 if year == 1958
replace y1959 = 1 if year == 1959
replace y1960 = 1 if year == 1960
replace y1961 = 1 if year == 1961
replace y1962 = 1 if year == 1962
replace y1963 = 1 if year == 1963
replace y1964 = 1 if year == 1964
replace y1965 = 1 if year == 1965
replace y1966 = 1 if year == 1966
replace y1967 = 1 if year == 1967
replace y1968 = 1 if year == 1968
replace y1969 = 1 if year == 1969
replace y1970 = 1 if year == 1970
replace y1971 = 1 if year == 1971
replace y1972 = 1 if year == 1972
replace y1973 = 1 if year == 1973
replace y1974 = 1 if year == 1974
replace y1975 = 1 if year == 1975
replace y1976 = 1 if year == 1976
replace y1977 = 1 if year == 1977
replace y1978 = 1 if year == 1978
replace y1979 = 1 if year == 1979
replace y1980 = 1 if year == 1980
replace y1981 = 1 if year == 1981
replace y1982 = 1 if year == 1982
replace y1983 = 1 if year == 1983
replace y1984 = 1 if year == 1984
replace y1985 = 1 if year == 1985
replace y1986 = 1 if year == 1986
replace y1987 = 1 if year == 1987
replace y1988 = 1 if year == 1988
replace y1989 = 1 if year == 1989
replace y1990 = 1 if year == 1990
replace y1991 = 1 if year == 1991
replace y1992 = 1 if year == 1992
replace y1993 = 1 if year == 1993
replace y1994 = 1 if year == 1994
replace y1995 = 1 if year == 1995
replace y1996 = 1 if year == 1996
replace y1997 = 1 if year == 1997
replace y1998 = 1 if year == 1998
replace y1999 = 1 if year == 1999
replace y2000 = 1 if year == 2000

drop    perinc nfearn trpay rpinct incsic900 incnai2000 labpay labpay2 labforce blsnemp blspnemp tpop25 tyr0_4 tyr5_7 tyr0_7 tyr8 tyr5_8 tyr0_8 tyr9_11 tyr12 tyr13_15 tyr16 tyr17pl tyr16pl tmedcen tmeanms tmeanttmb expttmb  

drop  poptotal pop0_4 pop5_9 pop10_14 pop15_19 pop20_24 pop25_29 pop30_34 pop35_39 pop40_44 pop45_49 pop50_54 pop55_59 pop60_64 pop65_69 pop70_74 pop75_79 pop75_84 pop75p pop80_84 pop85p
drop  popm pop0_4m pop5_9m pop10_14m pop15_19m pop20_24m pop25_29m pop30_34m pop35_39m pop40_44m pop45_49m pop50_54m pop55_59m pop60_64m pop65_69m pop70_74m pop75_79m pop75_84m pop75pm pop80_84m pop85pm
drop  popf pop0_4f pop5_9f pop10_14f pop15_19f pop20_24f pop25_29f pop30_34f pop35_39f pop40_44f pop45_49f pop50_54f pop55_59f pop60_64f pop65_69f pop70_74f pop75_79f pop75_84f pop75pf pop80_84f pop85pf pop18_64

drop sltotgex sltoedgex slhighgex slhehogex sltotcex slttax 

drop poptotd popwh popbl popas popind popoth

drop deflate stdefinfl 

drop cpi cpiinfl stdefbfh k1new k1rr k1newr k1newgr grinvnew1 grinvrrk1 grinvnew1 grinvnewr1 grinvnewgr gsppriv3 gsppriv4 dep1rr dep1new taxgsppr gsppriv3gr ssgsp nfgsppr3 nfgsppr4 nfgsppr3gr

sort fips year

save "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\State data cleaned.dta", replace


use "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Data\State cross-section data 75-07.dta", clear

log using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\Cross-section regressions 70-07 with freedom using pccpop7507.log", replace

drop if fips==11

gen constage = 1970 - constinception 

/*  Rescale the Mediating Variables */

sum    blcorrper699
gen    blcorrper699temp = [(blcorrper699-1.5)/4] if blcorrper699 != .
drop   blcorrper699
rename blcorrper699temp blcorrper699
sum    blcorrper699

sum    blcorrper3899
gen    blcorrper3899temp = [(blcorrper3899+1.897)/3.508] if blcorrper3899 != .
drop   blcorrper3899
rename blcorrper3899temp blcorrper3899
sum    blcorrper3899

sum    merc_economic01
gen    merc_economic01temp = [(merc_economic01+0.4985)/(0.4985+0.2833)]
drop   merc_economic01
rename merc_economic01temp  merc_economic01
sum    merc_economic01

sum    merc_all07
gen    merc_all07temp = [(merc_all07+0.741)/1.129]
drop   merc_all07
rename merc_all07temp merc_all07
sum    merc_all07

sum    merc_economic07
gen    merc_economic07temp = [(merc_economic07+0.574)/0.945]
drop   merc_economic07
rename merc_economic07temp  merc_economic07
sum    merc_economic07

sum    frasier_all81
gen    frasier_all81temp = [(frasier_all81-4.56)/2.511]
drop   frasier_all81
rename frasier_all81temp frasier_all81
sum    frasier_all81

sum    frasier_labor81
gen    frasier_labor81temp = [(frasier_labor81-3.64)/3.029]
drop   frasier_labor81
rename frasier_labor81temp frasier_labor81
sum    frasier_labor81

sum    frasier_all85
gen    frasier_all85temp = [(frasier_all85-4.967)/2.444]
drop   frasier_all85
rename frasier_all85temp frasier_all85
sum    frasier_all85

sum    frasier_labor85
gen    frasier_labor85temp = [(frasier_labor85-4.337)/2.681]
drop   frasier_labor85
rename frasier_labor85temp frasier_labor85
sum    frasier_labor85

sum    frasier_all90
gen    frasier_all90temp = [(frasier_all90-4.967)/2.444]
drop   frasier_all90
rename frasier_all90temp frasier_all90
sum    frasier_all90

sum    frasier_labor90
gen    frasier_labor90temp = [(frasier_labor90-4.337)/2.681]
drop   frasier_labor90
rename frasier_labor90temp frasier_labor90
sum    frasier_labor90


/*  Generate Interactions */

gen interfrasier_all81   = pccpop7507*frasier_all81
gen interfrasier_labor81 = pccpop7507*frasier_labor81
gen inter2frasier_all81   = pccpop7590*frasier_all81
gen inter2frasier_labor81 = pccpop7590*frasier_labor81
gen interfrasier_all85   = pccpop9107*frasier_all85
gen interfrasier_labor85 = pccpop9107*frasier_labor85
gen interfrasier_all90   = pccpop9107*frasier_all90
gen interfrasier_labor90 = pccpop9107*frasier_labor90
gen intermerc_reg01      = pccpop7507*merc_regulate01 
gen intermerc_econ01     = pccpop7507*merc_economic01 
gen intermerc_all07      = pccpop7507*merc_all07 
gen intermerc_reg07      = pccpop7507*merc_regulate07 
gen intermerc_econ07     = pccpop7507*merc_economic07 

gen interblcorr6_all81      = blcorrper699*frasier_all81  
gen interblcorr6_labor81    = blcorrper699*frasier_labor81  
gen interblcorr38_all81     = blcorrper3899*frasier_all81  
gen interblcorr38_labor81   = blcorrper3899*frasier_labor81  


/*  Generate Instrument Interactions */

gen intresfrasier_all81    = residencycount1964*frasier_all81
gen intresfrasier_labor81  = residencycount1964*frasier_labor81
gen intresfrasier_all85    = residencycount1964*frasier_all85
gen intresfrasier_labor85  = residencycount1964*frasier_labor85
gen intresmerc_econ01      = residencycount1964*merc_economic01 
gen intresmerc_reg01       = residencycount1964*merc_regulate01 
gen intresmerc_all07       = residencycount1964*merc_all07 
gen intresmerc_econ07      = residencycount1964*merc_economic07 
gen intresmerc_reg07       = residencycount1964*merc_regulate07 

gen intcampfrasier_all81   = campfull*frasier_all81
gen intcampfrasier_labor81 = campfull*frasier_labor81
gen intcampfrasier_all85   = campfull*frasier_all85
gen intcampfrasier_labor85 = campfull*frasier_labor85
gen intcampmerc_econ01     = campfull*merc_economic01 
gen intcampmerc_reg01      = campfull*merc_regulate01 
gen intcampmerc_all07      = campfull*merc_all07 
gen intcampmerc_econ07     = campfull*merc_economic07 
gen intcampmerc_reg07      = campfull*merc_regulate07 

gen intconfrasier_all81    = constage*frasier_all81
gen intconfrasier_labor81  = constage*frasier_labor81
gen intconfrasier_all85    = constage*frasier_all85
gen intconfrasier_labor85  = constage*frasier_labor85
gen intconmerc_econ01      = constage*merc_economic01 
gen intconmerc_reg01       = constage*merc_regulate01 
gen intconmerc_all07       = constage*merc_all07 
gen intconmerc_econ07      = constage*merc_economic07 
gen intconmerc_reg07       = constage*merc_regulate07 

g lresidency = log(1+ residencycount1964)
g lconstag   = log(1+ constag)

g distwat = min(distintwat,distocean) 

replace rain = 554/12 if fips == 2
replace rain = 3 if fips == 15
replace temp = 26.06 if fips == 2
replace temp = 69.8  if fips == 15
replace distintwat = 15 if fips == 2
replace distintwat = 300 if fips == 15
replace distwat = 600 if fips == 2
replace distwat = 20 if fips == 15

g lrain = log(rain)
g ltemp = log(temp)
g ldistintwat = log(distintwat)
g ldistocean = log(distocean)
g ldistwat = log(distwat)
g lcooldays = log(cooldays)
g lslave1860 = log(1+slave1860)
replace lslave1860 = 0 if lslave1860 == .

/* **************  LABELS ************ */

label var grnfgsppr       "Growth in real GSP per person"
label var pccpop7507      "Corruption"
label var frasier_all81   "Econ Freedom, Fraser"
label var frasier_labor81 "Labor Freedom, Fraser"
label var frasier_all85   "Econ Freedom, Fraser"
label var frasier_labor85 "Labor Freedom, Fraser"
label var merc_all07      "Total Freedom, Mercatus"
label var merc_economic01 "Econ Freedom, Mercatus"
label var merc_economic07 "Econ Freedom, Mercatus"
label var interfrasier_all81   "Corruption * Freedom"
label var interfrasier_labor81 "Corruption * Freedom"
label var interfrasier_all85   "Corruption * Freedom"
label var interfrasier_labor85 "Corruption * Freedom"
label var intermerc_all07      "Corruption * Freedom"
label var intermerc_econ07     "Corruption * Freedom"


/* **************  TABLE 1:  DESCRIPTIVE STATISTICS ************ */

sum grnfgsppr pccpop7507 frasier_all81 frasier_labor81 merc_economic07 lcaplf70 sch0_1270 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south west residencycount1964 campfull constage civil confed common_south civil_south lslave1860, separator(0)



/* ********* TABLE A:  INCOME GROWTH REGRESSIONS ********************* */

/* Table 1: OLS */

reg grnfgsppr pccpop7507 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a1one

reg grnfgsppr frasier_all81 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a2one

reg grnfgsppr frasier_labor81 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a3one

reg grnfgsppr pccpop7507 frasier_all81 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a4one

reg grnfgsppr pccpop7507 frasier_labor81 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a5one

outreg2 pccpop7507 frasier_all81 frasier_labor81 lcaplf70 lpop70 grpop7007   sch0_1270 govcon70 govcap70 taxburden70 lpop70 [a1one a2one a3one a4one a5one] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table1.rtf", replace label dec(4) addtext(Controls, YES, Reg Dummies, YES) nocons


/* Table 2: 2SLS */

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south (pccpop7507 = residencycount1964 campfull constage), ffirst robust 
estimates store b1two

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south (frasier_all81 = common_south civil_south lslave1860), ffirst robust 
estimates store b2two

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south (frasier_labor81 = common_south civil_south lslave1860), ffirst robust
estimates store b3two

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south (pccpop7507 frasier_all81 = residencycount1964 campfull constage common_south civil_south lslave1860), ffirst robust 
estimates store b4two

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south (pccpop7507 frasier_labor81 = residencycount1964 campfull constage common_south civil_south lslave1860), ffirst robust 
estimates store b5two

outreg2 pccpop7507 frasier_all81 frasier_labor81 lcaplf70 lpop70 grpop7007   sch0_1270 govcon70 govcap70 taxburden70 lpop70 [b1two b2two b3two b4two b5two] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\Table2.rtf", replace addtext(Controls, YES, Reg Dummies, YES) label dec(4) nocons



/* *************** INTERACTED INCOME GROWTH REGRESSIONS ************* */


/* Table 3A: OLS */

reg grnfgsppr pccpop7507 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_all81 interfrasier_all81, robust
estimates store a1three

reg grnfgsppr pccpop7507 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_labor81 interfrasier_labor81, robust
estimates store a2three 
	
reg grnfgsppr pccpop7507 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south merc_economic07 intermerc_econ07, robust
estimates store a3three

outreg2 pccpop7507 frasier_all81 interfrasier_all81 frasier_labor81 interfrasier_labor81 merc_economic07 intermerc_econ07 [a1three a2three a3three] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table3A.rtf", replace label dec(4) addtext(Controls, YES, Reg Dummies, YES) nocons

/* Table 3B: 2SLS */

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_all81 (pccpop7507 interfrasier_all81 = residencycount1964 campfull constage intresfrasier_all81 intcampfrasier_all81 intconfrasier_all81), ffirst robust
estimates store b1three 

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_labor81 (pccpop7507 interfrasier_labor81= residencycount1964 campfull constage intresfrasier_labor81 intcampfrasier_labor81 intconfrasier_labor81), ffirst robust
estimates store b2three 
	
ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south merc_economic07 (pccpop7507 intermerc_econ07 = residencycount1964 campfull constage intresmerc_econ07 intcampmerc_econ07 intconmerc_econ07), ffirst robust
estimates store b3three 

outreg2 pccpop7507 frasier_all81 interfrasier_all81 frasier_labor81 interfrasier_labor81 merc_economic07 intermerc_econ07 [b1three b2three b3three] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table3B.rtf", replace label dec(4) nocons addtext(Controls, YES, Reg Dummies, YES)   


/* *************** ROBUSTNESS ESTIMATES ************* */


/* Table 4A: OLS for economic freedom */

reg grnfgsppr7590 pccpop7590 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_all81 inter2frasier_all81 north ncent south, robust
estimates store a1four

reg grnfgsppr9107 pccpop9107 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_all85 interfrasier_all85 north ncent south, robust
estimates store a2four


reg   grnfgsppr blcorrper699 frasier_all81 interblcorr6_all81  lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a3four

reg grnfgsppr pccpop7507 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_all81 interfrasier_all81, robust
estimates store a4four

outreg2 [a1four a2four a3four a4four] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table4A.rtf", replace label dec(4) addtext(Controls, YES, Reg Dummies, NO)

/* Table 4B: 2SLS */

ivreg2 grnfgsppr7590 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_all81 (pccpop7590 inter2frasier_all81 = residencycount1964 campfull constage intresfrasier_all81 intcampfrasier_all81 intconfrasier_all81), ffirst robust
estimates store b1four 
	
ivreg2 grnfgsppr9107 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_all85 (pccpop9107 interfrasier_all85 = residencycount1964 campfull constage intresfrasier_all85 intcampfrasier_all85 intconfrasier_all85), ffirst robust
estimates store b2four 

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_labor81 north ncent south (blcorrper699 interblcorr6_all81 = residencycount1964 campfull constage intresfrasier_all81 intcampfrasier_all81 intconfrasier_all81), ffirst robust
estimates store b3four 

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_all81 (pccpop7507 interfrasier_all81 = residencycount1964 campfull constage intresfrasier_all81 intcampfrasier_all81 intconfrasier_all81), ffirst robust
estimates store b4four 

outreg2 [b1four b2four b3four b4four] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table4B.rtf", replace label dec(4) nocons addtext(Controls, YES, Reg Dummies, NO)   


/* Table 5A: OLS for labor market freedom */

reg grnfgsppr7590 pccpop7590 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_labor81 inter2frasier_labor81 north ncent south, robust
estimates store a1five

reg grnfgsppr9107 pccpop9107 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_labor85 interfrasier_labor85 north ncent south, robust
estimates store a2five

reg   grnfgsppr blcorrper699 frasier_labor81 interblcorr6_labor81  lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south, robust
estimates store a3five

reg grnfgsppr pccpop7507 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_labor81 interfrasier_labor81, robust
estimates store a4five


outreg2 [a1five a2five a3five a4five] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table5A.rtf", replace label dec(4) addtext(Controls, YES, Reg Dummies, NO)


/* Table 5B: 2SLS */

ivreg2 grnfgsppr7590 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_labor81 (pccpop7590 inter2frasier_labor81 = residencycount1964 campfull constage intresfrasier_labor81 intcampfrasier_labor81 intconfrasier_labor81), ffirst robust
estimates store b1five 

ivreg2 grnfgsppr9107 lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_labor85 (pccpop9107 interfrasier_labor85 = residencycount1964 campfull constage intresfrasier_labor85 intcampfrasier_labor85 intconfrasier_labor85), ffirst robust
estimates store b2five 

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 north ncent south frasier_labor81 (blcorrper699 interblcorr6_labor81 = residencycount1964 campfull constage intresfrasier_labor81 intcampfrasier_labor81 intconfrasier_labor81), ffirst robust
estimates store b3five

ivreg2 grnfgsppr lcaplf70 sch0_1270 lpop70 grpop7007 govcon70 govcap70 taxburden70 frasier_labor81 (pccpop7507 interfrasier_labor81 = residencycount1964 campfull constage intresfrasier_labor81 intcampfrasier_labor81 intconfrasier_labor81), ffirst robust
estimates store b4five 

outreg2 [b1five b2five b3five b4five] using "C:\Documents and Settings\Syamarik\My Documents\My Research\Regional Corruption\Empirical\ Table5B.rtf", replace label dec(4) nocons addtext(Controls, YES, Reg Dummies, NO)   


log close

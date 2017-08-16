# Starlib Rate Library

## OVERVIEW

Starlib is a library of thermonuclear reaction and weak interaction rates. It lists in three columns, for about 50,000 nuclear interactions, the temperature (in GK), the thermonuclear reaction rate (in cm^3 s^-1 mol^-1) or decay rate
(in s^-1), and the uncertainty factor of the rate. Rates and uncertainty factors are listed on a temperature grid
from 0.001 GK to 10.0 GK. 

Specific information about Starlib can be found in 

- [A.L. Sallaska, C. Iliadis, A.E. Champagne, S. Goriely, S. Starrfield, 
and F.X. Timmes](http://iopscience.iop.org/article/10.1088/0067-0049/207/1/18/meta;jsessionid=FA2A43B811A79AC60CC83A94C160FA33.c4.iopscience.cld.iop.org) - 
*Starlib: A Next-Generation Reaction-Rate Library for Nuclear Astrophysics", Astrophys. J. Suppl. 207, 18 (2013)*. 


The library was originally constructed by [Christian Iliadis](https://users.physics.unc.edu/~iliadis/Site/Home.html) at the University of North Carolina at Chapel Hill.  The library can be retrieved as a zip file from this [link](https://github.com/Starlib/Rate-Library/blob/master/data/starlib.dat.zip)


The project was originally funded by the National Science Foundation under Award Number AST-1008355. At present, it is funded 
by NASA under the Astrophysics Theory Program grant 14-ATP14-0007 and by the U.S. Department of Energy under 
grant number DE-FG02-97ER41041. 

Below we provide some specific information. Some reaction labels may changed from the original 2013 publication
(Sallaska et al.), thus we provide the latest list of source labels. 

### CHAPTER NUMBERS

Chapter numbers are retained from reaclib format [FORMAT 2, WITH CHAPTERS 9-11], but in starlib they are placed in fields (1:2) of each link description line; meaning of chapter numbers:

- 1
e1 --> e2

- 2
e1 --> e2 + e3

- 3
e1 --> e2 + e3 + e4

- 4
e1 + e2 --> e3 

- 5
e1 + e2 --> e3 + e4

- 6
e1 + e2 --> e3 + e4 + e5

- 7
e1 + e2 --> e3 + e4 + e5 + e6

- 8
e1 + e2 + e3 --> e4

- 9
e1 + e2 + e3 --> e4 + e5

- 10
e1 + e2 + e3 + e4 --> e5 + e6

- 11
e1 --> e2 + e3 + e4 + e5

### EXPERIMENTAL MONTE CARLO-BASED REACTION RATES

At the time of this writing, about 70 experimental thermonuclear reaction rates are based on the Monte Carlo method first presented in
R. Longland, C. Iliadis, A.E. Champagne, J.R. Newton, C. Ugalde, A. Coc, and R. Fitzgerald, "Charged-Particle Thermonuclear Reaction Rates: I. Monte Carlo Method and STatistical Distributions", Nucl. Phys. A, 841, 1 (2010). 

More specifically, what is incorporated into the new library are: 

- (i)  the "median rate" (50 percentile) as recommended rate, *NOT* the rate calculated from the lognormal mu (the latter is an approximation to the true distribution); 
- (ii) the factor uncertainty, calculated using f.u.=exp(sigma), which is obtained from the
parameter sigma of the *LOGNORMAL APPROXIMATION TO THE RATE.*

### OTHER EXPERIMENTAL THERMONUCLEAR RATES

For experimental rates not based on the Monte Carlo method, what is incorporated into Starlib is: (i) the recommended rate as calculated from the reported low and high rates (left-hand side of Eq. (39) in Longland et al.); (ii) the factor uncertainty as calculated from the reported low and high rates (right-hand side of Eq. (39) in Longland et al.); thus we explicitly assume that these rates are lognormally distributed.

### REACTION SOURCE LABELS

### Reaction rates based on experiment:

- cf88
Caughlan and Fowler, ADNDT 40, 283 (1988) [38]

- de04
Descouvemont et al., ADNDT 88, 203 (2004) [18]

- mc10
Iliadis et al., NPA 841, 31 (2010) [110]

- mc13
Sallaska et al. [18]

- nacr
Angulo et al., NPA 656, 3 (1999) [55]

- taex
experimental neutron induced rates, extrapolated using TALYS [283]

### Reaction rates based on Hauser-Feshbach models:

- taly
Goriely, priv. comm. [62,230]

- fkth
Thielemann, Arnould and Truran, Adv. Nucl. Astrophys. (1987) [2]

### Decay rates based on experiment:

- au03w
Audi et al., NPA 729, 3 (2003) [544]
 bet-w
beta-minus decay [6]
  bet+w
beta-plus decay [1]

- ru09w
Rugel et al., PRL 103, 072502 (2009) [1] 60Fe

- wc12w
Tuli, wallet charts, National Nuclear Data Center (2012) [1694]

- be12w
Beringer et al. (2012) [PDG unpublished yet?]  [1] n lifetime

### Decay rates based on theory:

- bkmow
Klapdor, Metzinger and Oda, ADNDT 31, 81 (1984) [408] beta-

- btykw
Takahashi, Yamada and Kondo, ADNDT 12, 101 (1973) [6] beta+
     ec
pep reaction; 3He->t decay; 7Be—>7Li [3] *** 
- il11g
Iliadis et al., ApJS 193, 16 (2011) [14]

- ka88w
Kajino et al., NPA 480, 175 (1988) [2]

- mo92w
Moeller et al. (1992) [256] beta-

- mo03w
Moeller, Pfeiffer and Kratz, PRC 67, 055802 (2003) [4882]

## Individual rates:

- an06
[Ando et al., PRC 74, 025809 (2006)](http://prc.aps.org/abstract/PRC/v74/i2/e025809) [2]

- ar12
[Arnold et al., PRC 85, 044605 (2012)](http://prc.aps.org/abstract/PRC/v85/i4/e044605) [2]

- bb92
[Rauscher et al., ApJ 429, 499 (1994)](http://adsabs.harvard.edu/doi/10.1086/174339) [8]

- be01
[Beaumel et al., PLB 514, 226 (2001)](http://www.sciencedirect.com/science/article/pii/S0370269301008280) [2] 8B(p,g)

- bu15
Buckner et al., PRC 91, 015812 (2015)

- ce14
[Cesaratto et al., PRC 88, 065806 (2013)](http://journals.aps.org/prc/abstract/10.1103/PhysRevC.88.065806) [2]

- co15
Coc et al., PRD, submitted (2015) [3]

- cy08
[Cybert and Davids, PRC 78, 064614 (2008)](http://prc.aps.org/abstract/PRC/v78/i6/e064614) [2]

- fu90
[Fukugita & Kajino, PRD 42, 4251 (1990)](http://prd.aps.org/abstract/PRD/v42/i12/p4251_1) [2]

- ha10
[Hammache et al., PRC 82, 065803 (2010)](http://prc.aps.org/abstract/PRC/v82/i6/e065803) [2]

- il11
[Iliadis et al., ApJS 193, 16 (2011)](http://iopscience.iop.org/0067-0049/193/1/16) [17]

- il16
Iliadis et al., ApJ, submitted (2016) [3]

- im05
[Imbriani et al., Eur. Phys. J A 25, 455 (2005)](http://www.springerlink.com/content/35h4111k54373g47/) [2] 14N+p

- ke16
Kelly et al., to be published (2016)

- ku02
[Kunz et al., ApJ 567, 643 (2002)](http://iopscience.iop.org/0004-637X/567/1/643) [2] 12C+a

- mafo
[Malaney and Fowler, ApJ 345, L5 (1989)](http://adsabs.harvard.edu/doi/10.1086/185538) [16]

- mo14
Mohr, Longland & Iliadis, PRC 90, 065806 (2014)

- nk06
[Nagai et al., PRC 74, 025804 (2006)](http://prc.aps.org/abstract/PRC/v74/i2/e025804) [2]

- pe16  
[Perez-Loureiro et al., PRC 93, 064320 (2016)](https://journals.aps.org/prc/abstract/10.1103/PhysRevC.93.064320)

- po13
[Pogrebnyak et al., PRC 88, 015808 (2013)](http://journals.aps.org/prc/abstract/10.1103/PhysRevC.88.015808) [2]

- re98
[Rehm et al., PRL 80, 676 (1998)](http://prl.aps.org/abstract/PRL/v80/i4/p676_1)_ [2] 56Ni(p,g)

- rolf
Hulke et al., Z. Phys. A 297, 1 (1980) [6] 12C+20Ne

- se04
[Serpico et al. JCAP 12, 010 (2004)](http://iopscience.iop.org/1475-7516/2004/12/010) [2]

- ta03
[Tang et al., PRC 67, 015804 (2003)](http://prc.aps.org/abstract/PRC/v67/i1/e015804) [2] 11C(p,g)

- wies
Wiescher and collaborators [2] 15Opp


(**) From Caughlan & Fowler 1988; these rates need to be multiplied by rho*Ye!

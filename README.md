<img  align="top" src="banner.jpg" width="900">

# STARLIB: Thermonuclear Rate Library

### FILES FOR DOWNLOAD
[Starlib library]((https://github.com/Starlib/Rate-Library/blob/master/data/starlib_v66a_110618.dat.zip))
Contents and format are described in the paragraphs below.

[reduceNet.f](https://gist.github.com/RafaelSdeSouza/1d737c9b44dd263d58298469494d3e0a/archive/2a42280cf0ab2fd9d6899032864823607e6c777b.zip)
Fortran script for truncating the starlib library. It uses as input the (unzipped) starlib file downloaded by the users and a list of nuclides (sunet.dat; see link below) that the user would like to have in the reaction network. The output is a truncated starlib library that contains only links involving the nuclides listed in sunet.dat. 

sunet.dat()
A user-specified list of nuclides that defines the size of the reaction network. Format: one nuclide per line; each nuclide label must
be right-aligned in a field of 5; the element symbol comes before the mass number. Examples: "  c12" for 12C; " ne20" for 20Ne; etc. Special symbols: "    n" for neutron; "    p" for proton; "    d" for deuteron; "    t" for triton. The special case of 26Al: Starlib contains six species of 26Al, the ground state (" al-6), isomeric state (" al\*6"), three excited levels (" al01", " al02", " al03"), and 26Al in thermal equilibrium between ground and isomeric state (" al26"). The excited levels facilitate, in the hot stellar plasma, the transformation of the ground state to the excited state, and vice versa. The user, depending on the temperature-density conditions of the astrophysical environment to be modeled, needs to make a choice about which and how many of these 26Al species the reaction network should contain. Recommendations: if high temperatures (>0.5 GK) are of interest, it is sufficient to assume thermal equilibrium between the ground and isomeric state in 26Al and only one species is required (" al26"). At low temperatures (<100 MK) it can be assumed that the ground and isomeric states are not connected via excited 26Al levels and two species (" al-6" and " al\*6") are required. If intermediate temperatures are of interest, five species should be included in the network (" al-6", " al\*6", " al01", " al02", " al03"; but NOT " al26"!).

### OVERVIEW
Starlib is a library of thermonuclear reaction and laboratory weak interaction rates. It can be used for studies of stellar models and nucleosynthesis. Starlib lists in three columns, for about 50,000 nuclear interactions, the stellar temperature (in GK), the thermonuclear reaction rate (in cm^3 s^-1 mol^-1) or decay rate (in s^-1), and the uncertainty factor of the rate. The library was first introduced in the paper by [Sallaska et al. (2013)](http://iopscience.iop.org/article/10.1088/0067-0049/207/1/18/meta;jsessionid=FA2A43B811A79AC60CC83A94C160FA33.c4.iopscience.cld.iop.org).

The rates and uncertainty factors are listed on a temperature grid from 0.001 GK to 10.0 GK. Starlib incorporates about 70 experimental thermonuclear reaction rates that have been estimated using Monte Carlo methods. These methods were first introduced in papers by [Longland et al. (2010)](http://www.sciencedirect.com/science/article/pii/S0375947410004185?via%3Dihub) and [Iliadis et al. (2016)](http://iopscience.iop.org/article/10.3847/0004-637X/831/1/107/meta). Starlib has the unique feature of providing, at each temperature grid point, the probability density of the total reaction rate. This feature is important for realistic nucleosynthesis simulations, and has been discussed in the review paper by [Iliadis et al. (2015)](http://iopscience.iop.org/article/10.1088/0954-3899/42/3/034007/meta).   

The project was initially funded by the National Science Foundation under Award Number AST-1008355. At present, it is funded by NASA under the Astrophysics Theory Program grant 14-ATP14-0007 and by the U.S. Department of Energy under grant number DE-FG02-97ER41041. 

### STARLIB FORMAT
For each nuclear interaction contained in Starlib, the first line has a fixed format. It contains (i) the interaction type (see below) as an integer value in fields (1:2); (ii) the interacting nuclides before and after the interaction, where each nuclide label is right aligned in a field of size five; (iii) the rate reference label (see below) in fields (45:48); (iv) the interaction character in field 49, where "v", "w", and "g" stand for "reverse reaction", "laboratory weak inetraction", and "gamma-ray transition", respectively; (v) the energy released (+) or consumed (-) in the interaction in fields (54:65).

For each interaction contained in Starlib, the following lines list the reaction rates on a 60-value temperature grid from 0.001 GK to 10 GK. 

- Column 1: temperature value in GK.
- Column 2: the recommended rate; for experimental rates estimated using the Monte Carlo approach, the recommended rate is equal to the median rate (50 percentile).
- Column 3: the factor uncertainty of the rate; for experimental rates estimated using the Monte Carlo approach, the factor uncertainty is obtained from the lognormal spead parameter sigma via: f.u.=exp(sigma); notice that sigma corresponds to the lognormal approximation of the rate. 

Experimental rates that are not estimated using the Monte Carlo approach are incorporated into Starlib in the following manner: (i) the recommended rate as calculated from the reported low and high rates (left-hand side of Eq. (39) in [Longland et al. (2010)](http://www.sciencedirect.com/science/article/pii/S0375947410004185?via%3Dihub); (ii) the factor uncertainty is calculated from the reported low and high rates (right-hand side of Eq. (39) in [Longland et al. (2010)](http://www.sciencedirect.com/science/article/pii/S0375947410004185?via%3Dihub); thus it is explicitly assumed that these rates are lognormally distributed.

#### INTERACTION TYPE
The integer value between 1 and 11 in fields (1:2) denotes the following interaction types:

1. e1 --> e2
2. e1 --> e2 + e3
3. e1 --> e2 + e3 + e4
4. e1 + e2 --> e3 
5. e1 + e2 --> e3 + e4
6. e1 + e2 --> e3 + e4 + e5
7. e1 + e2 --> e3 + e4 + e5 + e6
8. e1 + e2 + e3 --> e4
9. e1 + e2 + e3 --> e4 + e5
10. e1 + e2 + e3 + e4 --> e5 + e6
11. e1 --> e2 + e3 + e4 + e5

#### RATE REFERENCE LABELS

Reaction rates based on experiment:

- cf88:
[Caughlan and Fowler, ADNDT 40, 283 (1988)](http://www.sciencedirect.com/science/article/pii/0092640X88900095) 
- de04:
[Descouvemont et al., ADNDT 88, 203 (2004)](http://www.sciencedirect.com/science/article/pii/S0092640X04000282) 
- mc10:
[Iliadis et al., NPA 841, 31 (2010)](http://www.sciencedirect.com/science/article/pii/S0375947410004197) 
- mc13:
[Sallaska et al., ApJ Supp. Ser. 207, 18 (2013)](http://iopscience.iop.org/0067-0049/207/1/18/) 
- nacr:
[Angulo et al., NPA 656, 3 (1999)](http://www.sciencedirect.com/science/article/pii/S0375947499000305) 
- taex:
experimental neutron induced rates, extrapolated using TALYS 

Reaction rates based on Hauser-Feshbach models:

- taly:
[Sallaska et al. ApJ Supp. Ser. 207, 18 (2013)](http://iopscience.iop.org/0067-0049/207/1/18/)
- fkth:
[Cowan, Thielemann, & Truran, Phys. Rep. 208, 267 (1991)](http://www.sciencedirect.com/science/article/pii/0370157391900703#) 

Weak laboratory decay rates based on experiment:

- au03w:
[Audi et al., NPA 729, 3 (2003)](http://www.sciencedirect.com/science/article/pii/S0375947403018074)
- bet-w:
beta-minus decay 
- bet+w: beta-plus decay
- ru09w:
[Rugel et al., PRL 103, 072502 (2009)](http://prl.aps.org/abstract/PRL/v103/i7/e072502)
- wc12w:
Tuli, wallet charts, [National Nuclear Data Center (2012)](http://www.nndc.bnl.gov/)
- be12w: Beringer et al. (2012) [Particle Data Group]

Weak laboratory decay rates based on theory:

- bkmow:
[Klapdor, Metzinger and Oda, ADNDT 31, 81 (1984)](http://www.sciencedirect.com/science/article/pii/0092640X84900172) 
- btykw:
[Takahashi, Yamada and Kondo, ADNDT 12, 101 (1973)](http://www.sciencedirect.com/science/article/pii/0092640X73900156) 

Weak stellar decay rates based on theory:

- ec:
pep reaction, 3He->t decay (from Caughlan & Fowler 1988; these two rates need to be multiplied by rho*Ye)
- ka88w:
[Kajino et al., NPA 480, 175 (1988)](http://www.sciencedirect.com/science/article/pii/0375947488903910) 
- mo92w:
Moeller et al. (1992) 
- mo03w:
[Moeller, Pfeiffer and Kratz, PRC 67, 055802 (2003)](http://prc.aps.org/abstract/PRC/v67/i5/e055802) 

Gamma-ray decay rates (for excited 26Al levels only):

- il11g:
[Iliadis et al., ApJS 193, 16 (2011)](http://iopscience.iop.org/0067-0049/193/1/16) 

Individual rates:

- an06:
[Ando et al., PRC 74, 025809 (2006)](http://prc.aps.org/abstract/PRC/v74/i2/e025809)
- ar12:
[Arnold et al., PRC 85, 044605 (2012)](http://prc.aps.org/abstract/PRC/v85/i4/e044605) 
- ba16:
[Barbagallo et al., PRL 117, 152701 (2016)](https://journals.aps.org/prl/pdf/10.1103/PhysRevLett.117.152701)
- bb92:
[Rauscher et al., ApJ 429, 499 (1994)](http://adsabs.harvard.edu/doi/10.1086/174339) 
- be01:
[Beaumel et al., PLB 514, 226 (2001)](http://www.sciencedirect.com/science/article/pii/S0370269301008280) 
- bu15:
[Buckner et al., PRC 91, 015812 (2015)](https://journals.aps.org/prc/abstract/10.1103/PhysRevC.91.015812)
- ce14:
[Cesaratto et al., PRC 88, 065806 (2013)](http://journals.aps.org/prc/abstract/10.1103/PhysRevC.88.065806) 
- co15:
[Coc et al., PRD 92, 123526 (2015)](https://journals.aps.org/prd/pdf/10.1103/PhysRevD.92.123526)
- cy08:
[Cybert and Davids, PRC 78, 064614 (2008)](http://prc.aps.org/abstract/PRC/v78/i6/e064614) 
- fu90:
[Fukugita & Kajino, PRD 42, 4251 (1990)](http://prd.aps.org/abstract/PRD/v42/i12/p4251_1)
- in17:
[Gomez Inesta et al., ApJ 849, 134(2017)](http://iopscience.iop.org/article/10.3847/1538-4357/aa9025/meta)
- ha10:
[Hammache et al., PRC 82, 065803 (2010)](http://prc.aps.org/abstract/PRC/v82/i6/e065803) 
- il11:
[Iliadis et al., ApJS 193, 16 (2011)](http://iopscience.iop.org/0067-0049/193/1/16) 
- il16:
[Iliadis et al., ApJ 831, 107 (2016)](http://iopscience.iop.org/article/10.3847/0004-637X/831/1/107/meta)
- im05:
[Imbriani et al., Eur. Phys. J A 25, 455 (2005)](http://www.springerlink.com/content/35h4111k54373g47/) 
- ke16:
[Kelly et al., PRC 95, 015806 (2017)](https://journals.aps.org/prc/pdf/10.1103/PhysRevC.95.015806)
- ku02:
[Kunz et al., ApJ 567, 643 (2002)](http://iopscience.iop.org/0004-637X/567/1/643)
- lo18:
[Longland et al., PRC 98, 025802 (2018)](https://journals.aps.org/prc/pdf/10.1103/PhysRevC.98.025802)
- mafo:
[Malaney and Fowler, ApJ 345, L5 (1989)](http://adsabs.harvard.edu/doi/10.1086/185538) 
- mo14:
[Mohr, Longland & Iliadis, PRC 90, 065806 (2014)](https://journals.aps.org/prc/abstract/10.1103/PhysRevC.90.065806)
- nk06:
[Nagai et al., PRC 74, 025804 (2006)](http://prc.aps.org/abstract/PRC/v74/i2/e025804) 
- pe16: 
[Perez-Loureiro et al., PRC 93, 064320 (2016)](https://journals.aps.org/prc/abstract/10.1103/PhysRevC.93.064320)
- po13:
[Pogrebnyak et al., PRC 88, 015808 (2013)](http://journals.aps.org/prc/abstract/10.1103/PhysRevC.88.015808)
- re98:
[Rehm et al., PRL 80, 676 (1998)](http://prl.aps.org/abstract/PRL/v80/i4/p676_1)
- rolf:
[Hulke et al., Z. Phys. A 297, 2 (1980)](https://link.springer.com/article/10.1007/BF01421473)
- se04:
[Serpico et al. JCAP 12, 010 (2004)](http://iopscience.iop.org/1475-7516/2004/12/010) 
- ta03:
[Tang et al., PRC 67, 015804 (2003)](http://prc.aps.org/abstract/PRC/v67/i1/e015804)
- wies:
Wiescher and collaborators

### PUBLICATIONS
[C. Iliadis, K.S. Anderson, A. Coc, F.X. Timmes, and S. Starrfield](http://iopscience.iop.org/article/10.3847/0004-637X/831/1/107/meta), *Bayesian Estimation of Thermonuclear Reaction Rates*, Astrophys. J. 831, 107 (2016).

[C. Iliadis, R. Longland, A. Coc, F.X. Timmes, and A.E. Champagne](http://iopscience.iop.org/article/10.1088/0954-3899/42/3/034007/meta), *Statistical Methods for Thermonuclear Reaction Rates and Nucleosynthesis Simulations*, J. Phys. G 42, 034007 (2015).

[R. Longland, C. Iliadis, A.E. Champagne, J.R. Newton, C. Ugalde, A. Coc, and R. Fitzgerald](http://www.sciencedirect.com/science/article/pii/S0375947410004185?via%3Dihub), *Charged-Particle Thermonuclear Reaction Rates: I. Monte Carlo Method and Statistical Distributions*, Nucl. Phys. A, 841, 1 (2010).

[A.L. Sallaska, C. Iliadis, A.E. Champagne, S. Goriely, S. Starrfield, and F.X. Timmes](http://iopscience.iop.org/article/10.1088/0067-0049/207/1/18/meta;jsessionid=FA2A43B811A79AC60CC83A94C160FA33.c4.iopscience.cld.iop.org), *Starlib: A Next-Generation Reaction-Rate Library for Nuclear Astrophysics*, Astrophys. J. Suppl. 207, 18 (2013). 

### STARLIB VERSION TRACKER
The current version is [Starlib\_v6.6\_110618](https://github.com/Starlib/Rate-Library/blob/master/data/starlib_v66a_110618.dat.zip). 


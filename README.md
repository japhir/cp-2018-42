# Scripts used in ‘The 405 kyr and 2.4 Myr eccentricity components in Cenozoic carbon isotope records’
[doi:10.5194/cp-2018-42](https://doi.org/10.5194/cp-2018-42) 
[climate of the past discussions](https://www.clim-past-discuss.net/cp-2018-42/) 
Currently under major revisions. 

The R-scripts used to generate the data composite are reported, as well as the
data sources used from the cited publications. 

| file                                     | reference                 |
|------------------------------------------|---------------------------|
| `data/320-U1334_d18O-d13C.tab`           | Beddow et al., 2016       |
| `data/321-U1337_isotope_benth_foram.tab` | Holbourn et al., 2015     |
| `data/Pälike_clean.csv`                  | Pälike et al., 2006       |
| `data/Tian_U1337_all.csv`                | Tian et al., 2013         |
| `data/Zachos2008.csv`                    | Zachos et al., 2001, 2008 |

R-code used to generate the figures was omitted, because it would require
substantial cleaning up and commenting.

The LOSCAR source code in C can be obtained from the authors by sending a
request to loscar.model@gmail.com. 

The LOSCAR model version used here was `2.0.4`. To see which changes were made
to the 2.0.4 LOSCAR model, see the patch file. In short, it introduces
astronomical forcing as a new input source, with some new variables
(`ORBSTRENGTH`, and `NOISELEVEL`) to tweak relative power. If you have access
to the Loscar source code, you can apply the patch running the following comand
from your terminal.

```{bash}
patch /Loscar/directory/ loscar.patch
```

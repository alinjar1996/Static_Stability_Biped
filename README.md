This repository contains codes of the research paper titled "Static Stability of Planar Contacting Systems: 
Analytical Treatment in Euclidean Space" with DOI: 10.1115/1.4064065 .

The research paper gives an exact theory in Euclidean space for studying the static stability of 
planar rigid systems held by one or more frictional and frictionless contacts under
gravity. Static stability analysis deals with determining the feasible locations of the
center of gravity (CG), which ensure stability.

Guideline to use the codes:

1. Equilibrium region codes are ‘eqregiontwocontactstair.m’ (Biped on stairs), ‘eqregiontwocontactinclplane.m’ (Biped on inclined plane) , ‘eqregiontwocontactcurved.m’ (Biped on curved surface), ‘eqregiontwocontactgripper.m’ (Gripper)
respectively for various stance scenarios. They calculate the equilibrium regions of the illustrated examples of case (c).

2. In the above-mentioned codes, the ratio of applied force and weight depends upon the line  F(z)=i*z*G/10; i = 1, 2. (The result for i = 0 is logically straightforward. Since only left friction cones are considered in the code(s), i=0 can not be determined by the same code(s).)


3. Note the minimum and maximum values on the y-axis of the Matlab plots. They are listed as the equilibrium regions in Table 2  of the paper and Table 5.3 in the thesis.

4. The results can be visualised in figures 10-12 in the paper and 5.27, 5.30, 5.33 and C.2 in the thesis.
The stability region for only curved contact (case c) needs to be calculated. The whole calculation is available in the code `frictiontwoconatctstabrgncurve.mlx’.

5. To see the stability region equation of a special case, i.e., Double frictionless contacts, run "check_ay_frictionless.mlx".   This is mentioned in equation (15) of the paper and equation (5.53) of the thesis. 
This equation is obtained for the first time in the literature.

   



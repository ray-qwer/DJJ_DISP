# DISP2

## structual similarity

this part is written at *similarity.py*

## read wave and fft

this part is written at *p2.m*

### result: 
source: the first 5 sec of rick roll

<img src="https://i.imgur.com/PBPuhBL.png" width="50%"/>


## edge detection filter

this part is written at *p3.m*

### source signal:
<img src="https://i.imgur.com/CZuUGRM.png" width="50%"/>

### filter
the filter is defined as
$h[n] = -Csgn[n]e^{-\sigma |n|}$

where $C = 1/\Sigma^{L}_{n=1} e^{-\sigma |n|}$

### result:
| $\sigma$ |figure |
|- | -|
|0.05 |<img src="https://i.imgur.com/PfC7IFh.png" width="50%" />|
| 2| <img src="https://i.imgur.com/vSlhAz4.png" width="50%" />|

## determine the trend

this part is written at *p4.m*

### source signal
<img src="https://i.imgur.com/BqQv8bC.png" width="50%"/>

### filter
the filter is defined as
$h[n] = Ce^{-\sigma |n|}$, for $|n|\leq L$

where $C = 1/\Sigma^{L}_{n=1} e^{-\sigma |n|}$

### result:
| $\sigma$ |figure |
|- | -|
|0.05 |<img src="https://i.imgur.com/KkOfiWn.png" width="50%" />|
| 2| <img src="https://i.imgur.com/jgupAID.png" width="50%" />|
     
need to padding the edge, or take "valid" when do convolution.


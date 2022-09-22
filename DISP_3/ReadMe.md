# DISP3

## Bilateral Filter

this part is written at *p1.m*

### filter
bilateral filter is defined as 
$x_0[n] = C[n] \Sigma^{n+L}_{m=n-L} y[m]e^{-k_1(n-m)^2}e^{-k_2(y[n]-y[m]^2)}$

where $C[n] = 1/\Sigma^{n+L}_{m=n-L} e^{-k_1(n-m)^2}e^{-k_2(y[n]-y[m]^2)}$

### source signal
<img src="https://i.imgur.com/A8lcOJp.png" width="50%"/>

### result
<img src="https://i.imgur.com/sI2RTdE.png" width="50%"/>



## matched filter

this part is written at *p2.m*

### filter
The filter is designed by 1. the pattern you want to search and 2. flipping.
Then standardize it by the energy of the fraction of signal.


### source signal
<img src="https://i.imgur.com/983f1jq.png" width="50%"/>

### result
<img src="https://i.imgur.com/RZoOwNf.png" width="50%"/>




## Image Fusion

this part is written at *p3.m*

### method
prepare two images, take the high frequency of one image and the low frequency of the other one, then combine them to produce a new image.

### source image
|image 1|image 2|
|-|-|
|<img src="https://i.imgur.com/q5iG89e.png" /> | <img src="https://i.imgur.com/bxhDwq8.jpg"/>|

### result
<img src="https://i.imgur.com/HGcx7Of.png" />


## Morphology

this part is written at *p4.m*

### source image
<img src="https://i.imgur.com/q5iG89e.png" />


### result

| erosion | dilation |
|:-------:|:--------:|
|<img src="https://i.imgur.com/01RFn5j.png" />|<img src="https://i.imgur.com/bX2SFKG.png" />|
|     **opening**    |   **closing**       |
|  <img src="https://i.imgur.com/vx7Jm2y.png" />|   <img src="https://i.imgur.com/XVMPyYX.png" />|

; Manually optimized with hdfsee
clen = $DETECTOR_DISTANCE ;0.1 
photon_energy = $PHOTON_ENERGY 
adu_per_photon = 1 
res = 13333.3 ; 75 micron pixel size 

; Uncomment these lines for multi-event file 
dim0 = % 
dim1 = ss 
dim2 = fs 
data = $data_h5path ;/entry/data/data 

; Uncomment this line for single-event test file 
;data = /data/data 

; Mask out strips between panels 

; Mask out bad pixels 
;mask_file = eiger-badmap.h5 
;mask = /data/data 
;mask_good = 0x0 
;mask_bad = 0x1 

bad_h1/min_fs = 0
bad_h1/max_fs = 2067
bad_h1/min_ss = 511
bad_h1/max_ss = 550

bad_h2/min_fs = 0
bad_h2/max_fs = 2067
bad_h2/min_ss = 1061
bad_h2/max_ss = 1100

bad_h2/min_fs = 0
bad_h2/max_fs = 2067
bad_h2/min_ss = 1611
bad_h2/max_ss = 1650

bad_v1/min_fs = 511
bad_v1/max_fs = 515
bad_v1/min_ss = 0
bad_v1/max_ss = 2161

bad_v2/min_fs = 1022
bad_v2/max_fs = 1040
bad_v2/min_ss = 0
bad_v2/max_ss = 2161

bad_v3/min_fs = 1551
bad_v3/max_fs = 1555
bad_v3/min_ss = 0
bad_v3/max_ss = 2161


panel0/min_fs = 0 
panel0/min_ss = 0 
panel0/max_fs = 2067 
panel0/max_ss = 2161 
panel0/corner_x = $ORGX
panel0/corner_y = $ORGY
panel0/fs = +1.000000x +0.000000y
panel0/ss = +0.000000x +1.000000y


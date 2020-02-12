pro xyzTOlb, x, y, z, l, b

; galactic b coord
    Rsun = 8.3
    dsun = sqrt((x+Rsun)*(x+Rsun) + y*y + z*z)
    b = 180/!PI*asin(z/dsun)
   	
; galactic l coord

    dxy = sqrt((x+Rsun)*(x+Rsun) + y*y)	  
    l = asin(y/dxy)*180/!PI

    idx = where(x gt 0 and y lt 0)
    if idx(0) ne -1 then l(idx) = l(idx)+360
    
    idx = where(x lt 0 and abs(x) gt Rsun)
    if idx(0) ne -1 then l(idx) = 180 - l(idx)

    idx = where(x lt 0 and y lt 0 and abs(x) lt Rsun)
    if idx(0) ne -1 then l(idx) = l(idx) + 360

end

THIS IS A FORK OF FDU_XK_CAPTCHA
ORIGINAL PROJECT: https://github.com/zhangboyang/fdu_xk_captcha

HOW TO BUILD XKOCR WITH VC++ 6.0
1. build libjpeg v8
2. copy libjpeg files (jpeglib.h jerror.h jconfig.h jmorecfg.h jpeg.lib) to src/xkocr
3. open src/xkocr/xkocr.dsw and build it

HOW TO BUILD SAMPLE PROGRAMS WITH VC++ 6.0 & VB 6.0
1. copy xkocr files (xkocr.lib) to src/ocr_single and src/ocr_batch
2. open src/ocr_single/ocr_single.dsw, src/ocr_batch/ocr_batch.dsw and build them
3. open src/ocr_single_vb/ocr_single_vb.vbp and build it

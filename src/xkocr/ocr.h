#ifndef XK_OCR_H
#define XK_OCR_H

#include "captcha.h"
int ocr_char(const xk_captcha_char p, int ch, char *ret);
int ocr_captcha(xk_captcha p, char ret[]);
__declspec(dllexport) int __stdcall ocr_jpeg(void *buf, int len, char ret[]);

#endif

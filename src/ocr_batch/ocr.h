#ifndef XK_OCR_H
#define XK_OCR_H
#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllimport) int __stdcall ocr_jpeg(void *buf, int len, char ret[]);

#ifdef __cplusplus
}
#endif
#endif

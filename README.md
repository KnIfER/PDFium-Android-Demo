
# Get the source code
Using submodule [LibPDFium](https://github.com/KnIfER/LibPDFium).

```
git clone --recursive https://github.com/KnIfER/PDFium-Android-Demo.git
```

Pdfium source codes are pulled from AOSP/android7.2.1_r36

Special Thanks:
- `bash-ndk *.mk` buildscripts via [barteksc/modpdfium](https://github.com/barteksc/modpdfium)

- `cmake` buildscript via [freedom10086/PdfiumAndroid](https://github.com/freedom10086/PdfiumAndroid)

- `Java & Jni` via [barteksc/AndroidPdfViewer](https://github.com/barteksc/AndroidPdfViewer)


# PDFium Android Demo Viewer

The beheaviour of this project is just like the original Demo project : *barteksc/AndroidPdfViewer*  

Yet this repo contains **three** build systems  :

1. **bash-ndk.**   
Use : Activate the LibPdfiumSep library module. Then right click on the `jni` folder and select 'Open In Ternimal' in the android studio. Run `ndk-build` and (hopefully) done !  
Develop : To develop the pre-compiled libpdfium.so, prepare win10 ubuntu subsystem or a real linux system.  `make` third_party, core , and fpdf_sdk sequentially.

2. **cmake.**  
Use / Develop : Activate LibPdfium. Then Just modify the CPP codes and click the `Run` button !

3. **visual studio.**   
VS project files are generated by [gyp](https://github.com/bnoordhuis/gyp) and are used only for testing on the windows.




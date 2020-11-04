
# Get the source code
Using submodule [LibPDFium](https://github.com/KnIfER/LibPDFium).

```
git clone --recursive --depth=1 https://github.com/KnIfER/PDFium-Android-Demo.git
```

Pdfium source codes (LibPdfium/src/main/PDFIUM) are pulled from AOSP/android11-mainline-release

Special Thanks:
- `bash-ndk *.mk` buildscripts via [barteksc/modpdfium](https://github.com/barteksc/modpdfium)

- `cmake` buildscript via [freedom10086/PdfiumAndroid](https://github.com/freedom10086/PdfiumAndroid)

- `Java & Jni` via [barteksc/AndroidPdfViewer](https://github.com/barteksc/AndroidPdfViewer)


# PDFium Android Demo Viewer

The beheaviour of this project is just like the original Demo project : *barteksc/AndroidPdfViewer*  

Yet this repo contains **three** build systems  :

1. **bash-ndk.**   
Use : Activate the LibPdfiumSep library module. Then right click on the `jni` folder and select 'Open In Ternimal' in the android studio. Run `ndk-build` and (hopefully) done !  
Develop : To develop the pre-compiled libpdfium.so, prepare win10 and ubuntu subsystem or a real linux system.  Then run `./build.sh`.

2. **cmake.**  
Use / Develop : Activate LibPdfium. Then Just sync and build !

3. **visual studio.**   
VS project files are configured by hand.




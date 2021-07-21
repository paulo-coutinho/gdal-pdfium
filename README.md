# GDAL + PDFium


[![Android](https://github.com/paulo-coutinho/gdal-pdfium/actions/workflows/android.yml/badge.svg)](https://github.com/paulo-coutinho/gdal-pdfium/actions/workflows/android.yml)
[![iOS](https://github.com/paulo-coutinho/gdal-pdfium/actions/workflows/ios.yml/badge.svg)](https://github.com/paulo-coutinho/gdal-pdfium/actions/workflows/ios.yml)


Project that compiles GDAL with PDFium backend.

## Requirements

- Python 3
- PIP
- CMake 3
- Conan 1.18
- Darwin Toolchain (iOS only): 

    ```conan remote add ezored https://ezoredrepository.jfrog.io/artifactory/api/conan/conan-local```

## How to compile for iOS

```
python make.py ios-build
```

## How to compile for Android

```
python make.py android-build
```

## Problems

Report issues here: https://github.com/paulo-coutinho/gdal-pdfium/issues

## Donate

Consider donate to help this project on SPONSOR button.

[:heart: Sponsor](https://github.com/sponsors/paulo-coutinho)


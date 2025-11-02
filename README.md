

# KAIMING ENGLISH GRAMMAR

This project uses AI to perform OCR, content organization, and translation of Lin Yutang's "KAIMING ENGLISH GRAMMAR" PDF scan.

## Processing Pipeline
1. **OCR Recognition**: Process original PDF pages with OCR, saved in `pages` directory
2. **Organization**: Use AI to structure OCR results into organized markdown format, saved in `chapters` directory
3. **Translation**: Use AI to translate English content to Chinese, saved in `translate` directory
4. **Build**: Use pandoc to convert markdown content to epub format.

## Dependencies
- pandoc

## Build

Build epub:
```bash
./build.sh
```

## Page Mapping
* Front Cover: page_1.png ~ page_4.png
* PREFACE: page_5.png ~ page_10.png
* FOREWORD: page_11.png ~ page_11.png
* Table Of Contents: page_13.png ~ page_22.png
* Page 1: page_23.png
* Page 2: page_24.png
* Page 3: page_25.png
* ...
* Page 444: page_466.png
* Rear Cover: page_467.png ~ page_468.png

## Resource
Original PDF download: https://taiwanebook.ncl.edu.tw/zh-tw/book/NCL-002528376

## License
This project is for educational and research purposes only.
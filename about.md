
#### Data

*Welcome to the Art Insight App!!*

The Tate's dataset comprises metadata for approximately 70,000 artworks owned by the **Tate Art Museum** and jointly owned with the National Galleries of Scotland as part of the ARTIST ROOMS collection. This dataset offers insights into the diverse world of art, including details about the artworks themselves and around 3,500 associated artists. Released under the Creative Commons Public Domain CC0 license, the metadata is freely accessible for research and development purposes. It's important to note that images are not part of the dataset and have separate usage guidelines. While the dataset was last updated in October 2014 and may not receive ongoing updates, its availability provides a valuable snapshot of the Tate's collection for analysis, exploration, and research. Tate encourages users to acknowledge their usage and support future data efforts through attribution.

#### Purpose

The purpose of the provided Shiny app is to offer an interactive platform for exploring and analyzing various aspects of the world of art as follows:

1. The app provides detailed information about selected artworks.Users can learn about the titles, mediums, dimensions, and other important aspects of these artworks, **gaining a deeper understanding of each piece's significance**.

2. The app allows users to **actively engage by leaving comments and ratings on artworks**. This feature promotes a sense of community and interaction among users who can share their perspectives and insights.

3. The app not only unveils the distribution of **male and female artists across continents** but also unravels the **intricate threads of acquisition trends within each gender**. 
 
#### Creator

Amrita Jena (ajen0022@student.monash.edu)

<details>
<summary>Session information</summary>

```
# ─ Session info ─────────────────────────────────────────────────────────────────────────────────────────────────────
#  setting  value
#  version  R version 4.3.1 (2023-06-16)
#  os       macOS Ventura 13.5.2
#  system   aarch64, darwin20
#  ui       RStudio
#  language (EN)
#  collate  en_US.UTF-8
#  ctype    en_US.UTF-8
#  tz       Australia/Melbourne
#  date     2023-09-20
#  rstudio  2022.12.0+353 Elsbeth Geranium (desktop)
#  pandoc   2.19.2 @ /Users/sudhajena/Desktop/tools/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)
# 
# ─ Packages ─────────────────────────────────────────────────────────────────────────────────────────────────────────
#  package        * version date (UTC) lib source
#  backports        1.4.1   2021-12-13 [1] CRAN (R 4.3.0)
#  bit              4.0.5   2022-11-15 [1] CRAN (R 4.3.0)
#  bit64            4.0.5   2020-08-30 [1] CRAN (R 4.3.0)
#  broom          * 1.0.5   2023-06-09 [1] CRAN (R 4.3.0)
#  bslib            0.5.0   2023-06-09 [1] CRAN (R 4.3.0)
#  cachem           1.0.8   2023-05-01 [1] CRAN (R 4.3.0)
#  cli              3.6.1   2023-03-23 [1] CRAN (R 4.3.0)
#  colorspace       2.1-0   2023-01-23 [1] CRAN (R 4.3.0)
#  commonmark       1.9.0   2023-03-17 [1] CRAN (R 4.3.0)
#  countrycode    * 1.5.0   2023-05-30 [1] CRAN (R 4.3.0)
#  crayon           1.5.2   2022-09-29 [1] CRAN (R 4.3.0)
#  crosstalk        1.2.0   2021-11-04 [1] CRAN (R 4.3.0)
#  curl             5.0.2   2023-08-14 [1] CRAN (R 4.3.0)
#  data.table       1.14.8  2023-02-17 [1] CRAN (R 4.3.0)
#  digest           0.6.33  2023-07-07 [1] CRAN (R 4.3.0)
#  dplyr          * 1.1.3   2023-09-03 [1] CRAN (R 4.3.0)
#  ellipsis         0.3.2   2021-04-29 [1] CRAN (R 4.3.0)
#  evaluate         0.21    2023-05-05 [1] CRAN (R 4.3.0)
#  fansi            1.0.4   2023-01-22 [1] CRAN (R 4.3.0)
#  farver           2.1.1   2022-07-06 [1] CRAN (R 4.3.0)
#  fastmap          1.1.1   2023-02-24 [1] CRAN (R 4.3.0)
#  forcats        * 1.0.0   2023-01-29 [1] CRAN (R 4.3.0)
#  generics         0.1.3   2022-07-05 [1] CRAN (R 4.3.0)
#  GGally           2.1.2   2021-06-21 [1] CRAN (R 4.3.0)
#  ggplot2        * 3.4.3   2023-08-14 [1] CRAN (R 4.3.0)
#  glue             1.6.2   2022-02-24 [1] CRAN (R 4.3.0)
#  gridExtra      * 2.3     2017-09-09 [1] CRAN (R 4.3.0)
#  gtable           0.3.4   2023-08-21 [1] CRAN (R 4.3.0)
#  here             1.0.1   2020-12-13 [1] CRAN (R 4.3.0)
#  highr            0.10    2022-12-22 [1] CRAN (R 4.3.0)
#  hms              1.1.3   2023-03-21 [1] CRAN (R 4.3.0)
#  htmltools        0.5.5   2023-03-23 [1] CRAN (R 4.3.0)
#  htmlwidgets      1.6.2   2023-03-17 [1] CRAN (R 4.3.0)
#  httpuv           1.6.11  2023-05-11 [1] CRAN (R 4.3.0)
#  httr             1.4.7   2023-08-15 [1] CRAN (R 4.3.0)
#  jquerylib        0.1.4   2021-04-26 [1] CRAN (R 4.3.0)
#  jsonlite         1.8.7   2023-06-29 [1] CRAN (R 4.3.0)
#  kableExtra     * 1.3.4   2021-02-20 [1] CRAN (R 4.3.0)
#  knitr            1.43    2023-05-25 [1] CRAN (R 4.3.0)
#  labeling         0.4.3   2023-08-29 [1] CRAN (R 4.3.0)
#  later            1.3.1   2023-05-02 [1] CRAN (R 4.3.0)
#  lattice          0.21-8  2023-04-05 [1] CRAN (R 4.3.1)
#  lazyeval         0.2.2   2019-03-15 [1] CRAN (R 4.3.0)
#  lifecycle        1.0.3   2022-10-07 [1] CRAN (R 4.3.0)
#  lubridate      * 1.9.2   2023-02-10 [1] CRAN (R 4.3.0)
#  magrittr         2.0.3   2022-03-30 [1] CRAN (R 4.3.0)
#  markdown         1.7     2023-05-16 [1] CRAN (R 4.3.0)
#  MASS           * 7.3-60  2023-05-04 [1] CRAN (R 4.3.1)
#  Matrix           1.5-4.1 2023-05-18 [1] CRAN (R 4.3.1)
#  memoise          2.0.1   2021-11-26 [1] CRAN (R 4.3.0)
#  mgcv             1.8-42  2023-03-02 [1] CRAN (R 4.3.1)
#  mime             0.12    2021-09-28 [1] CRAN (R 4.3.0)
#  munsell          0.5.0   2018-06-12 [1] CRAN (R 4.3.0)
#  nlme             3.1-162 2023-01-31 [1] CRAN (R 4.3.1)
#  palmerpenguins * 0.1.1   2022-08-15 [1] CRAN (R 4.3.0)
#  pillar           1.9.0   2023-03-22 [1] CRAN (R 4.3.0)
#  pkgconfig        2.0.3   2019-09-22 [1] CRAN (R 4.3.0)
#  plotly         * 4.10.2  2023-06-03 [1] CRAN (R 4.3.0)
#  plyr             1.8.8   2022-11-11 [1] CRAN (R 4.3.0)
#  promises         1.2.0.1 2021-02-11 [1] CRAN (R 4.3.0)
#  purrr          * 1.0.2   2023-08-10 [1] CRAN (R 4.3.0)
#  R6               2.5.1   2021-08-19 [1] CRAN (R 4.3.0)
#  RColorBrewer     1.1-3   2022-04-03 [1] CRAN (R 4.3.0)
#  Rcpp             1.0.11  2023-07-06 [1] CRAN (R 4.3.0)
#  readr          * 2.1.4   2023-02-10 [1] CRAN (R 4.3.0)
#  reshape          0.8.9   2022-04-12 [1] CRAN (R 4.3.0)
#  rlang            1.1.1   2023-04-28 [1] CRAN (R 4.3.0)
#  rmarkdown        2.23    2023-07-01 [1] CRAN (R 4.3.0)
#  rprojroot        2.0.3   2022-04-02 [1] CRAN (R 4.3.0)
#  rsconnect        1.0.1   2023-07-20 [1] CRAN (R 4.3.1)
#  rstudioapi       0.15.0  2023-07-07 [1] CRAN (R 4.3.0)
#  rvest            1.0.3   2022-08-19 [1] CRAN (R 4.3.0)
#  sass             0.4.7   2023-07-15 [1] CRAN (R 4.3.0)
#  SBpitch          1.0     2023-09-11 [1] Github (FCrSTATS/SBpitch@9dcb4f8)
#  scales           1.2.1   2022-08-20 [1] CRAN (R 4.3.0)
#  sessioninfo      1.2.2   2021-12-06 [1] CRAN (R 4.3.0)
#  shiny          * 1.7.4.1 2023-07-06 [1] CRAN (R 4.3.0)
#  stringi          1.7.12  2023-01-11 [1] CRAN (R 4.3.0)
#  stringr        * 1.5.0   2022-12-02 [1] CRAN (R 4.3.0)
#  svglite          2.1.1   2023-01-10 [1] CRAN (R 4.3.0)
#  systemfonts      1.0.4   2022-02-11 [1] CRAN (R 4.3.0)
#  tibble         * 3.2.1   2023-03-20 [1] CRAN (R 4.3.0)
#  tidyr          * 1.3.0   2023-01-24 [1] CRAN (R 4.3.0)
#  tidyselect       1.2.0   2022-10-10 [1] CRAN (R 4.3.0)
#  tidyverse      * 2.0.0   2023-02-22 [1] CRAN (R 4.3.0)
#  timechange       0.2.0   2023-01-11 [1] CRAN (R 4.3.0)
#  tourr          * 1.1.0   2023-08-24 [1] CRAN (R 4.3.0)
#  tzdb             0.4.0   2023-05-12 [1] CRAN (R 4.3.0)
#  utf8             1.2.3   2023-01-31 [1] CRAN (R 4.3.0)
#  vctrs            0.6.3   2023-06-14 [1] CRAN (R 4.3.0)
#  viridisLite      0.4.2   2023-05-02 [1] CRAN (R 4.3.0)
#  vroom            1.6.3   2023-04-28 [1] CRAN (R 4.3.0)
#  webshot          0.5.5   2023-06-26 [1] CRAN (R 4.3.0)
#  withr            2.5.0   2022-03-03 [1] CRAN (R 4.3.0)
#  xfun             0.39    2023-04-20 [1] CRAN (R 4.3.0)
#  xml2             1.3.5   2023-07-06 [1] CRAN (R 4.3.0)
#  xtable           1.8-4   2019-04-21 [1] CRAN (R 4.3.0)
#  yaml             2.3.7   2023-01-23 [1] CRAN (R 4.3.0)
# 
#  [1] /Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library
# 
# ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
</details>

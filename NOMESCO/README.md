NOMESCO
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
      - [Progess in number of events](#progess-in-number-of-events)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database finngen](#database-finngen)
      - [Database tays](#database-tays)

# Intro

The procedure classification is based on the NCSP Nordic Classification
of Surgical Procedures, first published in 1996. The NCSP classification
is maintained by the Nordic Classification Center (NCC) and is
copyrighted by NOMESKO
[ref](https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)

# Formating source vocabulary to OMOP

The NOMESCO codes have been downloaded from
[kodistopalvelu](https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)(7.5.2020).

The concept names were translated to English as follow:

  - `THL`: concept name in English already exists in the source table.
  - `Traslator`: missing names were send to a translator by
    <mary.reeve@helsinki.fi>

<!-- end list -->

    ## # A tibble: 3 x 2
    ##   name_en_source     n
    ##   <chr>          <int>
    ## 1 THL             9303
    ## 2 Translator      1983
    ## 3 <NA>              10

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/nomesco\_for\_source\_vocabulary.csv](1_source_vocabulary/nomesco_for_source_vocabulary.csv).

# Mapping the source vocabulary to the standard vocabularies

In short, USAGI in NOMESCO codes ranked by frequency calculated from
FinnGen-DF5 and TAYS-oncology.

The combined frequencies from TAYS-oncology and FinnGen-DF5
[3\_freq\_of\_source\_codes/freq\_total.csv](3_freq_of_source_codes/freq_total.csv)
were append to
[1\_source\_vocabulary/nomesco\_for\_source\_vocabulary.csv](1_source_vocabulary/nomesco_for_source_vocabulary.csv).
Resulting table was imported in to USAGY with vocabularies
[2\_mapping\_to\_standard/USAGI/VocabularyIds.txt](2_mapping_to_standard/USAGI/VocabularyIds.txt)
version
[2\_mapping\_to\_standard/USAGI/vocabularyVersion.txt](2_mapping_to_standard/USAGI/vocabularyVersion.txt).

Mapping was carried by medical student
[@kalleaseppala](github.com/kalleaseppala) and reviewed by
[@helmisuominen](github.com/helmisuominen).

### Progess in number of codes

From 11 275 codes 1 804 have been approved.

This makes 16% of codes approved.

    ## # A tibble: 3 x 2
    ##   mappingStatus      n
    ##   <chr>          <int>
    ## 1 APPROVED        1804
    ## 2 INVALID_TARGET    20
    ## 3 UNCHECKED       9451

### Progess in number of events

Accepted codes covers 95% of the total number of events in the combined
databases.

Accepted codes covers all codes with more than 742 events in the
combined databases.

Top50 of the unchecked events sort by number of events :

    ## # A tibble: 50 x 5
    ##    sourceCode sourceFrequency matchScore sourceName        `ADD_INFO:LongName`  
    ##    <chr>                <dbl>      <dbl> <chr>             <chr>                
    ##  1 ZXK00                  742      0.563 Conversion from ~ Toimenpiteen muuntam~
    ##  2 WW300                  731      0.542 Transfer of auto~ Autologinen kantasol~
    ##  3 NGJ62                  715      0.549 Internal fixatio~ S<U+FFFD><U+FFFD>rimurtumaleikkaus~
    ##  4 SJC01                  708      0.410 <NA>              Yksitt<U+FFFD>isen kiinnikk~
    ##  5 SPC20                  700      0.540 Attachment of cr~ Implanttikantoinen h~
    ##  6 QB2S1                  697      0.410 <NA>              Rintakeh<U+FFFD>n ihon tai ~
    ##  7 QCB05                  697      0.737 Revision of woun~ Yl<U+FFFD>raajan syv<U+FFFD>n ihoh~
    ##  8 KCW98                  691      0.611 Other translumin~ Muu virtsarakon toim~
    ##  9 JGB00                  690      0.606 Partial proctect~ Per<U+FFFD>suolen typistys,~
    ## 10 SDA04                  686      0.507 Very demanding p~ Parodontologinen hoi~
    ## # ... with 40 more rows

# Assessing coverage of databases

### Database finngen

**How many codes labeled as nomesco in finngen are not in the nomesco
standard?**

There are 260 codes not found in the standard

Top50 sort by freq:

| code  | freq | freq\_per |
| :---- | ---: | :-------- |
| XLA10 | 7408 | 0.127%    |
| RD211 | 3200 | 0.055%    |
| XF640 | 2477 | 0.043%    |
| 1LA05 | 1632 | 0.028%    |
| 1XC03 | 1619 | 0.028%    |
| WQ066 | 1300 | 0.022%    |
| 4AA12 | 1102 | 0.019%    |
| 6BA02 |  993 | 0.017%    |
| 1XC02 |  830 | 0.014%    |
| 1XC07 |  774 | 0.013%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_nomesco.csv](./3_freq_of_source_codes/finngen_not_in_nomesco.csv)

**Status of the nomesco codes in **finngen

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1899 | 32.428%    |   7098911 | 89.093%     |
| not\_mapped |     3697 | 63.132%    |    827042 | 10.380%     |
| not\_found  |      260 | 4.440%     |     42010 | 0.527%      |

### Database tays

**How many codes labeled as nomesco in tays are not in the nomesco
standard?**

There are 1 119 codes not found in the standard

Top50 sort by freq:

| code  |   freq | freq\_per |
| :---- | -----: | :-------- |
| S2600 | 181056 | 3.950%    |
| H0434 |  55791 | 1.217%    |
| H0519 |  52053 | 1.136%    |
| RS221 |  22833 | 0.498%    |
| H0275 |  21465 | 0.468%    |
| H0142 |  20850 | 0.455%    |
| H0113 |  20668 | 0.451%    |
| H0188 |  19077 | 0.416%    |
| H0130 |  16341 | 0.357%    |
| H0476 |  16253 | 0.355%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/tays\_not\_in\_nomesco.csv](./3_freq_of_source_codes/tays_not_in_nomesco.csv)

**Status of the nomesco codes in **tays

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1965 | 27.548%    |   4826176 | 81.043%     |
| not\_mapped |     4049 | 56.764%    |    160602 | 2.697%      |
| not\_found  |     1119 | 15.688%    |    968337 | 16.261%     |

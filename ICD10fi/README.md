ICD10fi
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database finngen](#database-finngen)
      - [Database tays](#database-tays)
  - [NOTES on missing codes](#notes-on-missing-codes)

# Intro

ICD10fi is an extension of the ICD10who standard. It largely follows the
ICD10WHO classification. The most significant differences are related to
the classification of external causes of injuries, illnesses and deaths
(Chapter XX), where the Finnish version of the classification has been
kept significantly narrower than the WHO version to ensure usability. In
addition, new national, more accurate or better differentiated diagnoses
reported at the five-character level have been included in the
classification.

An other characteristic of ICD10fi it combines codes to describe a more
accurate condition. The meaning of these depend on the union-mark used:

  - Classification codes: decrive ranges of codes other than the
    conventional ICD10 herarchy
      - `Code1-Code2` : from Code1 to Code2
  - Reason codes: combine codes to add more info on what caused the
    diagnose, there are 4 marks
      - `Code1*Code2` : “Oirekoodi”, Code2 indicates an additional
        symtom
      - `Code1+Code2` : “Syykoodi”, Code2 indicates the reason for Code1
      - `Code1#Code2` : ATC-koodi, Code2 is and ATC code indicating the
        medicine that caused Code1
      - `Code1&Code2` : “Kasvainkoodi”, Code2 is and endocrinological
        disorder code that caused Code1

[source](http://www.julkari.fi/bitstream/handle/10024/80324/15c30d65-2b96-41d7-aca8-1a05aa8a0a19.pdf?sequence=1&isAllowed=y)

# Formating source vocabulary to OMOP

The list of the icd10fi codes have been downloaded from the official
source:
[kodistopalvelu](https://91.202.112.142/codeserver/pages/publication-view-page.xhtml?distributionKey=9395&versionKey=58&returnLink=fromVersionPublicationList)(7.5.2020).

This table contains all the single codes, some composed-codes, and
classification. The last only used for hierarchy and not diagnose. In
addition, the table also contains the rules to generated other valid
composed-codes (in column `A:Huom`).

We generate new composed-codes based on the “1 code” codes that contain
generation rules in column `A:Huom`.

<div class="kable-table">

| tmp\_code\_class |     n |
| :--------------- | ----: |
| 1 code           | 13346 |
| 2 code           |  1037 |
| 2 code generated | 54099 |

</div>

For the how the English name was translated: `THL` if both were
translated by THL, `Google` if both were translated by
google-translator, and `THL+Google` if both.

<div class="kable-table">

| tmp\_name\_en\_source |     n |
| :-------------------- | ----: |
| THL                   | 51484 |
| THL+Google            | 14635 |
| Google                |  2363 |

</div>

Details in
[./1\_source\_vocabulary/README.md](./1_source_vocabulary/README.md)

# Mapping the source vocabulary to the standard vocabularies

In short, ICD10fi codes were match to ICD10who by code and English name
`ICD10who code and name_en` (English name with out a full match were
reviewed by [@helmisuominen](github.com/helmisuominen)). Several codes
in the ICD10fi table have the same name\_fi. We made sure that if any of
these was mapped to ICD10who, the rest mapped to the same code `ICD10who
name_fi`. These ICD10fi that didn’t match ICD10who were mapped to a
standard vocabulary using USAGI by
[@helmisuominen](github.com/helmisuominen) (`USAGI`). The “2 code
generated” are mapped to the mappings of both composing codes (`fully
mapped` if both codes have a mapping, `missing one` if not).

Following table summaries the codes by mapping type and code class.

<div class="kable-table">

| tmp\_code\_class | tmp\_mapping\_type         |     n |
| :--------------- | :------------------------- | ----: |
| 1 code           | ICD10who code and name\_en | 10676 |
| 1 code           | ICD10who name\_fi          |    15 |
| 1 code           | USAGI                      |   842 |
| 2 code           | ICD10who name\_fi          |    95 |
| 2 code           | USAGI                      |    64 |
| 2 code generated | fully mapped               | 31150 |
| 2 code generated | missing one                | 19880 |

</div>

This process is detailed in
[2\_mapping\_to\_standard/README.md](2_mapping_to_standard/README.md)

## Progess in number of codes

From 68 482 codes 62 722 have been approved.

This makes 92% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as ICD10fi in finngen are not in the atc
standard?**

There are 911 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| code1    | code2 | freq | freq\_per |
| :------- | :---- | ---: | :-------- |
| Z038     | NA    | 8015 | 0.046%    |
| E660     | NA    | 1557 | 0.009%    |
| K0401    | NA    | 1162 | 0.007%    |
| \-1      | NA    |  993 | 0.006%    |
| \-2      | NA    |  984 | 0.006%    |
| E890     | NA    |  901 | 0.005%    |
| F0019    | G301  |  827 | 0.005%    |
| H062     | E050  |  721 | 0.004%    |
| M073L405 | NA    |  640 | 0.004%    |
| N0832    | E102  |  605 | 0.003%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_ICD10fi.csv](./3_freq_of_source_codes/finngen_not_in_ICD10fi.csv)

**Status of the ICD10fi codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     7803 | 63.070%    |  16924333 | 96.356%     |
| not\_mapped |     3658 | 29.567%    |    582380 | 3.316%      |
| not\_found  |      911 | 7.363%     |     57676 | 0.328%      |

</div>

## Database tays

**How many codes labeled as ICD10fi in tays are not in the atc
standard?**

There are 238 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| code1   | code2 |   freq | freq\_per |
| :------ | :---- | -----: | :-------- |
| Pää     | NA    | 209109 | 2.078%    |
| H02AB06 | NA    |    848 | 0.008%    |
| L01CD02 | NA    |    299 | 0.003%    |
| L01XX24 | NA    |    200 | 0.002%    |
| V03AX   | NA    |    131 | 0.001%    |
| R518    | NA    |     95 | 0.001%    |
| M05BX04 | NA    |     91 | 0.001%    |
| V06DB   | NA    |     82 | 0.001%    |
| E660    | NA    |     81 | 0.001%    |
| H360    | NA    |     78 | 0.001%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/tays\_not\_in\_ICD10fi.csv](./3_freq_of_source_codes/tays_not_in_ICD10fi.csv)

**Status of the ICD10fi codes intays**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     8959 | 84.455%    |  10110937 | 96.365%     |
| not\_mapped |     1411 | 13.301%    |    168729 | 1.608%      |
| not\_found  |      238 | 2.244%     |    212620 | 2.026%      |

</div>

# NOTES on missing codes

NOTES:

  - Z038, E660, E890 : many are missing the last digit, should it be 0
    ??

  - K0401 : just don’t exists

  - F0019 G301 : not specify what can be include ?? **TOFIX**

  - H062 E050: invalid ?? “Etiologinen koodi valitaan ryhmästä B74”

  - H3603 E109 : invalid ?? In group H36\* “Etiologinen koodi valitaan
    tässä ryhmässä ryhmistäE10-E14. Neljäs merkki on .3”

  - M073L405 : should be fixed before or after in the ELT process

  - N0832 E102 : may be valid. In N08.3\* “Etiologinen koodi valitaan
    ryhmistä E10-E14.Neljänneksi merkiksi tulee valita .2” do i have to
    include subcodes ??

  - T36 N05BA: code2 is atc code which is correct but supose to be in
    code3 \!\!

  - many code1=NA what to do ??

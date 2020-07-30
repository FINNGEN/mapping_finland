ICD10fi
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [English traslation](#english-traslation)
      - [Extending composed-codes](#extending-composed-codes)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
      - [Progess in number of events](#progess-in-number-of-events)
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

Table describes a total of 14 681 codes distributed as follow:

<div class="kable-table">

| code\_class    |     n |
| :------------- | ----: |
| 1 code         | 13346 |
| 2 code         |  1037 |
| classification |   298 |

</div>

## English traslation

All codes come with the name in Finnish, in Swedish, and many, but not
all, also in English. For these missing we used Google-translator.

  - `THL`: concept name in English already exists in the source table.
  - `Google`: translated using Google-translator API

<div class="kable-table">

| name\_en\_source |     n |
| :--------------- | ----: |
| THL              | 12357 |
| Google           |  2324 |

</div>

## Extending composed-codes

We generate new composed-codes based on the “1 code” codes that contain
generation rules in column `A:Huom`. This process is detailed in
[1\_source\_vocabulary/generate\_missing\_composed\_codes.md](1_source_vocabulary/generate_missing_composed_codes.md).

This results in 54 099 new codes:

<div class="kable-table">

| code\_class      |     n |
| :--------------- | ----: |
| 2 code generated | 54099 |
| 1 code           | 13346 |
| 2 code           |  1037 |
| classification   |   298 |

</div>

For the new codes, name is given as both source code’s names joined by
“LIITTYVÄ”, “RELATERAD-TILL”, and “RELATED-TO” respectively for
name\_fi, name\_se, and name\_en.

For the validity dates, the latest is chose for valid\_start\_date and
the earliest for valid\_end\_date.

For the how the English name was translated: `THL` if both were
translated by THL, `Google` if both were translated by
google-translator, and `THL+Google` if both.

<div class="kable-table">

| name\_en\_source |     n |
| :--------------- | ----: |
| THL              | 51763 |
| THL+Google       | 14635 |
| Google           |  2382 |

</div>

# Mapping the source vocabulary to the standard vocabularies

In short, ICD10fi codes were match to ICD10who by code and English name
`ICD10who code and name_en` (English name with out a full match were
reviewed by [@helmisuominen](github.com/helmisuominen)). Several codes
in the ICD10fi table have the same name\_fi. We made sure that if any of
these was mapped to ICD10who, the rest mapped to the same code `ICD10who
name_fi`. These ICD10fi that didn’t match ICD10who were mapped to a
standard vocabulary using USAGI by
[@helmisuominen](github.com/helmisuominen) (`APPROVED` or `UNCHECKED`).
The “2 code generated” are mapped to the mappings of both composing
codes (`mappable` if both codes have a mapping, `missing one` if not).

Following table summaries the codes by mapping type and code class.

<div class="kable-table">

| code\_class      | Mapping\_type              |     n |
| :--------------- | :------------------------- | ----: |
| 1 code           | ICD10who code and name\_en | 10676 |
| 1 code           | UNCHECKED                  |  1813 |
| 1 code           | APPROVED                   |   842 |
| 1 code           | ICD10who name\_fi          |    15 |
| 2 code           | UNCHECKED                  |   878 |
| 2 code           | ICD10who name\_fi          |    95 |
| 2 code           | APPROVED                   |    64 |
| 2 code generated | mappeable                  | 44827 |
| 2 code generated | missing one                |  9272 |
| classification   | NA                         |   298 |

</div>

This process is detailed in
[2\_mapping\_to\_standard/mapping\_ICD10fi.md](2_mapping_to_standard/mapping_ICD10fi.md)

## Progess in number of codes

From 68 482 codes 56 519 have been approved.

This makes 83% of codes mapped.

<div class="kable-table">

| mapped |     n |
| :----- | ----: |
| TRUE   | 56519 |
| FALSE  | 11963 |

</div>

## Progess in number of events

Accepted codes covers 98.96% of the total number of events in the
combined databases.

Accepted codes covers all codes with more than 50 040 events in the
combined databases.

Top10 of the unchecked events sort by number of events :

<div class="kable-table">

| code   | code1 | code2 | freq\_total | code\_class | name\_en                                                    | name\_fi                                                                   |
| :----- | :---- | :---- | ----------: | :---------- | :---------------------------------------------------------- | :------------------------------------------------------------------------- |
| K51.5  | K515  | NA    |       50040 | 1 code      | Mucosal proctocolitis                                       | Peräsuolen ja koolonin limakalvotulehdus                                   |
| C91.1  | C911  | NA    |       41551 | 1 code      | Chronic lymphocytic leukaemia                               | Pitkäaikainen lymfosyyttileukemia                                          |
| M47.82 | M4782 | NA    |       18041 | 1 code      | Thoracic spondylosis without myelopathy or radiculopathy    | Lanne-ristirangan spondyloosi ilman selkäytimen tai hermojuurten sairautta |
| T36\#  | T36   | NA    |       17584 | 1 code      | Poisoning by medicine                                       | Lääkkeen aiheuttama myrkytys                                               |
| C92.1  | C921  | NA    |       13344 | 1 code      | Chronic myeloid leukaemia                                   | Pitkäaikainen myelooinen leukemia                                          |
| C30.0& | C300  | NA    |        9434 | 1 code      | Malignant neoplasm of nasal cavity and middle ear           | Nenäontelon syöpä                                                          |
| M47.80 | M4780 | NA    |        6230 | 1 code      | Cervical spondylosis without myelopathy or radiculopathy    | Kaularangan spondyloosi ilman selkäytimen tai hermojuurten sairautta       |
| C81.0& | C810  | NA    |        3931 | 1 code      | Lymphocytic predominance                                    | Runsaslymfosyyttinen Hodgkinin tauti                                       |
| H54.2  | H542  | NA    |        2093 | 1 code      | Low vision, both eyes                                       | Molempien silmien heikkonäköisyys                                          |
| M47.81 | M4781 | NA    |         987 | 1 code      | Lumbosacral spondylosis without myelopathy or radiculopathy | Rintarangan spondyloosi ilman selkäytimen tai hermojuurten sairautta       |

</div>

TOFIX: something happened. 16 codes with high freq went somehow out of
USAGI. Because, Helmi mapped all these below 400 freq \!\!

# Assessing coverage of databases

## Database finngen

**How many codes labeled as icd10fi in finngen are not in the icd10fi
standard?**

There are 344 codes not found in the standard

Top10 sort by freq:

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

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_icd10fi.csv](./3_freq_of_source_codes/finngen_not_in_icd10fi.csv)

**Status of the icd10fi codes in finngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     7801 | 86.842%    |  16924260 | 98.842%     |
| not\_mapped |      838 | 9.329%     |    162547 | 0.949%      |
| not\_found  |      344 | 3.829%     |     35777 | 0.209%      |

## Database tays

**How many codes labeled as icd10fi in tays are not in the icd10fi
standard?**

There are 238 codes not found in the standard

Top10 sort by freq:

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

The full list can be found in
[./3\_freq\_of\_source\_codes/tays\_not\_in\_icd10fi.csv](./3_freq_of_source_codes/tays_not_in_icd10fi.csv)

**Status of the icd10fi codes in tays**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     8959 | 84.455%    |  10110937 | 96.365%     |
| not\_mapped |     1411 | 13.301%    |    168729 | 1.608%      |
| not\_found  |      238 | 2.244%     |    212620 | 2.026%      |

# NOTES on missing codes

NOTES: - Z038, E660, E890 : many are missing the last digit, should it
be 0 ?? - K0401 : just don’t exists - F0019 G301 : not specify what can
be include ?? **TOFIX** - H062 E050: invalid ?? “Etiologinen koodi
valitaan ryhmästä B74” - H3603 E109 : invalid ?? In group H36\*
“Etiologinen koodi valitaan tässä ryhmässä ryhmistäE10-E14. Neljäs
merkki on .3” - M073L405 : should be fixed before or after in the ELT
process

  - N0832 E102 : may be valid. In N08.3\* “Etiologinen koodi valitaan
    ryhmistä E10-E14.Neljänneksi merkiksi tulee valita .2” do i have to
    include subcodes ??

  - T36 N05BA: code2 is atc code which is correct but supose to be in
    code3 \!\!

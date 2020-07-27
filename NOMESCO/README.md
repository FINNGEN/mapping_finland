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

<div class="kable-table">

| name\_en\_source |    n |
| :--------------- | ---: |
| THL              | 9303 |
| Translator       | 1983 |
| NA               |   10 |

</div>

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

## Progess in number of codes

From 11 275 codes 1 804 have been approved.

This makes 16% of codes approved.

<div class="kable-table">

| mappingStatus   |    n |
| :-------------- | ---: |
| APPROVED        | 1804 |
| INVALID\_TARGET |   20 |
| UNCHECKED       | 9451 |

</div>

## Progess in number of events

Accepted codes covers 95% of the total number of events in the combined
databases.

Accepted codes covers all codes with more than 742 events in the
combined databases.

Top10 of the unchecked events sort by number of events :

<div class="kable-table">

| sourceCode | sourceFrequency | matchScore | sourceName                                                                                      | ADD\_<INFO:LongName>                                                                                                        |
| :--------- | --------------: | ---------: | :---------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- |
| ZXK00      |             742 |  0.5634167 | Conversion from percutaneous endoscopic to open procedure                                       | Toimenpiteen muuntaminen t\<U+FFFD\>hystystoimenpiteest\<U+FFFD\> avoimeksi leikkaukseksi                                   |
| WW300      |             731 |  0.5420110 | Transfer of autologic stem cells                                                                | Autologinen kantasolusiirto                                                                                                 |
| NGJ62      |             715 |  0.5485615 | Internal fixation of fracture of knee or lower leg using plate and screws, other or unspecified | S\<U+FFFD\>\<U+FFFD\>rimurtumaleikkaus levyll\<U+FFFD\>                                                                     |
| SJC01      |             708 |  0.4095736 | NA                                                                                              | Yksitt\<U+FFFD\>isen kiinnikkeen paikan m\<U+FFFD\>\<U+FFFD\>ritys ja etsauskiinnitys (Etsattava tai muu vastaava kiinnike) |
| SPC20      |             700 |  0.5401430 | Attachment of crone of tooth to implant                                                         | Implanttikantoinen hammaskruunu                                                                                             |
| QB2S1      |             697 |  0.4095736 | NA                                                                                              | Rintakeh\<U+FFFD\>n ihon tai ihonalaiskudoksen valokuvaus                                                                   |
| QCB05      |             697 |  0.7368926 | Revision of wound of skin of upper limb                                                         | Yl\<U+FFFD\>raajan syv\<U+FFFD\>n ihohaavan revisio ja mahdollinen sulku                                                    |
| KCW98      |             691 |  0.6113638 | Other transluminal endoscopic operation on bladder                                              | Muu virtsarakon toimenpide virtsatiet\<U+FFFD\>hystyksess\<U+FFFD\>                                                         |
| JGB00      |             690 |  0.6055401 | Partial proctectomy and colorectal or coloanal anastomosis                                      | Per\<U+FFFD\>suolen typistys, anteriorinen resektio                                                                         |
| SDA04      |             686 |  0.5065472 | Very demanding parodonthologic therapy                                                          | Parodontologinen hoito, pitk\<U+FFFD\>kestoinen                                                                             |

</div>

# Assessing coverage of databases

## Database finngen

**How many codes labeled as nomesco in finngen are not in the nomesco
standard?**

There are 260 codes not found in the standard

Top10 sort by freq:

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

**Status of the nomesco codes infinngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1899 | 32.428%    |   7098911 | 89.093%     |
| not\_mapped |     3697 | 63.132%    |    827042 | 10.380%     |
| not\_found  |      260 | 4.440%     |     42010 | 0.527%      |

## Database tays

**How many codes labeled as nomesco in tays are not in the nomesco
standard?**

There are 1 119 codes not found in the standard

Top10 sort by freq:

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

**Status of the nomesco codes intays**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1965 | 27.548%    |   4826176 | 81.043%     |
| not\_mapped |     4049 | 56.764%    |    160602 | 2.697%      |
| not\_found  |     1119 | 15.688%    |    968337 | 16.261%     |

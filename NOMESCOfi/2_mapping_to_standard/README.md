NOMESCOfi mappings
================

## Mapping type : USAGUI

#### Preparation fotrUSAGI

The combined frequencies from TAYS-oncology and FinnGen-DF5
[../3\_freq\_of\_source\_codes/freq\_total.csv](../3_freq_of_source_codes/freq_total.csv)
were append to
[../1\_source\_vocabulary/CONCEPT\_NOMESCOfi.csv](1_source_vocabulary/CONCEPT_CLASS_NOMESCOfi.csv).
Resulting table was imported in to USAGY with vocabularies
[./USAGI/VocabularyIds.txt](2_mapping_to_standard/USAGI/VocabularyIds.txt)
version
[./USAGI/vocabularyVersion.txt](2_mapping_to_standard/USAGI/vocabularyVersion.txt).

Mapping was carried by medical student
[@kalleaseppala](github.com/kalleaseppala) and reviewed by
[@helmisuominen](github.com/helmisuominen).

#### After USAGI

Summary of mapping progress after USAGI:

<div class="kable-table">

| mappingStatus   |    n |
| :-------------- | ---: |
| APPROVED        | 1804 |
| INVALID\_TARGET |   20 |
| UNCHECKED       | 9451 |

</div>

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

## Formating mappigs to OMOP

Mappings based on USAGI.

  - For valid\_start\_date max of source concept and mapped concept is
    chosen
  - For valid\_end\_date min of source concept and mapped concept is
    chosen

<div class="kable-table">

| concept\_id\_1 | concept\_id\_2 | relationship\_id | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_mapping\_type | tmp\_domain\_id\_2 |
| -------------: | -------------: | :--------------- | :----------------- | :--------------- | :-------------- | :----------------- | :----------------- |
|             10 |        4184771 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             11 |        4145739 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             11 |        4125350 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             13 |        4082979 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             16 |       46272801 | Maps to          | 2015-07-31         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             16 |       36713176 | Maps to          | 2017-01-31         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             16 |        4288538 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             16 |        4244986 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             18 |        4082979 | Maps to          | 1999-01-01         | 2030-12-31       | NA              | USAGI              | Procedure          |
|             18 |       37311324 | Maps to          | 2020-03-09         | 2030-12-31       | NA              | USAGI              | Procedure          |

</div>

## Recalculate domain

<div class="kable-table">

| domain\_id          |     n |
| :------------------ | ----: |
| Procedure           | 11174 |
| Observation         |    72 |
| Measurement         |    21 |
| Obs/Procedure       |    10 |
| Metadata            |     6 |
| Condition           |     5 |
| Condition/Procedure |     2 |

</div>

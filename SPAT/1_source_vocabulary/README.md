SPAT source vocabulary
================

  - [Import Vocabulary](#import-vocabulary)
  - [Traslation to English](#traslation-to-english)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [Create VOCABULARY table](#create-vocabulary-table)
      - [Create CONCEPT\_CLASS table](#create-concept_class-table)
      - [Create CONCEPT table](#create-concept-table)
      - [Create CONCEPT\_SYNONYM table](#create-concept_synonym-table)

## Import Vocabulary

The list of the SPAT codes have been downloaded from the official
source:
[kodistopalvelu](https://91.202.112.142/codeserver/pages/classification-view-page.xhtml?classificationKey=393&versionKey=471)(7.5.2020).

It contains the codes, Finnish names, Swedish names, and validity
periods.

All the codes missed the English names which was added by a professional
translator (Elina Ritala Lääketieteellinen käännöstoimisto Oy)

TODO ask [@CoderMikolaj](github.com/CoderMikolaj) if this is correct.

## Traslation to English

The concept names were translated to English as follow: - `Traslator`:
missing names were send to a translator by <mary.reeve@helsinki.fi>

<div class="kable-table">

| name\_en\_source |   n |
| :--------------- | --: |
| Traslator        | 415 |

</div>

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :--------------- | :-------------------- | :------------------ | ----------------------: |
| SPAT           | SPAT             |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name | concept\_class\_concept\_id |
| :----------------- | :------------------- | --------------------------: |
| SPAT               | SPAT                 |                           2 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Condition” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                                                       | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi                                 | tmp\_name\_en\_source |
| ----------: | :------------------------------------------------------------------ | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :-------------------------------------------- | :-------------------- |
|           1 | SPAT                                                                | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                            | NA                    |
|           2 | SPAT                                                                | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                            | NA                    |
|           3 | EYE AREA                                                            | Condition  | SPAT           | SPAT               | NA                | SPAT1000       | 2009-01-01         | 2099-12-31       | NA              | SILMÄN ALUE                                   | Traslator             |
|           4 | Puncture of abscess of eyelid                                       | Condition  | SPAT           | SPAT               | NA                | SPAT1001       | 2009-01-01         | 2010-12-31       | NA              | Silmäluomen paiseen puhkaisu                  | Traslator             |
|           5 | Excision or drainage of chalazion                                   | Condition  | SPAT           | SPAT               | NA                | SPAT1002       | 2009-01-01         | 2099-12-31       | NA              | Luomirakkulan poisto tai tyhjennys            | Traslator             |
|           6 | Suture of wound of eyelid                                           | Condition  | SPAT           | SPAT               | NA                | SPAT1003       | 2009-01-01         | 2010-12-31       | NA              | Silmäluomen haavan ompelu                     | Traslator             |
|           7 | Incision of lacrimal point or canaliculus                           | Condition  | SPAT           | SPAT               | NA                | SPAT1004       | 2009-01-01         | 2017-12-31       | NA              | Kyynelpisteen tai -tiehyeen aukaisu           | Traslator             |
|           8 | Removal of foreign body from conjunctiva                            | Condition  | SPAT           | SPAT               | NA                | SPAT1005       | 2009-01-01         | 2017-12-31       | NA              | Vierasesineen poisto sidekalvolta             | Traslator             |
|           9 | Removal of foreign body from conjunctiva under regional anaesthesia | Condition  | SPAT           | SPAT               | NA                | SPAT1006       | 2009-01-01         | 2010-12-31       | NA              | Sidekalvon vierasesineen poisto puudutuksessa | Traslator             |
|          10 | Removal of foreign body from cornea                                 | Condition  | SPAT           | SPAT               | NA                | SPAT1007       | 2009-01-01         | 2017-12-31       | NA              | Vierasesineen poisto sarveiskalvosta          | Traslator             |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                        | language\_concept\_id |
| ----------: | :-------------------------------------------- | --------------------: |
|           3 | SILMÄN ALUE                                   |               4181730 |
|           4 | Silmäluomen paiseen puhkaisu                  |               4181730 |
|           5 | Luomirakkulan poisto tai tyhjennys            |               4181730 |
|           6 | Silmäluomen haavan ompelu                     |               4181730 |
|           7 | Kyynelpisteen tai -tiehyeen aukaisu           |               4181730 |
|           8 | Vierasesineen poisto sidekalvolta             |               4181730 |
|           9 | Sidekalvon vierasesineen poisto puudutuksessa |               4181730 |
|          10 | Vierasesineen poisto sarveiskalvosta          |               4181730 |
|          11 | Silmänpohjan valokuvaus tai kuvan tulkinta    |               4181730 |
|          12 | Silmänpaineen mittaus                         |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi | n\_witn\_name\_se |
| -------: | ----------------: | ----------------: |
|      415 |               415 |               415 |

</div>

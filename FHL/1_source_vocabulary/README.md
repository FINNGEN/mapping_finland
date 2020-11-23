fhl source vocabulary
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

from Mary

## Traslation to English

The concept names were translated to English as follow:

  - `Google`:

<div class="kable-table">

| name\_en\_source |    n |
| :--------------- | ---: |
| Google           | 1639 |

</div>

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name       | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :--------------------- | :-------------------- | :------------------ | ----------------------: |
| FHL            | Finnish Hospital Leage |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name   | concept\_class\_concept\_id |
| :----------------- | :--------------------- | --------------------------: |
| FHL                | Finnish Hospital Leage |                           2 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Procedure” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                               | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi                               | tmp\_name\_en\_source |
| ----------: | :------------------------------------------ | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :------------------------------------------ | :-------------------- |
|           1 | Finnish Hospital Leage                      | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                          | NA                    |
|           2 | FHL                                         | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                          | NA                    |
|           3 | Anthroscopy                                 | Procedure  | FHL            | FHL                | NA                | 1210           | 1970-01-01         | 2099-12-31       | NA              | Antroskopia                                 | Google                |
|           4 | Arthroscopy                                 | Procedure  | FHL            | FHL                | NA                | 1220           | 1970-01-01         | 2099-12-31       | NA              | Artroskopia                                 | Google                |
|           5 | Arthroscopy and meniscus surgery            | Procedure  | FHL            | FHL                | NA                | 1221           | 1970-01-01         | 2099-12-31       | NA              | Artroskopia ja meniskileikkaus              | Google                |
|           6 | Arthroscopy and synovial surgery            | Procedure  | FHL            | FHL                | NA                | 1222           | 1970-01-01         | 2099-12-31       | NA              | Artroskopia ja synovialeikkaus              | Google                |
|           7 | Arthroscopy and articular cartilage surgery | Procedure  | FHL            | FHL                | NA                | 1223           | 1970-01-01         | 2099-12-31       | NA              | Artroskopia ja nivelrustoleikkaus           | Google                |
|           8 | Arthroscopy and loose removal               | Procedure  | FHL            | FHL                | NA                | 1224           | 1970-01-01         | 2099-12-31       | NA              | Artroskopia ja irtopalan poisto             | Google                |
|           9 | Arthroscopy and other therapeutic procedure | Procedure  | FHL            | FHL                | NA                | 1225           | 1970-01-01         | 2099-12-31       | NA              | Artroskopia ja muu terapeuttinen toimenpide | Google                |
|          10 | Bronchomediastinoscopy                      | Procedure  | FHL            | FHL                | NA                | 1230           | 1970-01-01         | 2099-12-31       | NA              | Bronkomediastinoskopia                      | Google                |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                      | language\_concept\_id |
| ----------: | :------------------------------------------ | --------------------: |
|           3 | Antroskopia                                 |               4181730 |
|           4 | Artroskopia                                 |               4181730 |
|           5 | Artroskopia ja meniskileikkaus              |               4181730 |
|           6 | Artroskopia ja synovialeikkaus              |               4181730 |
|           7 | Artroskopia ja nivelrustoleikkaus           |               4181730 |
|           8 | Artroskopia ja irtopalan poisto             |               4181730 |
|           9 | Artroskopia ja muu terapeuttinen toimenpide |               4181730 |
|          10 | Bronkomediastinoskopia                      |               4181730 |
|          11 | Bronkoskopia                                |               4181730 |
|          12 | Bronkoskopia ja vierasesineen poisto        |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi |
| -------: | ----------------: |
|     1639 |              1639 |

</div>

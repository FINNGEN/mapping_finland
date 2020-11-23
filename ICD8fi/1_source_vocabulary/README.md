ICD8fi source vocabulary
================

  - [Import Vocabulary](#import-vocabulary)
  - [Traslation to English](#traslation-to-english)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [Create VOCABULARY table](#create-vocabulary-table)
      - [Create CONCEPT\_CLASS table](#create-concept_class-table)
      - [Create CONCEPT table](#create-concept-table)

## Import Vocabulary

TODO ask [@CoderMikolaj](github.com/CoderMikolaj) how table was created.

Some seem to be classification codes xxx-xxx. Remove these

## Traslation to English

The concept names were translated to English as follow:

  - `THL`: concept name in English already exists in the source table.
  - `Google`: Missing English translations were made using
    Google-translator (TODO:)

<div class="kable-table">

| name\_en\_source |    n |
| :--------------- | ---: |
| THL              | 6037 |
| Google           |  695 |

</div>

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name          | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :------------------------ | :-------------------- | :------------------ | ----------------------: |
| ICD8fi         | ICD8 Finnish modification |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name               | concept\_class\_concept\_id |
| :----------------- | :--------------------------------- | --------------------------: |
| 3-digit ICD8fi     | 3 digits ICD8 Finnish Modification |                           5 |
| 4-digit ICD8fi     | 4 digits ICD8 Finnish Modification |                           6 |
| 5-digit ICD8fi     | 5 digits ICD8 Finnish Modification |                           7 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Condition” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name             | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi    | tmp\_name\_en\_source |
| ----------: | :------------------------ | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :--------------- | :-------------------- |
|           1 | ICD8 Finnish modification | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA               | NA                    |
|           5 | 3-digit ICD8fi            | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA               | NA                    |
|           6 | 4-digit ICD8fi            | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA               | NA                    |
|           7 | 5-digit ICD8fi            | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA               | NA                    |
|           8 | Cholera                   | Condition  | ICD8fi         | 3-digit ICD8fi     | NA                | 000            | 1970-01-01         | 2299-11-03       | NA              | Kolera           | THL                   |
|           9 | Classical Cholera         | Condition  | ICD8fi         | 5-digit ICD8fi     | NA                | 00001          | 1970-01-01         | 2299-11-03       | NA              | Kolera, Classica | THL                   |
|          10 | Cholera, El Tor           | Condition  | ICD8fi         | 5-digit ICD8fi     | NA                | 00010          | 1970-01-01         | 2299-11-03       | NA              | Kolera, El Tor   | THL                   |
|          11 | Cholera, Suspecta         | Condition  | ICD8fi         | 5-digit ICD8fi     | NA                | 00097          | 1970-01-01         | 2299-11-03       | NA              | Kolera, Suspecta | THL                   |
|          12 | Cholera, Unspecified      | Condition  | ICD8fi         | 5-digit ICD8fi     | NA                | 00099          | 1970-01-01         | 2299-11-03       | NA              | Kolera, NUD      | THL                   |
|          13 | Typhoid fever             | Condition  | ICD8fi         | 3-digit ICD8fi     | NA                | 001            | 1970-01-01         | 2299-11-03       | NA              | Lavantauti       | THL                   |

</div>

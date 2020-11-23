ICPC mappings
================

## Mapping type : to ICD10

Source table has a column indicating the icd10fi equivalent

## Formating mappigs to OMOP

  - For valid\_start\_date max of source concept and mapping concept is
    chosen
  - For valid\_end\_date min of source concept and mapping concept is
    chosen

<div class="kable-table">

| concept\_id\_1 | concept\_id\_2 | relationship\_id | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_mapping\_type | tmp\_domain\_id\_2 |
| -------------: | -------------: | :--------------- | :----------------- | :--------------- | :-------------- | :----------------- | :----------------- |
|             46 |        4329041 | Maps to          | 2014-10-14         | 2099-12-31       | NA              | ICD10fi            | Condition          |
|             47 |       46234710 | Maps to          | 2015-01-01         | 2020-12-31       | NA              | ICD10fi            | Observation        |
|             47 |        4147183 | Maps to          | 2015-01-01         | 2020-12-31       | NA              | ICD10fi            | Condition          |
|             48 |         437663 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | ICD10fi            | Condition          |
|             49 |         439926 | Maps to          | 2014-07-01         | 2099-12-31       | NA              | ICD10fi            | Condition          |
|             50 |         439926 | Maps to          | 2014-07-01         | 2099-12-31       | NA              | ICD10fi            | Condition          |
|             51 |         372448 | Maps to          | 2018-11-28         | 2099-12-31       | NA              | ICD10fi            | Condition          |
|             52 |         380834 | Maps to          | 2014-07-01         | 2099-12-31       | NA              | ICD10fi            | Condition          |
|             53 |       46234710 | Maps to          | 2015-01-01         | 2020-12-31       | NA              | ICD10fi            | Observation        |
|             53 |        4147183 | Maps to          | 2015-01-01         | 2020-12-31       | NA              | ICD10fi            | Condition          |

</div>

## Recalculate domain

<div class="kable-table">

| domain\_id    |    n |
| :------------ | ---: |
| Condition     | 1330 |
| Observation   |   55 |
| Procedure     |   53 |
| Condition/Obs |    5 |
| Metadata      |    4 |

</div>

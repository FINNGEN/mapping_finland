# Mapping Finnish codes to the OMOP common data model

The [ observational medical outcomes partnership (OMOP) common data model (CDM)](https://www.ohdsi.org/) is gaining interest in Finland.
The most laborious task will be mapping and curating the medical codes specific from Finland to the standard codes in the OMOP CDM but once done these mapping can be used in the hole country and some Nordic neighbors.

The aim of this GitHub project avoid the duplication of work. This project communicates what is being done, share what has been done, and documents how it has been done.


**Basics**
In short, mapping means to connecting the condes from a non-standard vocabulary to the corresponding condes in the standard vocabulary.
Details of the process can be found [here](https://www.ohdsi.org/web/wiki/doku.php?id=documentation:vocabulary:introduction)

Vocabularies are organized into in medical domains. One vocabulary may cover more than one domain  ([see here](https://www.ohdsi.org/web/wiki/doku.php?id=documentation:vocabulary:domains_and_vocabularies)).


**Tools**
USAGI is a java tool provide by OHDSI that helps in mapping process of new vocabularies [here](https://github.com/OHDSI/Usagi)

# Mapping

## Condition Domain
Standard vocabulary SNOMED-CT

### ICD10fi

ICD10fi is an extension of the [ICD10who](https://icd.who.int/browse10/2016/en#/F20.0).

ICD10fi codes with Finnish and English names available [at THL](https://91.202.112.142/codeserver/pages/publication-view-page.xhtml?distributionKey=9394&versionKey=58&returnLink=fromVersionPublicationList)

==QUESTION: Some codes are combination of a pair of codes. One indicating the reason for the other.  Is it possible to map these concepts to the SNOMED-CT standard, or do they need to be split into 2 codes ???==


**DONE:**


**TODO:**
==FIRTS ASK THL, Aki asked several times with no success==
1. Match the ICD10who to the ICD10fi by code and name.
2. Manually curate these that match the code but not the name.
3. USAGI for these that don't match code nor name.  


### ICD9fi
ICD9fi is an extension of the [ICD9CM](https://en.wikipedia.org/wiki/List_of_ICD-9_codes).

ICD9fi codes with Finnish names available [at THL in pdf](https://www.julkari.fi/handle/10024/131850),
(I have this in text format from Vincent, ask if it is public information).

**DONE:**


**TODO:**
1. Translate the names using the ICD10fi table ?
2. Match the ICD9CM to the ICD9fi by code and name.
3. Manually curate these that match the code but not the name.
4. USAGI for these that don't match code nor name.  


### ICD8
??


### ICDO3
Coding system specific for oncology. International Classification of Diseases for Oncology, 3rd Edition (ICD-O-3).
[WHO](https://www.who.int/classifications/icd/adaptations/oncology/en/)

This vocabulary, at least the WHO version,  is completely mapped in to the OMOP.
==QUESTION: Is the vocabulary used in Finland the same as the WHO standard or is it a modification like ICD10fi ??==

### SNOMED-PSHP
In TAYS they use an extension of the  SNOMED vocabulary.

**DONE:**


**TODO:**
- Toni is working with this at the moment, ask him


## Drug Domain
Standard vocabulary RxNorm + RxNorm Extension
ATC is used as a classification vocabulary, but not as a standard.  

### ATC
ATC are currently mapped to RxNorm up to the 4th ATC level.
However, some the 5th level ATC codes ambiguous to RxNorm. This is being solved [OHDSI working group](https://forums.ohdsi.org/t/atc-working-group-meeting-agenda-and-minutes/4394/2).  


### VNRO
The Nordic Article Number (Vnr) is an identification code for a specific article of medicine with marketing authorisation in the Nordic countries [ref]h(ttps://wiki.vnr.fi/?page_id=36)

There is a table linking the codes to names, dosage, via, and more. Also the ATC code of the group.  
==QUESTION: this table is for private use, ask Aki if we can share it==

**DONE:**


**TODO:**
1. Combine name, dosage and via into one string similar to RxNorm naming.
2. Match the string to the RxNorm names, double check using the ATC code.
3. Manually curate these that match the code but not the name.



## Procedure domain
Standard vocabulary SNOMED-CT

### THL toimenpideluokitus (NOMESCO ??)
The procedure classification is based on the NCSP Nordic Classification of Surgical Procedures, first published in 1996. The NCSP classification is maintained by the Nordic Classification Center (NCC) and is copyrighted by NOMESKO [ref](
https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)

THL provides table with codes linked to English names, NOT all have it!!

==QUESTION, so is the same as NOMESCO ??==

**DONE:**
- 1% mapped to SNOMED-CT by a Swedish group [here](https://forums.ohdsi.org/t/nomesco-procedure-codes-to-SNOMED-CT/1544/4)


**TODO:**
1. USAGI for name.  



## Onservation domain

### Lääkekorvauksetkodit REIMB
Reimbursement of drugs codes [codes](https://www.kela.fi/laakkeet-ja-laakekorvaukset_erityiskorvaus)

Map to SNOMED observations ?? for example "history of" and "history of use of" ??


# Summary

| Vocabulary  | Map to    | Completed | FG-DF4 | FG-DF5 | TAYS | HUS |
| ----------- | --------- |:---------:|:------:|:------:|:----:|:---:|
| ICD10       | SNOMED-CT |   ~80%?   |   x    |   x    |  x   |  ?  |
| ICD9        | SNOMED-CT |   ~20%?   |   x    |   x    |  x   |  ?  |
| ICD8        | SNOMED-CT |           |   x    |   x    |      |  ?  |
| ICDO3       |           |  100% ??  |   x    |   x    |      |  ?  |
| SNOMED-PSHP | SNOMED-CT |           |        |        |  x   |     |
|             |           |           |        |        |      |     |
| ATC         | RxNorm    |    80%    |   x    |        |  x   |  ?  |
| VNRO        | RxNorm    |           |        |   x    |      |  ?  |
|             |           |           |        |        |      |     |
| NOMESCO     | SNOMED-CT |    1%?    |   x    |   x    |  x   |  ?  |
|             |           |           |        |        |      |     |
| REIMB       | SNOMED-CT |           |   x    |   x    |      |     |

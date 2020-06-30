# NOMESCO

# Intro
The procedure classification is based on the NCSP Nordic Classification of Surgical Procedures, first published in 1996. The NCSP classification is maintained by the Nordic Classification Center (NCC) and is copyrighted by NOMESKO [ref](
https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)

THL provides table with codes linked to English names, NOT all have it!!


#Mapping process
In short, USAGI in NOMESCO codes ranked by frequency calculated from  FinnGen-DF5 and TAYS. 

##In `1_source_files`
The count of codes in FinnGen-DF5 `freq_nomesco_finngen.csv` and TAYS `freq_procedures_tays.csv` are added to the  
 standard NOMESCO codes downloaded from [kodistopalvelu](https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119) `standard_nomesco_kodistopalvelu_119_1510562053330.txt`.

 This results in the table `standard_nomesco_with_freq.csv`. Moreover, tables  `finngen_codes_not_in_nomesco.csv` and `tays_codes_not_in_nomesco.csv` store these codes that in FinnGen-DF5 and TAYS that did not find a match on the NOMESCO standard.

 This process is detailed in `frequencies_from_tays_and_FG.rmd/html`.


##In 2_mapping_process
Resulting `1_source_files/standard_nomesco_with_freq.csv` was imported in to USAGY with vocabularies `VocabularyIds.txt` version `vocabularyVersion.txt`.

Mapping was carried by a medical student K and reviewed by H.

##In 3_mapping_tables
TODO: tables sent to Athena

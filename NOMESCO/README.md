---
title: "NOMESCO"
output: 
  html_document:
    df_print: paged
    toc: true
    keep_md: true
---






# Intro
The procedure classification is based on the NCSP Nordic Classification of Surgical Procedures, first published in 1996. The NCSP classification is maintained by the Nordic Classification Center (NCC) and is copyrighted by NOMESKO [ref](
https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)



# Formating source vocabulary to OMOP
The NOMESCO codes have been downloaded from [kodistopalvelu](https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)(7.5.2020). 

The concept names were translated to English as follow: 

- `THL`: concept name in English already exists in the source table. 
- `Traslator`: missing names were send to a translator by <mary.reeve@helsinki.fi>

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["name_en_source"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n"],"name":[2],"type":["int"],"align":["right"]}],"data":[{"1":"THL","2":"9303"},{"1":"Translator","2":"1983"},{"1":"NA","2":"10"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

Source table with added translation has been formatted to be similar to OMOP in  [1_source_vocabulary/nomesco_for_source_vocabulary.csv](1_source_vocabulary/nomesco_for_source_vocabulary.csv). 


# Mapping the source vocabulary to the standard vocabularies
In short, USAGI in NOMESCO codes ranked by frequency calculated from  FinnGen-DF5 and TAYS-oncology.

The combined frequencies from TAYS-oncology and FinnGen-DF5 [3_freq_of_source_codes/freq_total.csv](3_freq_of_source_codes/freq_total.csv)
were append to  [1_source_vocabulary/nomesco_for_source_vocabulary.csv](1_source_vocabulary/nomesco_for_source_vocabulary.csv). 
Resulting table was imported in to USAGY with vocabularies [2_mapping_to_standard/USAGI/VocabularyIds.txt](2_mapping_to_standard/USAGI/VocabularyIds.txt) version [2_mapping_to_standard/USAGI/vocabularyVersion.txt](2_mapping_to_standard/USAGI/vocabularyVersion.txt).

Mapping was carried by medical student [\@kalleaseppala](github.com/kalleaseppala) and reviewed by [\@helmisuominen](github.com/helmisuominen). 


### Progess in number of codes



From 11 275 codes 1 804 have been approved. 

This makes 16% of codes approved. 


<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["mappingStatus"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n"],"name":[2],"type":["int"],"align":["right"]}],"data":[{"1":"APPROVED","2":"1804"},{"1":"INVALID_TARGET","2":"20"},{"1":"UNCHECKED","2":"9451"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>



### Progess in number of events

Accepted codes covers 95% of the total number of events in the combined databases. 

Accepted codes covers all codes with more than 742 events in the combined databases.

Top50 of the unchecked events sort by number of events : 

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["sourceCode"],"name":[1],"type":["chr"],"align":["left"]},{"label":["sourceFrequency"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["matchScore"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["sourceName"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ADD_INFO:LongName"],"name":[5],"type":["chr"],"align":["left"]}],"data":[{"1":"ZXK00","2":"742","3":"0.5634167","4":"Conversion from percutaneous endoscopic to open procedure","5":"Toimenpiteen muuntaminen t<U+FFFD>hystystoimenpiteest<U+FFFD> avoimeksi leikkaukseksi"},{"1":"WW300","2":"731","3":"0.5420110","4":"Transfer of autologic stem cells","5":"Autologinen kantasolusiirto"},{"1":"NGJ62","2":"715","3":"0.5485615","4":"Internal fixation of fracture of knee or lower leg using plate and screws, other or unspecified","5":"S<U+FFFD><U+FFFD>rimurtumaleikkaus levyll<U+FFFD>"},{"1":"SJC01","2":"708","3":"0.4095736","4":"NA","5":"Yksitt<U+FFFD>isen kiinnikkeen paikan m<U+FFFD><U+FFFD>ritys ja etsauskiinnitys (Etsattava tai muu vastaava kiinnike)"},{"1":"SPC20","2":"700","3":"0.5401430","4":"Attachment of crone of tooth to implant","5":"Implanttikantoinen hammaskruunu"},{"1":"QB2S1","2":"697","3":"0.4095736","4":"NA","5":"Rintakeh<U+FFFD>n ihon tai ihonalaiskudoksen valokuvaus"},{"1":"QCB05","2":"697","3":"0.7368926","4":"Revision of wound of skin of upper limb","5":"Yl<U+FFFD>raajan syv<U+FFFD>n ihohaavan revisio ja mahdollinen sulku"},{"1":"KCW98","2":"691","3":"0.6113638","4":"Other transluminal endoscopic operation on bladder","5":"Muu virtsarakon toimenpide virtsatiet<U+FFFD>hystyksess<U+FFFD>"},{"1":"JGB00","2":"690","3":"0.6055401","4":"Partial proctectomy and colorectal or coloanal anastomosis","5":"Per<U+FFFD>suolen typistys, anteriorinen resektio"},{"1":"SDA04","2":"686","3":"0.5065472","4":"Very demanding parodonthologic therapy","5":"Parodontologinen hoito, pitk<U+FFFD>kestoinen"},{"1":"BC1AD","2":"686","3":"0.7890635","4":"CT of adrenal glands","5":"Lis<U+FFFD>munuaisten tietokonetomografiatutkimus"},{"1":"XX7JT","2":"680","3":"0.5332453","4":"Somatostatin isotope ablative therapy","5":"Radioindiumhoito somatostatiinireseptoriligandi"},{"1":"PG1XE","2":"679","3":"0.5566040","4":"Other ultrasound examination of blood vessel not elsewhere classified","5":"Verisuonten muu ultra<U+FFFD><U+FFFD>nitutkimus"},{"1":"NCJ40","2":"679","3":"0.6786234","4":"Closed reduction of fracture of elbow or forearm, distal radius","5":"V<U+FFFD>rttin<U+FFFD>luun tyypillisen murtuman paikalleenasetus ja sidos"},{"1":"NCU20","2":"678","3":"0.7638495","4":"Removal of internal fixation device from elbow or forearm","5":"Kyyn<U+FFFD>rp<U+FFFD><U+FFFD>n tai kyyn<U+FFFD>rvarren sis<U+FFFD>isen kiinnityslaitteen poisto"},{"1":"NBU20","2":"677","3":"0.7496721","4":"Removal of internal fixation device from shoulder or upper arm","5":"Olkap<U+FFFD><U+FFFD>n tai olkavarren sis<U+FFFD>isen kiinnityslaitteen poisto"},{"1":"PJ5AQ","2":"676","3":"0.4380349","4":"Sentinell lymphnode SPECT with low dose CT","5":"Vartijaimusolmukkeen SPET ja matala-annos-TT"},{"1":"WC105","2":"675","3":"0.3728894","4":"Simple cytostatic therapy of local tumor recidive","5":"Paikallisen uusiutuneen kasvaimen yksinkertainen solusalpaajahoito"},{"1":"SXA10","2":"673","3":"0.8210622","4":"Epithel biopsy of mouth","5":"Suun alueen limakalvon<U+FFFD>ytteen otto"},{"1":"ND1AD","2":"670","3":"0.6185623","4":"Wrist CT examination","5":"Ranteen ja k<U+FFFD>den tietokonetomografiatutkimus"},{"1":"WX600","2":"666","3":"0.5483485","4":"Single shot through catheter","5":"Kertapuudutus katetrilla"},{"1":"KED52","2":"666","3":"0.6174192","4":"Visual laser resection of prostate","5":"Eturauhasen laserhoito virtsatiet<U+FFFD>hystyksess<U+FFFD> (VLAP)"},{"1":"HAC15","2":"664","3":"0.7280536","4":"Subcutaneous mastectomy with excision of mamilla","5":"Rintarauhasen ihonalainen poisto ja n<U+FFFD>nnin poisto"},{"1":"AA3AD","2":"663","3":"0.4095736","4":"NA","5":"Kasvojen tietokonetomografiatutkimus"},{"1":"MBA40","2":"661","3":"0.6144610","4":"Pharmacological evacuation of uterus after abortion","5":"L<U+FFFD><U+FFFD>kkeellinen kohdun tyhjennys keskenmenon j<U+FFFD>lkeen"},{"1":"NHL16","2":"661","3":"0.6572089","4":"Tenolysis or tenosynovectomy of achilles tendon","5":"Akillesj<U+FFFD>nteen vapautus ja puhdistus, tenolyysi / tenosynovektomia"},{"1":"XMA20","2":"660","3":"0.7672927","4":"Early examination of pregnancy","5":"Varhaisraskauden tutkimus"},{"1":"NFU20","2":"659","3":"0.8971710","4":"Removal of internal fixation device from femur","5":"Lonkan tai reiden sis<U+FFFD>isen kiinnityslaitteen poisto"},{"1":"PA6AE","2":"658","3":"0.5252406","4":"Ulrasound examination of neck vasculature","5":"Kaulan verisuonten ultra<U+FFFD><U+FFFD>nitutkimus"},{"1":"FN1AD","2":"658","3":"0.8189182","4":"CT of coronary arteries","5":"Sepelvaltimoiden tietokonetomografiatutkimus"},{"1":"BC1CD","2":"656","3":"0.5980318","4":"Very extensive CT of adrenal glands","5":"Lis<U+FFFD>munuaisten eritt<U+FFFD>in laaja tietokonetomografiatutkimus"},{"1":"GAA96","2":"654","3":"0.7196741","4":"Other open or percutaneous drainage of pleural cavity","5":"Muu keuhkopussin kanavointi leikkauksessa tai suljetusti iholta"},{"1":"R1240","2":"654","3":"0.6399781","4":"Social assessment of need and possibilities of rehabilitation","5":"Sosiaalinen arvio kuntoutustarpeesta ja -mahdollisuuksista"},{"1":"TFP40","2":"654","3":"0.4152322","4":"Ablation treatment for a-v node re-entry activation","5":"Eteiskammiosolmukkeen kiertoaktivaation ablaatio"},{"1":"JN7AQ","2":"654","3":"0.5031630","4":"Somatostatin receptor SPET med low dose CT","5":"Somatostatiinireseptoreiden SPET ja matala-annos-TT"},{"1":"PD1AE","2":"653","3":"0.7625383","4":"Ultrasound examination of abdominal aortta","5":"Vatsa-aortan ultra<U+FFFD><U+FFFD>nitutkimus"},{"1":"NGJ60","2":"651","3":"0.6144843","4":"Internal fixation of fracture of knee or lower leg using intramedullary nail, other or unspecified","5":"S<U+FFFD><U+FFFD>ren ydinnaulaus"},{"1":"SAC03","2":"646","3":"0.4095736","4":"NA","5":"Suun ja hampaiston hoidon erillinen ty<U+FFFD>suunnittelu, eritt<U+FFFD>in vaativa"},{"1":"FN1CD","2":"644","3":"0.6207895","4":"Very extensive CT of coronary arteries","5":"Sepelvaltimoiden eritt<U+FFFD>in laaja tietokonetomografiatutkimus"},{"1":"NDG76","2":"643","3":"0.8061064","4":"Fusion of DIP joint","5":"Muun IP-nivelen luudutusleikkaus"},{"1":"XX1AW","2":"642","3":"0.4579529","4":"Written report from X-ray examination without contrast peformed elsewhere","5":"Lausunto natiivir<U+FFFD>ntgentutkimuksesta"},{"1":"SJB00","2":"640","3":"0.5200553","4":"Fitting of loose orthodontic device with user information","5":"Irtokojeen sovitus ja k<U+FFFD>yt<U+FFFD>n opetus"},{"1":"TNG11","2":"638","3":"0.4095736","4":"NA","5":"Diagnostisen tai hoitavan aineen ruiskuttaminen polveen"},{"1":"QAB10","2":"635","3":"0.7174521","4":"Major dressing of wound of skin of head or neck","5":"P<U+FFFD><U+FFFD>n tai kaulan ihohaavan tarkistus ja siteenvaihto"},{"1":"NA3BM","2":"635","3":"0.4870278","4":"Lumbar spine MRI examination with 3 Tesla magnet","5":"Lannerangan 3 Teslan MT"},{"1":"DE2BG","2":"633","3":"0.3732135","4":"Acoustic channel MRI examination with high intensity magnet","5":"Kuulohermon ja sis<U+FFFD>korvan magneettitutkimus"},{"1":"DQE00","2":"632","3":"0.6766962","4":"Implantation of prosthetic replacement for larynx","5":"Puheproteesin asettaminen"},{"1":"XX3AT","2":"632","3":"0.7223895","4":"Other labeling with ultrasound guidance","5":"Muu merkkaus U<U+FFFD>-ohjauksessa"},{"1":"XF614","2":"630","3":"0.8351000","4":"Measurement of pulmonary artery pressure","5":"Kiilapaineen mittaus"},{"1":"YX8BD","2":"628","3":"0.5951078","4":"Stereotactic extensive CT examination for dose design of radiotherapy","5":"Stereotaktinen laaja annossuunnittelu-TT"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>



# Assessing coverage of databases


 
 
 
### Database finngen 
 
**How many codes labeled as nomesco in finngen are not in the nomesco standard?** 
 
There are 260 codes not found in the standard 
 
Top50 sort by freq: 
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["code"],"name":[1],"type":["chr"],"align":["left"]},{"label":["freq"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["freq_per"],"name":[3],"type":["chr"],"align":["left"]}],"data":[{"1":"XLA10","2":"7408","3":"0.127%"},{"1":"RD211","2":"3200","3":"0.055%"},{"1":"XF640","2":"2477","3":"0.043%"},{"1":"1LA05","2":"1632","3":"0.028%"},{"1":"1XC03","2":"1619","3":"0.028%"},{"1":"WQ066","2":"1300","3":"0.022%"},{"1":"4AA12","2":"1102","3":"0.019%"},{"1":"6BA02","2":"993","3":"0.017%"},{"1":"1XC02","2":"830","3":"0.014%"},{"1":"1XC07","2":"774","3":"0.013%"},{"1":"3AC01","2":"700","3":"0.012%"},{"1":"1CX01","2":"667","3":"0.011%"},{"1":"4AB02","2":"588","3":"0.010%"},{"1":"1CD01","2":"580","3":"0.010%"},{"1":"3AX01","2":"571","3":"0.010%"},{"1":"XMA00","2":"562","3":"0.010%"},{"1":"1BC07","2":"555","3":"0.010%"},{"1":"1CD02","2":"539","3":"0.009%"},{"1":"WQ053","2":"521","3":"0.009%"},{"1":"XLA00","2":"490","3":"0.008%"},{"1":"XCK20","2":"469","3":"0.008%"},{"1":"1XX32","2":"417","3":"0.007%"},{"1":"XX9XW","2":"414","3":"0.007%"},{"1":"TFN04","2":"372","3":"0.006%"},{"1":"PHD79","2":"371","3":"0.006%"},{"1":"4AA33","2":"362","3":"0.006%"},{"1":"FM2CE","2":"339","3":"0.006%"},{"1":"XFP02","2":"328","3":"0.006%"},{"1":"WQ064","2":"310","3":"0.005%"},{"1":"RJ421","2":"294","3":"0.005%"},{"1":"RJ410","2":"292","3":"0.005%"},{"1":"4AA23","2":"288","3":"0.005%"},{"1":"WQ021","2":"288","3":"0.005%"},{"1":"4CJ01","2":"282","3":"0.005%"},{"1":"1XC13","2":"281","3":"0.005%"},{"1":"RJ411","2":"260","3":"0.004%"},{"1":"1AA09","2":"257","3":"0.004%"},{"1":"RS224","2":"211","3":"0.004%"},{"1":"3DX05","2":"206","3":"0.004%"},{"1":"WQ054","2":"202","3":"0.003%"},{"1":"5BA08","2":"201","3":"0.003%"},{"1":"0192","2":"186","3":"0.003%"},{"1":"WQ068","2":"185","3":"0.003%"},{"1":"4AC07","2":"184","3":"0.003%"},{"1":"90621","2":"175","3":"0.003%"},{"1":"WQ045","2":"155","3":"0.003%"},{"1":"WQ026","2":"152","3":"0.003%"},{"1":"WQ007","2":"150","3":"0.003%"},{"1":"1BA04","2":"145","3":"0.002%"},{"1":"0189","2":"133","3":"0.002%"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div> 
The full list can be found in [./3_freq_of_source_codes/finngen_not_in_nomesco.csv](./3_freq_of_source_codes/finngen_not_in_nomesco.csv) 
 
**Status of the nomesco codes in **finngen 
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["status"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["n_codes"],"name":[2],"type":["int"],"align":["right"]},{"label":["per_codes"],"name":[3],"type":["chr"],"align":["left"]},{"label":["n_events"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["per_events"],"name":[5],"type":["chr"],"align":["left"]}],"data":[{"1":"mapped","2":"1899","3":"32.428%","4":"7098911","5":"89.093%"},{"1":"not_mapped","2":"3697","3":"63.132%","4":"827042","5":"10.380%"},{"1":"not_found","2":"260","3":"4.440%","4":"42010","5":"0.527%"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div> 
 
 
### Database tays 
 
**How many codes labeled as nomesco in tays are not in the nomesco standard?** 
 
There are 1 119 codes not found in the standard 
 
Top50 sort by freq: 
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["code"],"name":[1],"type":["chr"],"align":["left"]},{"label":["freq"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["freq_per"],"name":[3],"type":["chr"],"align":["left"]}],"data":[{"1":"S2600","2":"181056","3":"3.950%"},{"1":"H0434","2":"55791","3":"1.217%"},{"1":"H0519","2":"52053","3":"1.136%"},{"1":"RS221","2":"22833","3":"0.498%"},{"1":"H0275","2":"21465","3":"0.468%"},{"1":"H0142","2":"20850","3":"0.455%"},{"1":"H0113","2":"20668","3":"0.451%"},{"1":"H0188","2":"19077","3":"0.416%"},{"1":"H0130","2":"16341","3":"0.357%"},{"1":"H0476","2":"16253","3":"0.355%"},{"1":"H0049","2":"15839","3":"0.346%"},{"1":"H0157","2":"14511","3":"0.317%"},{"1":"H0030","2":"11747","3":"0.256%"},{"1":"H0316","2":"10308","3":"0.225%"},{"1":"F763","2":"10274","3":"0.224%"},{"1":"H0054","2":"10246","3":"0.224%"},{"1":"H0414","2":"10192","3":"0.222%"},{"1":"H0112","2":"9657","3":"0.211%"},{"1":"H0473","2":"9615","3":"0.210%"},{"1":"H0702","2":"8427","3":"0.184%"},{"1":"H0003","2":"8298","3":"0.181%"},{"1":"H0266","2":"8170","3":"0.178%"},{"1":"6007","2":"8091","3":"0.177%"},{"1":"H0468","2":"7749","3":"0.169%"},{"1":"1246","2":"6274","3":"0.137%"},{"1":"RS220","2":"6193","3":"0.135%"},{"1":"H0900","2":"5849","3":"0.128%"},{"1":"RS222","2":"5647","3":"0.123%"},{"1":"XX9DW","2":"5626","3":"0.123%"},{"1":"F000","2":"5196","3":"0.113%"},{"1":"RS121","2":"5126","3":"0.112%"},{"1":"F309","2":"5077","3":"0.111%"},{"1":"H0139","2":"4949","3":"0.108%"},{"1":"H0569","2":"4849","3":"0.106%"},{"1":"H0110","2":"4720","3":"0.103%"},{"1":"F310","2":"4486","3":"0.098%"},{"1":"H0943","2":"4291","3":"0.094%"},{"1":"H0577","2":"4223","3":"0.092%"},{"1":"F220","2":"4012","3":"0.088%"},{"1":"RS120","2":"3997","3":"0.087%"},{"1":"H0451","2":"3934","3":"0.086%"},{"1":"H0901","2":"3849","3":"0.084%"},{"1":"H0631","2":"3803","3":"0.083%"},{"1":"H0941","2":"3645","3":"0.080%"},{"1":"H0320","2":"3609","3":"0.079%"},{"1":"RS230","2":"3602","3":"0.079%"},{"1":"K123","2":"3521","3":"0.077%"},{"1":"K250","2":"3496","3":"0.076%"},{"1":"XX9EW","2":"3357","3":"0.073%"},{"1":"F100","2":"3303","3":"0.072%"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div> 
The full list can be found in [./3_freq_of_source_codes/tays_not_in_nomesco.csv](./3_freq_of_source_codes/tays_not_in_nomesco.csv) 
 
**Status of the nomesco codes in **tays 
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["status"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["n_codes"],"name":[2],"type":["int"],"align":["right"]},{"label":["per_codes"],"name":[3],"type":["chr"],"align":["left"]},{"label":["n_events"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["per_events"],"name":[5],"type":["chr"],"align":["left"]}],"data":[{"1":"mapped","2":"1965","3":"27.548%","4":"4826176","5":"81.043%"},{"1":"not_mapped","2":"4049","3":"56.764%","4":"160602","5":"2.697%"},{"1":"not_found","2":"1119","3":"15.688%","4":"968337","5":"16.261%"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>





















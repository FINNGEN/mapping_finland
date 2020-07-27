# Mapping report - summer 2020
Kalle Seppälä

# Intro
First, get familiar with OHDSI, in particular the basics of the mapping: https://www.ohdsi.org/web/wiki/doku.php?id=documentation:vocabulary:mapping , use of the main mapping tool USAGI: https://www.ohdsi.org/web/wiki/doku.php?id=documentation:software:usagi and the source of our vocabularies Athena https://athena.ohdsi.org/search-terms/terms .

For more instructions on different cases, domains, etc, OHDSI wiki and the Book of OHDSI have plenty of answers, but you should be good to go with the few articles above. It might seem overwhelming at first glance but once you just get started with USAGI, you'll understand the simplicity of the work itself.

#**What is done so far**

During June and July of 2020 myself and Helmi Suominen worked on several different kinds of vocabularies, of which were removed the codes that already were translated to Standard vocabularies. Generally with larger vocabularies you should organize the vocabularies in the order of the frequency and work them starting from the top because when gathering a large set of data, the events that occur the most frequently are the most important. It is unlikely that it's worth anyone's time to map very low frequency events to standard vocabularies. As an example of this, in June I mapped 95% of the frequency of the non-standardized NOMESCO procedure codes by mapping <2000/11281 of the total number of codes before being moved on to the next job.

Here is what I and Helmi worked this summer:


- Large, unfinished vocabularies, where the smallest frequencies get so small it didn't make sense to spend time mapping them fully:
  - TAYS NOMESCO procedure codes (checked once)
  - TAYS lab codes (checked once)
  - TAYS paikalliset toimenpidekoodit
  - ICD10Finland diagnosis codes
  - ICD9Finland diagnosis codes
  - Kuvantamisdimensiosta

- Small, fully finished vocabularies:
  - Labradimensiosta
  - Erikoisalat


##**Challenges we noticed**
- **Random information:** Not really a problem, but it is to be noted that the source vocabularies being mapped often contain many codes that don't really hold any important medical information and might not have anything comparable in Standard vocabularies. Such examples include a codes called "the duration of the treatment between 6 and 8 hours" or in lab codes something as mundane and plane as "label" or "sample ordered". If you can map them, go ahead, but one ought not to stress over them.
- **Language:** Many of the vocabularies one has to map are either in Finnish/Swedish or Latin and when they have English translations, those translations are oftentimes bad or wrong. This is why one has those automatic English translations, they have to be extra careful not to map based on the translation, but rather use it as a helper when searching the right answers online.
- **Complicated source vocabulary descriptions:** This problem introduced itself the most prominently with procedure codes. When these issues arose, one simply had to make different judgement calls how to deal with them. Here are some examples:
  - **Or and and/or:** The Finnish versions repeatedly had the word "or" ("tai") in them, which made them impossible to map exactly. Some even had it twice, as in "Procedures X **and/or** Y done to the bodypart Z **or** Å". Standard vocabularies rarely have these types of ridiculous combinations, so this kind of souce name leads to multiple different, mutually excludatory mappings. Case by case one had to choose whether there was a concept a bit higher in hierarchy that would best suit this procedure. Generally though, it seemed like the mapping would loose too much of its medical information, and we'd just end up mapping it to several different concepts separately.
  - **Vague qualifiers:** As well as "or" different extremely vague qualifier values were present throughout the mapping, especially in procedure codes. Such vague qualifiers were most prominent in diagnostic procedures for example in radiology. These vague qualifier values include terms such as "**extensive** CT of the head" (pään **laaja** tietokonetomografia) or "**narrow** X-ray examination of lower abdomen" (alavatsan suppea röntgen). Generally we decided, that if the examination was labelled "extensive" or "very extensive" we mapped it to the same procedure both with and without contrast. Consulting a radiologist, if this turns out having been a mistake, it should be corrected case by case.
  - **Differing hierarchies:** This problem presented itself also in diagnostic codes as well as procedures. While Standard vocabularies are vast and especially in diagnostics cover almost all imaginable scenarios of real life events, the hierarchy is very much set and doesn't cover every level of different focus. For example, there might exist a group of conditions called "X" and within that group of conditions there are conditions such as "X1", "X2", "X3", etc. Then all of those conditions have a more exact version considering the part of the body the condition is on, for example "X2 on a toe". However, the Finnish diagnosis code used might just be "X on a toe", which doesn't exist in the standard vocabularies. In these kinds of cases, we checked partially based on the frequency of the event, if it was possible to induce, that 99% of the time the Finnish "X on a toe" would mean in real "X2 on a toe" based on how rare all the other "X's on a toe" -occurances were in real life and then map them together. However, this is rarely possible and therefore oftentimes one would have to map "X on a toe" to just "X" and separately to "condition on a toe". This doesn't really capture the same medical information on the research purposes but that is the judgement call we made.
  

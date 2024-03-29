#### Excluindo os medicamentos da tabela do SAS

#### ARQUIVO DO SPPS - Medicamentos

install.packages("memisc")

library(memisc)

setwd("C:/Users/Rafael/Documents/RStudio")

Med<- as.data.set(spss.system.file("medicamentos_fase4a_pro_saude.sav"))

Med <- Med[c(2,5)]

Med <- as.data.frame(Med)

View(Med)

library(plyr)

Med <- ddply(Med, .(quest), summarize, Rem = paste (med_rec, collapse = ", "))

names(Med)[names(Med) == 'quest'] <- 'Quest'


#### Lista Medicamentos HAS e, consequente, exclus�o:

ListedMeds <- c("diur�ticos", "carvedilol", "olmesartana", "tiaz�dicos", "clortalidona", "hidroclorotiazida", "indapamida", "bumetamida", "furosemida", "piretanida", "amilorida ", "espironolactona", "triantereno ", "antihipertensivo", "alfametildopa", "clonidina", "guanabenzo", "moxonidina", "doxazosina", "prazosina", "atenolol", "carvediol", "bisoprolol", "metoprolol", "nadolol", "propranolol", "hidralazina", "verapamil", "diltiazem", "anlodipino", "felodipino", "lacidipino", "isradipino", "nifedipino", "nitrendipino", "nisoldipino", "captopril", "enalapril", "losartana", "valsartana", "candesartana", "benazepril", "cilazapril", "fosinopril", "lisinopril", "perindopril", "ramipril", "trandolapril", "eprosartano", "ibersartano", "bumetanida", "labetalol", "metildopa", "reserpina", "guanetidina", "diur�ticos+", "tiaz�dicos+", "clortalidona+", "hidroclorotiazida+", "indapamida+", "bumetamida+", "furosemida+", "piretanida+", "amilorida+", "espironolactona+", "triantereno+", "antihipertensivo+", "alfametildopa+", "clonidina+", "guanabenzo+", "moxonidina+", "doxazosina+", "prazosina+", "atenolol+", "carvediol+", "bisoprolol+", "metoprolol+", "nadolol+", "propranolol+", "hidralazina+", "verapamil+", "diltiazem+", "anlodipino+", "felodipino+", "lacidipino+", "isradipino+", "nifedipino+", "nitrendipino+", "nisoldipino+", "captopril+", "enalapril+", "losartana+", "valsartana+", "candesartana+", "benazepril+", "cilazapril+", "fosinopril+", "lisinopril+", "perindopril+", "ramipril+", "trandolapril+", "eprosartano+", "ibersartano+", "bumetanida+", "labetalol+", "metildopa+", "reserpina+", "guanetidina+", "+diur�ticos", "+tiaz�dicos", "+clortalidona", "+hidroclorotiazida", "+indapamida", "+bumetamida", "+furosemida", "+piretanida", "+amilorida ", "+espironolactona", "+triantereno ", "+antihipertensivo", "+alfametildopa", "+clonidina", "+guanabenzo", "+moxonidina", "+doxazosina", "+prazosina", "+atenolol", "+carvediol", "+bisoprolol", "+metoprolol", "+nadolol", "+propranolol", "+hidralazina", "+verapamil", "+diltiazem", "+anlodipino", "+felodipino", "+lacidipino", "+isradipino", "+nifedipino", "+nitrendipino", "+nisoldipino", "+captopril", "+enalapril", "+losartana", "+valsartana", "+candesartana", "+benazepril", "+cilazapril", "+fosinopril", "+lisinopril", "+perindopril", "+ramipril", "+trandolapril", "+eprosartano", "+ibersartano", "+bumetanida", "+labetalol", "+metildopa", "+reserpina", "+guanetidina", "diur�ticos,", "tiaz�dicos,", "clortalidona,", "hidroclorotiazida,", "indapamida,", "bumetamida,", "furosemida,", "piretanida,", "amilorida,", "espironolactona,", "triantereno,", "antihipertensivo,", "alfametildopa,", "clonidina,", "guanabenzo,", "moxonidina,", "doxazosina,", "prazosina,", "atenolol,", "carvediol,", "bisoprolol,", "metoprolol,", "nadolol,", "propranolol,", "hidralazina,", "verapamil,", "diltiazem,", "anlodipino,", "felodipino,", "lacidipino,", "isradipino,", "nifedipino,", "nitrendipino,", "nisoldipino,", "captopril,", "enalapril,", "losartana,", "valsartana,", "candesartana,", "benazepril,", "Cilazapril,", "fosinopril,", "lisinopril,", "perindopril,", "ramipril,", "trandolapril,", "eprosartano,", "ibersartano,", "bumetanida,", "labetalol,", "metildopa,", "reserpina,", "guanetidina,", ",diur�ticos", ",tiaz�dicos", ",clortalidona", ",hidroclorotiazida", ",indapamida", ",bumetamida", ",furosemida", ",piretanida", ",amilorida ", ",espironolactona", ",triantereno ", ",antihipertensivo", ",alfametildopa", ",clonidina", ",guanabenzo", ",moxonidina", ",doxazosina", ",prazosina", ",atenolol", ",carvediol", ",bisoprolol", ",metoprolol", ",nadolol", ",propranolol", ",hidralazina", ",verapamil", ",diltiazem", ",anlodipino", ",felodipino", ",lacidipino", ",isradipino", ",nifedipino", ",nitrendipino", ",nisoldipino", ",captopril", ",enalapril", ",losartana", ",valsartana", ",candesartana", ",benazepril", ",cilazapril", ",fosinopril", ",lisinopril", ",perindopril", ",ramipril", ",trandolapril", ",eprosartano", ",ibersartano", ",bumetanida", ",labetalol", ",metildopa", ",reserpina", ",guanetidina")

for(m in ListedMeds){ Med = Med[ !grepl(m, Med$med_rec), ] }




#### Guardar fun��o: Med <- aggregate(med_rec ~ quest, FUN = "paste", data = Med)       Med <- lapply(Med, function(Quest) sub('^0+(?=[1-9])', '', Quest, perl=TRUE))


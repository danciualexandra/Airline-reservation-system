SELECT nume_companie,telefon FROM taxi_cab;
SELECT nume_companie,telefon FROM rent_a_car;
Select denumire from Destinatie;
Select nume,locatie from airport;
SELECT nume,telefon,adresa FROM companieAeriana GROUP BY nume;
select * from Uuser ;
SELECT dca.legId,d.denumire,c.nume,av.nume,av.model,s.decolareActual,s.sosireDestinatie,s.decolareDestinatie,s.sosireActual
FROM airport_schedule s , dest_comp_avion dca,destinatie d,avion av,companieAeriana c where (s.scheduleId=dca.scheduleId) and
  (dca.destinatiiId=d.destinatiiId) and
  (av.idAvion=dca.idAvion) and  (c.companieAerianaId=dca.companieAerianaId)
order by dca.legId;

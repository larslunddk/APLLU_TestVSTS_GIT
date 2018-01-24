-- Hvis shadow tabel endnu ikke eksisterer
select * into DC_INTEGRATION_FILELOGTRANS_shadow From DC_INTEGRATION_FILELOGTRANS
-- Hvis shadow tabel eksisterer
insert into DC_INTEGRATION_FILELOGTRANS_shadow select * From DC_INTEGRATION_FILELOGTRANS
#  DECLARATION  #

MASTER_IP=prd-kb-spider-snapdb08
RO_IP=prd-kb-spider-snapdb05
USERNAME=logical
DBNAME=kb_spider

################################################################
#        SCRIPT TO CONFIGURE LOGICAL REPLICATION     #

/usr/bin/psql -h $MASTER_IP -U $USERNAME -d $DBNAME -c '

CREATE PUBLICATION my_publication;
set search_path to public;
ALTER PUBLICATION my_publication add TABLE bdsa;
ALTER PUBLICATION my_publication ADD TABLE public.kb_release_link;
ALTER PUBLICATION my_publication ADD TABLE public.channel;
ALTER PUBLICATION my_publication ADD TABLE public.project_migration_target;
ALTER PUBLICATION my_publication ADD TABLE public.classic_channel_release_mapping;
ALTER PUBLICATION my_publication ADD TABLE public.project_deleted;
ALTER PUBLICATION my_publication ADD TABLE public.project;
ALTER PUBLICATION my_publication ADD TABLE public.download_release;
ALTER PUBLICATION my_publication ADD TABLE public.fingerprint_blacklist;
ALTER PUBLICATION my_publication ADD TABLE public.project_link;
ALTER PUBLICATION my_publication ADD TABLE public.link;
ALTER PUBLICATION my_publication ADD TABLE public.channel_release;
ALTER PUBLICATION my_publication ADD TABLE public.forge_type;
ALTER PUBLICATION my_publication ADD TABLE public.kb_release_migration;
ALTER PUBLICATION my_publication ADD TABLE  public.project_migration;
ALTER PUBLICATION my_publication ADD TABLE public.project_tag;
ALTER PUBLICATION my_publication ADD TABLE public.kb_release_deleted;
ALTER PUBLICATION my_publication ADD TABLE public.kb_release;
ALTER PUBLICATION my_publication ADD TABLE public.tag;
ALTER PUBLICATION my_publication ADD TABLE public.ongoing_release;
ALTER PUBLICATION my_publication ADD TABLE public.classic_channel_mapping;
ALTER PUBLICATION my_publication ADD TABLE public.kb_release_migration_target;
ALTER PUBLICATION my_publication ADD TABLE public.channel_alternate_forge;
ALTER PUBLICATION my_publication ADD TABLE public.ohloh_factoid_mapping;
ALTER PUBLICATION my_publication ADD TABLE public.channel_link;
ALTER PUBLICATION my_publication ADD TABLE public.channel_release_link;
set search_path to cwe;
ALTER PUBLICATION my_publication add TABLE common_consequence;
ALTER PUBLICATION my_publication add TABLE cwe;
set search_path to crypto;
ALTER PUBLICATION my_publication add TABLE algorithm;
ALTER PUBLICATION my_publication add TABLE download_algorithm;
set search_path to activity;
ALTER PUBLICATION my_publication add TABLE component;
ALTER PUBLICATION my_publication add TABLE cve;
ALTER PUBLICATION my_publication add TABLE license;
ALTER PUBLICATION my_publication add TABLE openhub ;
ALTER PUBLICATION my_publication add TABLE variant;
ALTER PUBLICATION my_publication add TABLE variant_bdsa;
ALTER PUBLICATION my_publication add TABLE variant_cve;
ALTER PUBLICATION my_publication add TABLE variant_vuln;
ALTER PUBLICATION my_publication add TABLE version;
ALTER PUBLICATION my_publication add TABLE version_bdsa;
ALTER PUBLICATION my_publication add TABLE version_cve;
ALTER PUBLICATION my_publication add TABLE version_vuln;
ALTER PUBLICATION my_publication add TABLE vuln;
set search_path to flld_2012_09_10_11_14;
ALTER PUBLICATION my_publication add TABLE license_families;
ALTER PUBLICATION my_publication add TABLE license_family_vsls;
ALTER PUBLICATION my_publication add TABLE license_vsls;
ALTER PUBLICATION my_publication add TABLE licenses;
set search_path to file_metadata;
ALTER PUBLICATION my_publication add TABLE extension ;
ALTER PUBLICATION my_publication add TABLE flld_basename;
ALTER PUBLICATION my_publication add TABLE language;
ALTER PUBLICATION my_publication add TABLE language_category;
set search_path to discovery;
ALTER PUBLICATION my_publication add TABLE kb_classic_project_data;
ALTER PUBLICATION my_publication add TABLE kb_classic_project_forge_id;
ALTER PUBLICATION my_publication add TABLE kb_classic_release__forge_id;
ALTER PUBLICATION my_publication add TABLE project;
ALTER PUBLICATION my_publication add TABLE release;
set search_path to 'ohloh';
ALTER PUBLICATION my_publication add TABLE language;;
ALTER PUBLICATION my_publication add TABLE link;
ALTER PUBLICATION my_publication add TABLE logo;
ALTER PUBLICATION my_publication add TABLE logo_url;
ALTER PUBLICATION my_publication add TABLE project;
ALTER PUBLICATION my_publication add TABLE tag;
ALTER PUBLICATION my_publication add TABLE tagging;
set search_path to trims;
ALTER PUBLICATION my_publication add TABLE vuln_cve;
ALTER PUBLICATION my_publication add TABLE vuln_cwe;
ALTER PUBLICATION my_publication add TABLE vuln_reference;
ALTER PUBLICATION my_publication add TABLE vuln;
ALTER PUBLICATION my_publication add TABLE vuln_cpe;
ALTER PUBLICATION my_publication add TABLE vuln_code_signature;
ALTER PUBLICATION my_publication add TABLE code_signature;
set search_path to nvd ;
select * from pg_publication_tables where schemaname = 'nvd';
ALTER PUBLICATION my_publication add TABLE cpe;
ALTER PUBLICATION my_publication add TABLE cve;
ALTER PUBLICATION my_publication add TABLE cve_cwe;
ALTER PUBLICATION my_publication add TABLE cve_reference;
ALTER PUBLICATION my_publication add TABLE mapping_type;
ALTER PUBLICATION my_publication add TABLE product;
ALTER PUBLICATION my_publication add TABLE cpe_channel_release;
ALTER PUBLICATION my_publication add TABLE product_channel;
ALTER PUBLICATION my_publication add TABLE cve_cpe;
set search_path to license;
ALTER PUBLICATION my_publication add TABLE license_set;
ALTER PUBLICATION my_publication add TABLE spdx;
ALTER PUBLICATION my_publication add TABLE spdx_url;
ALTER PUBLICATION my_publication add TABLE term;
ALTER PUBLICATION my_publication add TABLE license;
ALTER PUBLICATION my_publication add TABLE obligation;
ALTER PUBLICATION my_publication add TABLE translation;
ALTER PUBLICATION my_publication add TABLE bds_license;
ALTER PUBLICATION my_publication add TABLE classic_license_mapping;
ALTER PUBLICATION my_publication add TABLE license_obligation;'

/usr/bin/psql -h $RO_IP -U $USERNAME -d $DBNAME -c '

ALTER SUBSCRIPTION my_subscription DISABLE ;
ALTER SUBSCRIPTION my_subscription SET (slot_name = NONE);
DROP SUBSCRIPTION my_subscription;
 TRUNCATE public.kb_release_deleted cascade;
 TRUNCATE public.channel_release_link cascade;
 TRUNCATE public.download_release cascade;
 TRUNCATE public.kb_release_link cascade;
 TRUNCATE public.ohloh_factoid_mapping cascade;
 TRUNCATE public.fingerprint_blacklist cascade;
 TRUNCATE public.channel cascade
 TRUNCATE ohloh.tagging cascade;
 TRUNCATE ohloh.tag cascade;
 TRUNCATE ohloh.link cascade;
 TRUNCATE ohloh.logo cascade;
 TRUNCATE ohloh.logo_url cascade;
 TRUNCATE ohloh.language cascade;
 TRUNCATE ohloh.project cascade;
 TRUNCATE license.translation cascade;
 TRUNCATE license.term cascade;
 TRUNCATE license.obligation cascade;
 TRUNCATE license.spdx cascade;
 TRUNCATE license.spdx_url cascade;
 TRUNCATE license.license_set cascade;
 TRUNCATE license.license_obligation cascade;
 TRUNCATE license.license cascade;
 TRUNCATE nvd.cpe_channel_release cascade;
 TRUNCATE nvd.cve cascade;
 TRUNCATE nvd.cpe cascade;
 TRUNCATE nvd.mapping_type cascade;
 TRUNCATE crypto.download_algorithm cascade;
 TRUNCATE flld_2012_09_10_11_14.license_family_vsls cascade;
 TRUNCATE flld_2012_09_10_11_14.license_families cascade;
 TRUNCATE trims.vuln_code_signature cascade;
 TRUNCATE activity.component cascade;
 TRUNCATE activity.version_bdsa cascade;
 TRUNCATE flld_2012_09_10_11_14.license_vsls cascade;
 TRUNCATE flld_2012_09_10_11_14.licenses cascade;
 TRUNCATE activity.cve cascade;
 TRUNCATE cwe.common_consequence cascade;
 TRUNCATE cwe.cwe cascade;
 TRUNCATE discovery.widgets cascade;
 TRUNCATE nvd.product_channel cascade;
 TRUNCATE nvd.product cascade;
 TRUNCATE nvd.cve_cwe cascade;
 TRUNCATE nvd.cve_cpe cascade;
 TRUNCATE nvd.cve_reference cascade;
 TRUNCATE activity.license cascade;
 TRUNCATE activity.openhub cascade;
 TRUNCATE activity.version_cve cascade;
 TRUNCATE activity.variant cascade;
 TRUNCATE activity.variant_bdsa cascade;
 TRUNCATE activity.version_vuln cascade;
 TRUNCATE activity.variant_cve cascade;
 TRUNCATE activity.variant_vuln cascade;
 TRUNCATE activity.version cascade;
 TRUNCATE activity.vuln cascade;
 TRUNCATE crypto.algorithm cascade;
 TRUNCATE file_metadata.extension cascade;
 TRUNCATE file_metadata.language cascade;
 TRUNCATE file_metadata.language_category cascade;
 TRUNCATE public.project cascade;
 TRUNCATE public.kb_release cascade;
 TRUNCATE public.channel_release cascade;
 TRUNCATE public.project_deleted cascade;
 TRUNCATE public.link cascade;
 TRUNCATE public.forge_type cascade;
 TRUNCATE public.channel_link cascade;
 TRUNCATE public.tag cascade;
 TRUNCATE public.project_link cascade;
 TRUNCATE public.ongoing_release cascade;
 TRUNCATE public.project_tag cascade;
 TRUNCATE public.channel_alternate_forge cascade;
 TRUNCATE public.project_migration cascade;
 TRUNCATE public.kb_release_migration cascade;
 TRUNCATE trims.vuln_cpe cascade;
 TRUNCATE trims.vuln_cwe cascade;
 TRUNCATE trims.vuln_reference cascade;
 TRUNCATE file_metadata.flld_basename cascade;
 TRUNCATE discovery.project cascade;
 TRUNCATE discovery.kb_classic_project_data cascade;
 TRUNCATE discovery.kb_classic_project_forge_id cascade;
 TRUNCATE discovery.release cascade;
 
 CREATE SUBSCRIPTION my_subscription CONNECTION 'host=????? port=5432 password=my_password user=logical dbname=kb_spider' PUBLICATION my_publication;
 SELECT * FROM pg_stat_subscription;'

echo 'Check publication & subscription status' 
 
 
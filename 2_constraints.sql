USE MagicTheGatheringDB;

ALTER TABLE rarity ADD CONSTRAINT chk_rarity_name CHECK (rarity_name IN ('Common', 'Uncommon', 'Rare', 'Mythic'));
ALTER TABLE c_format ADD CONSTRAINT chk_format_name CHECK (format_name IN ('Standard', 'Pioneer', 'Modern', 'Legacy', 'Vintage', 'Commander', 'Historic', 'Pauper'));
ALTER TABLE format_legality ADD CONSTRAINT chk_legality_status CHECK (legality_status IN ('Legal', 'Not legal', 'Restricted', 'Forbidden'));
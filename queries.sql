/*CREATE VIEW charitems AS 
ALTER VIEW charitems AS*/

SELECT characters.id_character, characters.name, items.id_item, items.item FROM characters LEFT JOIN characters_items ON characters.id_character=characters_items.id_character LEFT JOIN items ON items.id_item=characters_items.id_item;



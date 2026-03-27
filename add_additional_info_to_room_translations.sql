-- Script to add additional_info column to room_translations table
ALTER TABLE room_translations ADD COLUMN additional_info TEXT NULL;

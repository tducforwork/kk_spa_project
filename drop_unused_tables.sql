-- ==============================================================================
-- SQL SCRPT: DROP UNUSED TABLES (GROUP 2 & GROUP 3 FEATURES)
-- ==============================================================================
-- You can run this script directly in your MySQL client (phpMyAdmin, DBeaver, etc.)
-- to clean up the unused tables related to Payment, Job Board, Companies, and Candidates.
-- ==============================================================================

SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------------------------
-- 1. DROP PAYMENT & WALLET TABLES (GROUP 2)
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS `deposits`;
DROP TABLE IF EXISTS `gateways`;
DROP TABLE IF EXISTS `gateway_currencies`;
DROP TABLE IF EXISTS `plans`;
DROP TABLE IF EXISTS `subscriptions`;
DROP TABLE IF EXISTS `transactions`;

-- ------------------------------------------------------------------------------
-- 2. DROP JOB BOARD & ATTRIBUTES TABLES (GROUP 3)
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `departments`;
DROP TABLE IF EXISTS `industries`;
DROP TABLE IF EXISTS `keywords`;
DROP TABLE IF EXISTS `skills`;
DROP TABLE IF EXISTS `types`;
DROP TABLE IF EXISTS `shifts`;
DROP TABLE IF EXISTS `experiences`;
DROP TABLE IF EXISTS `salary_periods`;
DROP TABLE IF EXISTS `locations`;
DROP TABLE IF EXISTS `number_of_employees`;
DROP TABLE IF EXISTS `education_degrees`;
DROP TABLE IF EXISTS `education_groups`;
DROP TABLE IF EXISTS `education_levels`;
DROP TABLE IF EXISTS `educational_qualifications`;
DROP TABLE IF EXISTS `jobs`;
DROP TABLE IF EXISTS `job_applies`;
DROP TABLE IF EXISTS `job_keywords`;
DROP TABLE IF EXISTS `favorite_items`;

-- ------------------------------------------------------------------------------
-- 3. DROP USER PROFILE EXTENSION TABLES (GROUP 3)
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS `user_certifications`;
DROP TABLE IF EXISTS `user_it_skills`;
DROP TABLE IF EXISTS `user_languages`;
DROP TABLE IF EXISTS `user_online_profiles`;
DROP TABLE IF EXISTS `user_patents`;
DROP TABLE IF EXISTS `user_presentations`;
DROP TABLE IF EXISTS `user_projects`;
DROP TABLE IF EXISTS `user_publications`;
DROP TABLE IF EXISTS `user_skills`;
DROP TABLE IF EXISTS `employment_histories`;

SET FOREIGN_KEY_CHECKS = 1;

-- ==============================================================================
-- FINISHED
-- ==============================================================================

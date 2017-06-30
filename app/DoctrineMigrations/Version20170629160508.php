<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20170629160508 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SEQUENCE users_id_seq;');
        $this->addSql('CREATE SEQUENCE task_id_seq');
        $this->addSql('CREATE SEQUENCE project_id_seq');
        $this->addSql('CREATE SEQUENCE workspace_id_seq');

        $this->addSql("CREATE TABLE workspace (id integer DEFAULT NEXTVAL('workspace_id_seq'), name character varying(255) NOT NULL, description text NOT NULL)");
        $this->addSql("CREATE TABLE users (id integer DEFAULT NEXTVAL('users_id_seq'), name character varying(255) NOT NULL, bio text NOT NULL, email character varying(255) NOT NULL)");
        $this->addSql("CREATE TABLE task (id integer DEFAULT NEXTVAL('task_id_seq'), title character varying(255) NOT NULL, description text NOT NULL, due_date timestamp(0) with time zone NOT NULL, attachment boolean, project_id integer NOT NULL, user_id integer NOT NULL)");
        $this->addSql("CREATE TABLE project (id integer DEFAULT NEXTVAL('project_id_seq'), title character varying(255) NOT NULL, description text NOT NULL, due_date timestamp(0) with time zone NOT NULL, workspace_id integer NOT NULL)");

        $this->addSql('ALTER TABLE ONLY task ADD CONSTRAINT task_pkey PRIMARY KEY (id)');
        $this->addSql('ALTER TABLE ONLY users ADD CONSTRAINT users_pkey PRIMARY KEY (id)');
        $this->addSql('ALTER TABLE ONLY project ADD CONSTRAINT project_pkey PRIMARY KEY (id)');
        $this->addSql('ALTER TABLE ONLY workspace ADD CONSTRAINT workspace_pkey PRIMARY KEY (id)');

        $this->addSql('ALTER TABLE task ADD CONSTRAINT task_project_id_fkey FOREIGN KEY (project_id) REFERENCES project (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE task ADD CONSTRAINT task_user_id_fkey FOREIGN KEY (user_id) REFERENCES users (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_527EDB25166D1F9C ON task (project_id)');
        $this->addSql('CREATE INDEX IDX_527EDB25A76ED395 ON task (user_id)');
        $this->addSql('ALTER TABLE project ADD CONSTRAINT project_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES workspace (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_2FB3D0EE82D40A1F ON project (workspace_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('DROP TABLE users CASCADE');
        $this->addSql('DROP TABLE workspace CASCADE');
        $this->addSql('DROP TABLE project CASCADE');
        $this->addSql('DROP TABLE task CASCADE');

        $this->addSql('DROP SEQUENCE users_id_seq;');
        $this->addSql('DROP SEQUENCE task_id_seq');
        $this->addSql('DROP SEQUENCE project_id_seq');
        $this->addSql('DROP SEQUENCE workspace_id_seq');
    }
}

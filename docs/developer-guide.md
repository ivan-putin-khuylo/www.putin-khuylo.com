# Developer Guide <!-- omit in toc -->

_A constantly evolving guide to developing Putin-Khuylo. It captures the current state of the architecture, includes rationales and guiding principals._

## Table of Contents <!-- omit in toc -->

- [About](#about)
- [Architectural Highlights](#architectural-highlights)
- [Developing for Putin-Khuylo](#developing-for-putin-khuylo)
  - [Prerequisites](#prerequisites)
  - [Setup and Configuration](#setup-and-configuration)
  - [Using the WordPress Container](#using-the-wordpress-container)
- [Usage](#usage)

## About

About

## Architectural Highlights

## Developing for Putin-Khuylo

Please read this section if you are interested in advancing and contributing to Putin-Khuylo.

### Prerequisites

- Git 2.34.1

### Setup and Configuration

- Clone this repository as your new project `git clone git@github.com:ivan-putin-khuylo/www.putin-khuylo.com.git`
- Make the helper scripts executable with `chmod +x scripts/*.sh`

### Using the WordPress Container

A local WordPress environment can be used for testing the plugin by running `npm start` which will invoke `scripts/start.sh`. If you need to return to a clean install of the local development environment you can run `npm start clean`. The `clean` parameter tells the script to remove the WordPress and MySQL containers before executing Docker Compose.

The WordPress code is mapped to the `src` directory which is currently `.gitignored`. Plugin code should placed in an appropriate subdirectory of `src/plugins` and a negating rule added to `.gitignore`.

The development environment should default to the TwentyTwentyOne theme which should be sufficient with the default Hello World page. If additional WordPress content is added and needs to be persisted then run `npm backup` which will backup the MySQL database to `docker/mysql.sql` after which it can be committed to the repository.

## Usage

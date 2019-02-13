---
title: postgres sql console
created: '2019-02-13T20:19:51.844Z'
modified: '2019-02-13T21:11:35.314Z'
tags: [Notebooks/Snippets, sql]
---

* List tables `\dt+ *.*`
* Describe tables `\d+ table_name`
* Quit `\q`

Better console:

```
# ~/.psqlrc

\set QUIET 1
\pset null '¤'

\set PROMPT1 '%[%033[1m%][%/] # '
-- SELECT * FROM. %R shows what type of input it expects.
\set PROMPT2 '... > '

\timing

\x auto
\set VERBOSITY verbose
\set HISTFILE ~/.psql_history- :DBNAME
\set HISTCONTROL ignoredups
\set COMP_KEYWORD_CASE upper
\unset QUIET

```

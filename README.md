# Polars DataFrame PlayGround
-------------------

In this post I quickly covered what I view as the limitations in [Pandas](https://pandas.pydata.org/) library:


1. High memory usage
2. Limited multi-core algorithms
3. No ability to execute SQL statements (like [SparkSQL & DataFrame](https://spark.apache.org/sql/))
4. No query planning/lazy-execution
5. [NULL values only exist for floats not ints](https://pandas.pydata.org/docs/user_guide/integer_na.html) (this changed in Pandas 1.0+)
6. Using [strings is inefficient](https://pandas.pydata.org/docs/user_guide/text.html) (this too changed in Pandas 1.0+)
    
Many of these issues have been addressed by the [Pandas 2.0 release](https://pandas.pydata.org/docs/dev/whatsnew/v2.0.0.html), but **I still feel the API is awkward!** 

So in this post I go over two alternatives:

* [Polars](https://www.pola.rs/) for dataframes
* [DuckDB](https://duckdb.org/) for SQL queries

I cover how to get set up in with 
Juptyer lab using [Docker](https://www.docker.com/) on [AWS](https://aws.amazon.com/) as well as some basics of [Polars](https://www.pola.rs/), [DuckDB](https://duckdb.org/) and how to use the two in combination. The benefits of Polars is that,

* It allows for fast parallel querying on dataframes.
* It uses [Apache Arrow](https://arrow.apache.org/) for backend datatypes making it efficient for memory.
* It has both lazy and eager execution mode.
* It allows for SQL queries direcly on dataframes.
* Its API is similar to Spark's API and allows for highly readable queries using method chaining.

DuckDB is a blazingly fast [OLAP](https://aws.amazon.com/what-is/olap/) SQL query engine. In the context of this blog post I cover how to use it to run SQL queries against Pandas/Polars dataframes and even local Parquet files!


## Using The Notebook
----------
You can install the dependencies and access the notebook using <a href="https://www.docker.com/">Docker</a> by building the Docker image with the following:

	docker build -t polars_nb .

Followed by running the command container:

	docker run -ip 8888:8888 -v `pwd`:/home/jovyan -t polars_nb

See <a href="https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html">here</a> for more info. 

Otherwise without Docker, make sure to use Python 3.10 and install the libraries listed in <code>requirements.txt</code>.  These can be installed with the command,

	pip install -r requirements.txt
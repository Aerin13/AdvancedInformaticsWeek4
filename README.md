# Advanced Informatics Week 4

## Question answers
1. How do you delete all output from a `snakemake` work flow?  

```shell
snakemake --delete-all-output
```  

2. How do you delete output from a single `snakemake` rule?  

I have no clue, and an hour of searching the docs + google has not shed any light on this.
The closest I can get is:
```shell
snakemake some_target --delete-all-output
```
But the problem is that this also deletes outputs in the rules leading up to the target rule.   

If you're looking to automatically delete files as part of the pipeline, you can flag certain output files as temporary in the rule itself.  
```
input:
    temp("input.txt")
```  

3. What is the citation for `snakemake`?  

Köster, Johannes and Rahmann, Sven. “Snakemake - A scalable bioinformatics workflow engine”. Bioinformatics 2012.  

4. Display `mtcars.png`  

![mtcars.png](https://github.com/Aerin13/AdvancedInformaticsWeek4/blob/main/mtcars.png?raw=true)  

5. Provide evidence that `touch`ing the various files does the right thing.  

`touch`ing the sqlite3 database:  
```
Building DAG of jobs...
Using shell: /bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       all
        1       plot
        2
Select jobs to execute...

[Thu Jan 28 14:07:37 2021]
rule plot:
    input: mtcars.sqlite3, makePlot.py
    output: mtcars.png
    jobid: 1

[Thu Jan 28 14:07:40 2021]
Finished job 1.
1 of 2 steps (50%) done
Select jobs to execute...

[Thu Jan 28 14:07:40 2021]
localrule all:
    input: mtcars.png
    jobid: 0

[Thu Jan 28 14:07:40 2021]
Finished job 0.
2 of 2 steps (100%) done
Complete log: /mnt/c/Users/Skylar2/Code/E283/AdvancedInformaticsWeek4/.snakemake/log/2021-01-28T140736.984221.snakemake.log
```  

`touch`ing the python script:  
```
Building DAG of jobs...
Using shell: /bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       all
        1       plot
        2
Select jobs to execute...

[Thu Jan 28 14:07:12 2021]
rule plot:
    input: mtcars.sqlite3, makePlot.py
    output: mtcars.png
    jobid: 1

[Thu Jan 28 14:07:16 2021]
Finished job 1.
1 of 2 steps (50%) done
Select jobs to execute...

[Thu Jan 28 14:07:16 2021]
localrule all:
    input: mtcars.png
    jobid: 0

[Thu Jan 28 14:07:16 2021]
Finished job 0.
2 of 2 steps (100%) done
Complete log: /mnt/c/Users/Skylar2/Code/E283/AdvancedInformaticsWeek4/.snakemake/log/2021-01-28T140712.527426.snakemake.log
```  

`touch`ing the R script:  
```
Building DAG of jobs...
Using shell: /bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       all
        1       data
        1       plot
        3
Select jobs to execute...

[Thu Jan 28 14:06:03 2021]
rule data:
    input: getData.R
    output: mtcars.sqlite3
    jobid: 2

[Thu Jan 28 14:06:06 2021]
Finished job 2.
1 of 3 steps (33%) done
Select jobs to execute...

[Thu Jan 28 14:06:06 2021]
rule plot:
    input: mtcars.sqlite3, makePlot.py
    output: mtcars.png
    jobid: 1

[Thu Jan 28 14:06:09 2021]
Finished job 1.
2 of 3 steps (67%) done
Select jobs to execute...

[Thu Jan 28 14:06:09 2021]
localrule all:
    input: mtcars.png
    jobid: 0

[Thu Jan 28 14:06:09 2021]
Finished job 0.
3 of 3 steps (100%) done
Complete log: /mnt/c/Users/Skylar2/Code/E283/AdvancedInformaticsWeek4/.snakemake/log/2021-01-28T140603.626288.snakemake.log
```

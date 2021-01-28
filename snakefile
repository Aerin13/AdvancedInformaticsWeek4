rule all:
    input:
        "mtcars.png"

rule data:
    input:
        "getData.R"
    output:
        "mtcars.sqlite3"
    shell:
        "Rscript getData.R"

rule plot:
    input:
        "mtcars.sqlite3",
        "makePlot.py"
    output:
        "mtcars.png"
    shell:
        "python makePlot.py"

#!/usr/bin/env nextflow
process FASTQC {

    tag "$sample_id"

    container "biocontainers/fastqc:v0.11.9_cv8"

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*_fastqc.zip", emit: zip
    path "*_fastqc.html", emit: html

    script:
    """
    fastqc ${reads}
    """
}
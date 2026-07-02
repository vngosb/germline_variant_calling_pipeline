#!/usr/bin/env nextflow

process BWA_MEM {

    tag "$sample_id"
    container "biocontainers/bwa:v0.7.17_cv1"

    input:
    tuple val(sample_id), path(read1), path(read2)
    path ref_files

    output:
    tuple val(sample_id), path("${sample_id}.sam"), emit: sam

    script:
    def fasta = ref_files.find { it.name == 'genome.fa' }
    """
    bwa mem \
        -t 4 \
        -R '@RG\\tID:SRR14724463\\tSM:NA12878\\tPL:ILLUMINA\\tLB:HG001.novaseq.wes_truseq\\tPU:SRR14724463' \
        ${fasta} \
        ${read1} \
        ${read2} \
        > ${sample_id}.sam
    """
}
#!/usr/bin/env nextflow

process HAPLOTYPECALLER {

    tag "$sample_id"

    container "broadinstitute/gatk:4.6.1.0"

    input:
    tuple val(sample_id), path(bam), path(bai)
    path ref_files

    output:
    tuple val(sample_id), path("${sample_id}.vcf.gz"), path("${sample_id}.vcf.gz.tbi"), emit: vcf

    script:
    def ref = ref_files.find { it.name.endsWith(".fa") }
    def fai = ref_files.find { it.name.endsWith(".fai") }
    def dict = ref_files.find { it.name.endsWith(".dict") }
    """
    gatk HaplotypeCaller \
        -R ${ref} \
        -I ${bam} \
        -O ${sample_id}.vcf.gz
    """
}
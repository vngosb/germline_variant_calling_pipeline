#!/usr/bin/env nextflow

// Module INCLUDE statements
include { FASTQC } from './modules/fastqc.nf'
include { TRIM_GALORE } from './modules/trim_galore.nf'
include { BWA_MEM } from './modules/bwa_mem.nf'
include { SAMTOOLS_SORT_INDEX } from './modules/samtools_sort_index'
include { HAPLOTYPECALLER} from './modules/haplotypecaller.nf'
/*
 * Pipeline parameters
 */
params{
    // FastQ files
    reads: Path
    genome: Path
}

workflow {

    main:
    // Create a channel
    reads_ch = Channel
        .fromFilePairs(params.reads)
    genome_ch = Channel
        .fromPath(params.genome)

    // Run FastQ quality check
    FASTQC(reads_ch)
    // Trimming
    TRIM_GALORE(reads_ch)
    // Alignment with reference genome
    BWA_MEM(TRIM_GALORE.out.trimmed_reads, genome_ch.collect())
    // Convert SAM to BAM, sort and index
    SAMTOOLS_SORT_INDEX(BWA_MEM.out)
    // VCF
    HAPLOTYPECALLER(SAMTOOLS_SORT_INDEX.out.bam.join(SAMTOOLS_SORT_INDEX.out.bai), genome_ch.collect())

    publish:
    fastqc_zip = FASTQC.out.zip
    fastqc_html = FASTQC.out.html
    trimmed_reads = TRIM_GALORE.out.trimmed_reads
    trimming_reports = TRIM_GALORE.out.trimming_reports
    trimming_fastqc = TRIM_GALORE.out.fastqc_reports
    sam = BWA_MEM.out
    bam = SAMTOOLS_SORT_INDEX.out.bam
    bai = SAMTOOLS_SORT_INDEX.out.bai
    vcf = HAPLOTYPECALLER.out
}

output{
    fastqc_zip {
        path 'fastqc'
    }
    fastqc_html {
        path 'fastqc'
    }
    trimmed_reads {
        path 'trimming'
    }
    trimming_reports {
        path 'trimming'
    }
    trimming_fastqc {
        path 'trimming'   
    }
    sam {
        path 'align'   
    }     
    bam {
        path 'sorted'   
    }
    bai {
        path 'sorted'   
    }      
    vcf {
        path 'vcf'
    }          
}          

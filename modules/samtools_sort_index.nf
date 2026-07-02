process SAMTOOLS_SORT_INDEX {

    container "community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464"

    input:
    tuple val(sample_id), path(sam)

    output:
    tuple val(sample_id), path("${sample_id}.sorted.bam"), emit: bam
    tuple val(sample_id), path("${sample_id}.sorted.bam.bai"), emit: bai

    script:
    """
    samtools view -bS ${sam} | samtools sort -o ${sample_id}.sorted.bam
    samtools index ${sample_id}.sorted.bam
    """

}
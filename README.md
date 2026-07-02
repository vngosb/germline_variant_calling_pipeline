# Germline Variant Calling Pipeline

A reproducible **Nextflow DSL2** workflow for germline variant calling from paired-end Illumina sequencing data. This pipeline performs quality control, adapter trimming, read alignment, BAM processing, and variant calling using widely adopted bioinformatics tools.

## Overview

This project demonstrates the implementation of a modular and reproducible NGS analysis workflow using Nextflow DSL2. Starting from raw paired-end FASTQ files, the pipeline automates each processing step to generate germline variant calls in VCF format.

The workflow was developed as a portfolio project to demonstrate practical experience with workflow development, pipeline automation, and best practices in computational genomics.

---

## Workflow

```text
Paired-End FASTQ
        │
        ▼
     FastQC
        │
        ▼
   Trim Galore
        │
        ▼
     BWA-MEM
        │
        ▼
 SAMtools Sort & Index
        │
        ▼
GATK HaplotypeCaller
        │
        ▼
        VCF
```

---

## Features

- Modular workflow built with **Nextflow DSL2**
- Automated quality control with **FastQC**
- Adapter and quality trimming using **Trim Galore**
- Sequence alignment with **BWA-MEM**
- BAM sorting and indexing using **SAMtools**
- Germline variant calling with **GATK HaplotypeCaller**
- Reproducible execution through workflow automation
- Easy to extend with additional downstream analyses

---

## Tools

| Tool | Purpose |
|------|---------|
| Nextflow DSL2 | Workflow management |
| FastQC | Read quality assessment |
| Trim Galore | Adapter and quality trimming |
| BWA-MEM | Read alignment |
| SAMtools | BAM processing |
| GATK HaplotypeCaller | Germline variant calling |

---

## Repository Structure

```
GERMLINE_VARIANT_CALLING_PIPELINE/
├── modules/
│   ├── bwa_mem.nf
│   ├── fastqc.nf
│   ├── haplotypecaller.nf
│   ├── samtools_sort_index.nf
│   └── trim_galore.nf
├── reference/
├── data/
├── results/
├── main.nf
├── nextflow.config
└── README.md
```

---

## Input

The pipeline accepts paired-end Illumina FASTQ files:

```
sample_1.fastq.gz
sample_2.fastq.gz
```

---

## Output

The workflow produces:

- FastQC quality reports
- Trimmed FASTQ files
- Aligned BAM files
- Sorted and indexed BAM files
- Germline variant calls (VCF)

---

## Running the Pipeline

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/Germline-Variant-Calling-Pipeline.git
cd Germline-Variant-Calling-Pipeline
```

Run the workflow:

```bash
nextflow run main.nf
```

---

## Skills Demonstrated

- Nextflow DSL2 workflow development
- Modular pipeline design
- NGS data processing
- Germline variant calling
- Pipeline automation
- Reproducible bioinformatics workflows
- Command-line bioinformatics tools
- Workflow organization and documentation

---

## Future Improvements

- Add MultiQC reporting
- Support joint genotyping
- Integrate Variant Quality Score Recalibration (VQSR)
- Add annotation with VEP or ANNOVAR
- Containerize the workflow with Docker
- Add Singularity support
- Implement CI/CD testing with GitHub Actions

---

## Author

**Victor Ngo**

M.S. Bioinformatics

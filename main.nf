// Nextflow DSL2
nextflow.enable.dsl=2

process kir_mapper_map {
    tag "$sampleId"

    publishDir 'output/map'

    memory { 32.GB * task.attempt }
    cpus { 8 * task.attempt }
    time { 30.minutes * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'terminate' }
    maxRetries 3

    input:
        tuple val(sampleId), file(r1), file(r2)
        file config
        file kir_mapper_db
    output:
        path 'output/map/'
    script:
        """
        wd=\$(pwd)/output

        kir-mapper map \
            -r1 $r1 \
            -r2 $r2 \
            -sample $sampleId \
            -config $config \
            -output \$wd \
            --exome
        """
}


workflow {
    fq = Channel.fromFilePairs('wes/*{1,2}.merged.fastq.gz', flat: true)
    kir_mapper_db = file('kir-mapper_db_latest')
    config_file = file("${workflow.projectDir}/assets/.kir-mapper_config")

    kir_mapper_map(fq, config_file, kir_mapper_db)
}
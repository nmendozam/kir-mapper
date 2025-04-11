This is a very simple pipeline to map WES data to KIR reference genes using [kir-mapper](https://github.com/erickcastelli/kir-mapper). This pipeline only implements the map step, because it is the most time intensive of all kir-mapper steps and it needs to be executed on each sample. The other steps (ncopy, genotype and haplotype) are executed on the whole sample set so they can be executed manually afterwords.

## Requirements
- [Nextflow](https://www.nextflow.io/)
- [Docker](https://www.docker.com/) or [Singularity](https://sylabs.io/docs/)

## Usage
Make sure to have the wes samples in the `wes` folder and the kir reference database in `kir-mapper_db_latest` (Check kir-mapper documentation to see how to download).
```bash
nextflow run nmendozam/kir-mapper -r main
```
If you don't have a nextflow configuration with docker activated. You can run the pipeline with the `-with-docker` flag:
```bash
nextflow run nmendozam/kir-mapper -r main -with-docker
```
## Output
The output will be in the `output/map` folder.
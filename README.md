This is a very simple pipeline to map WES data to KIR reference genes using [kir-mapper](https://github.com/erickcastelli/kir-mapper).

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
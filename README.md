This is a very simple pipeline to map WES data to KIR reference genes using [kir-mapper](https://github.com/erickcastelli/kir-mapper).

## Requirements
- [Nextflow](https://www.nextflow.io/)
- [Docker](https://www.docker.com/) or [Singularity](https://sylabs.io/docs/)

## Usage
Make sure to have the wes samples in the `wes` folder and the kir reference database in `kir-mapper_db_latest` (Check kir-mapper documentation to see how to download).
```bash
nextflow pull nmendozam/kir-mapper
nextflow run nmendozam/kir-mapper -r main
```
## Output
The output will be in the `output/map` folder.
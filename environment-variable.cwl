cwlVersion: v1.0

$graph:
- class: Workflow

  id: main

  requirements: 
  - class: MultipleInputFeatureRequirement
  - class: ScatterFeatureRequirement

  inputs:

    red: 
      type: string
    green: 
      type: string
    blue: 
      type: string
    s3_sign_request:
      type: string
    s3_region:
      type: string

  outputs:

    preview: 
      outputSource: node_gdal/preview
      type: File[]

  steps:

    node_gdal:

      in: 
        band: [red, green, blue]
        s3_sign_request: s3_sign_request
        s3_region: s3_region
        
      out: 
      - preview

      run:
        "#gdal"

      scatter: band
      scatterMethod: dotproduct 


- class: CommandLineTool
  
  id: gdal

  requirements:
    InlineJavascriptRequirement: {}
    DockerRequirement: 
      dockerPull: docker.io/osgeo/gdal  
    EnvVarRequirement:
      envDef:
        AWS_NO_SIGN_REQUEST: $(inputs.s3_sign_request)
        AWS_REGION: $(inputs.s3_region)
        
  baseCommand: gdal_translate

  arguments: 
  - -of
  - PNG
  - -ot 
  - Byte
  - -srcwin 
  - "100"
  - "100"
  - "100"
  - "100"
  - valueFrom: $( inputs.band )
  - valueFrom: $( inputs.band.split("/").slice(-1)[0].replace(".TIF", ".png") )

  inputs:

    band: 
      type: string
    s3_sign_request: 
      type: string
    s3_region: 
      type: string

  outputs:

    preview: 
      type: File
      outputBinding:
        glob: "*.png"
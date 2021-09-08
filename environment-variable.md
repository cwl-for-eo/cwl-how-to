# How to set environment variables

## Goal 

Tools run in a restricted environment and do not inherit most environment variables from the parent process. Environment variables are set explicitly.

## Recipe 

Environment variables are set using `EnvVarRequirement`.

The CWL document below sets the environment variables `AWS_NO_SIGN_REQUEST` and `AWS_REGION` to access GeoTIFF files hosted on an object storage exposing the S3 interface.

```yaml linenums="1" hl_lines="58-61"
--8<--
how-to/cwl-how-to/environment-variable.cwl
--8<--
```

## Execution

Use the parameters:

```yaml  linenums="1" 
--8<--
how-to/cwl-how-to/environment-variable.yml
--8<--
```

The execution shows:

```console
INFO /srv/conda/bin/cwltool 3.1.20210803132435
INFO Resolved 'environment-variable.cwl' to 'file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/environment-variable.cwl'
INFO [workflow ] start
INFO [workflow ] starting step node_gdal
INFO [step node_gdal] start
INFO ['docker', 'pull', 'docker.io/osgeo/gdal']
Using default tag: latest
latest: Pulling from osgeo/gdal
Digest: sha256:fd9cbc42d2854783451a2503d58d34f7893f42650afb07dbc91eb78a628a610d
Status: Image is up to date for osgeo/gdal:latest
docker.io/osgeo/gdal:latest
INFO [job node_gdal] /tmp/fi5kdx7z$ docker \
    run \
    -i \
    --mount=type=bind,source=/tmp/fi5kdx7z,target=/zlOvjL \
    --mount=type=bind,source=/tmp/kryustug,target=/tmp \
    --workdir=/zlOvjL \
    --read-only=true \
    --user=1000:1000 \
    --rm \
    --cidfile=/tmp/3re5iw68/20210908163154-211432.cid \
    --env=TMPDIR=/tmp \
    --env=HOME=/zlOvjL \
    --env=AWS_NO_SIGN_REQUEST=YES \
    --env=AWS_REGION=us-west-2 \
    docker.io/osgeo/gdal \
    gdal_translate \
    -of \
    PNG \
    -ot \
    Byte \
    -srcwin \
    100 \
    100 \
    100 \
    100 \
    /vsis3/landsat-pds/c1/L8/019/022/LC08_L1GT_019022_20170802_20170803_01_RT/LC08_L1GT_019022_20170802_20170803_01_RT_B4.TIF \
    LC08_L1GT_019022_20170802_20170803_01_RT_B4.png
Input file size is 8121, 8201
0...10...20...30...40...50...60...70...80...90...100 - done.
INFO [job node_gdal] Max memory used: 12MiB
INFO [job node_gdal] completed success
INFO [step node_gdal] start
INFO [job node_gdal_2] /tmp/23wqf24v$ docker \
    run \
    -i \
    --mount=type=bind,source=/tmp/23wqf24v,target=/zlOvjL \
    --mount=type=bind,source=/tmp/7b6chrm8,target=/tmp \
    --workdir=/zlOvjL \
    --read-only=true \
    --user=1000:1000 \
    --rm \
    --cidfile=/tmp/obywipov/20210908163157-530577.cid \
    --env=TMPDIR=/tmp \
    --env=HOME=/zlOvjL \
    --env=AWS_NO_SIGN_REQUEST=YES \
    --env=AWS_REGION=us-west-2 \
    docker.io/osgeo/gdal \
    gdal_translate \
    -of \
    PNG \
    -ot \
    Byte \
    -srcwin \
    100 \
    100 \
    100 \
    100 \
    /vsis3/landsat-pds/c1/L8/019/022/LC08_L1GT_019022_20170802_20170803_01_RT/LC08_L1GT_019022_20170802_20170803_01_RT_B3.TIF \
    LC08_L1GT_019022_20170802_20170803_01_RT_B3.png
Input file size is 8121, 8201
0...10...20...30...40...50...60...70...80...90...100 - done.
INFO [job node_gdal_2] Max memory used: 12MiB
INFO [job node_gdal_2] completed success
INFO [step node_gdal] start
INFO [job node_gdal_3] /tmp/kezw74z7$ docker \
    run \
    -i \
    --mount=type=bind,source=/tmp/kezw74z7,target=/zlOvjL \
    --mount=type=bind,source=/tmp/ekg38mvk,target=/tmp \
    --workdir=/zlOvjL \
    --read-only=true \
    --user=1000:1000 \
    --rm \
    --cidfile=/tmp/5cqb2_y9/20210908163159-929681.cid \
    --env=TMPDIR=/tmp \
    --env=HOME=/zlOvjL \
    --env=AWS_NO_SIGN_REQUEST=YES \
    --env=AWS_REGION=us-west-2 \
    docker.io/osgeo/gdal \
    gdal_translate \
    -of \
    PNG \
    -ot \
    Byte \
    -srcwin \
    100 \
    100 \
    100 \
    100 \
    /vsis3/landsat-pds/c1/L8/019/022/LC08_L1GT_019022_20170802_20170803_01_RT/LC08_L1GT_019022_20170802_20170803_01_RT_B2.TIF \
    LC08_L1GT_019022_20170802_20170803_01_RT_B2.png
Input file size is 8121, 8201
0...10...20...30...40...50...60...70...80...90...100 - done.
INFO [job node_gdal_3] Max memory used: 12MiB
INFO [job node_gdal_3] completed success
INFO [step node_gdal] completed success
INFO [workflow ] completed success
{
    "preview": [
        {
            "location": "file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B4.png",
            "basename": "LC08_L1GT_019022_20170802_20170803_01_RT_B4.png",
            "class": "File",
            "checksum": "sha1$7888d33b413ecd247e733267cf5e9c431b04fd95",
            "size": 90,
            "path": "/home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B4.png"
        },
        {
            "location": "file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B3.png",
            "basename": "LC08_L1GT_019022_20170802_20170803_01_RT_B3.png",
            "class": "File",
            "checksum": "sha1$7888d33b413ecd247e733267cf5e9c431b04fd95",
            "size": 90,
            "path": "/home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B3.png"
        },
        {
            "location": "file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B2.png",
            "basename": "LC08_L1GT_019022_20170802_20170803_01_RT_B2.png",
            "class": "File",
            "checksum": "sha1$7888d33b413ecd247e733267cf5e9c431b04fd95",
            "size": 90,
            "path": "/home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B2.png"
        }
    ]
}
INFO Final process status is success
```

## Reference

* [EnvVarRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#EnvVarRequirement)
* [EnvironmentDef](https://www.commonwl.org/v1.2/CommandLineTool.html#EnvironmentDef)
# How to create a file at runtime

## Goal 

Create a file at runtime.

Sometimes you need to create a file on the fly from input parameters, such as tools which expect to read their input configuration from a file rather than the command line parameters, or need a small wrapper shell script.

To generate such files we can use the `InitialWorkDirRequirement`.

## Recipe

The CWL document below shows a small wrapper shell script called `run.sh` that gets created at runtime. 

The `basecommand` is an array combining `/bin/sh` and the created file `run.sh` and it will execute the command `/bin/sh run.sh`. This will run the file we create in the shell.

`InitialWorkDirRequirement` requires a listing. As the listing is a YAML array we need a `-` on the first line of each element of the array, in this case we have just one element. `entryname`: can have any value, but it must match what was specified in the `baseCommand`. 

The final part is `entry`:, this is followed by `|-` which is YAML quoting syntax, and means that you are using a multiline string (without it we would need to write the whole script on one line). 


```yaml linenums="1" hl_lines="62-71 73"
--8<--
how-to/cwl-how-to/05-runtime/create-file-at-runtime.cwl
--8<--
```

## Execution

Use the parameters:

```yaml linenums="1" 
--8<--
how-to/cwl-how-to/05-runtime/create-file-at-runtime.yml
--8<--
```

The execution shows:

```console
INFO /srv/conda/bin/cwltool 3.1.20210803132435
INFO Resolved 'create-file-at-runtime.cwl' to 'file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/create-file-at-runtime.cwl'
INFO [workflow ] start
INFO [workflow ] starting step node_gdal
INFO [step node_gdal] start
INFO ['docker', 'pull', 'docker.io/osgeo/gdal']
Using default tag: latest
latest: Pulling from osgeo/gdal
Digest: sha256:fd9cbc42d2854783451a2503d58d34f7893f42650afb07dbc91eb78a628a610d
Status: Image is up to date for osgeo/gdal:latest
docker.io/osgeo/gdal:latest
INFO [job node_gdal] /tmp/50h8z4pj$ docker \
    run \
    -i \
    --mount=type=bind,source=/tmp/50h8z4pj,target=/ziURtg \
    --mount=type=bind,source=/tmp/rqajh51c,target=/tmp \
    --workdir=/ziURtg \
    --read-only=true \
    --user=1000:1000 \
    --rm \
    --cidfile=/tmp/_igcz1hh/20210908155350-669810.cid \
    --env=TMPDIR=/tmp \
    --env=HOME=/ziURtg \
    --env=AWS_NO_SIGN_REQUEST=YES \
    --env=AWS_REGION=us-west-2 \
    docker.io/osgeo/gdal \
    /bin/sh \
    run.sh
Input file size is 8121, 8201
0...10...20...30...40...50...60...70...80...90...100 - done.
INFO [job node_gdal] Max memory used: 0MiB
INFO [job node_gdal] completed success
INFO [step node_gdal] start
INFO [job node_gdal_2] /tmp/egb7trj8$ docker \
    run \
    -i \
    --mount=type=bind,source=/tmp/egb7trj8,target=/ziURtg \
    --mount=type=bind,source=/tmp/jdzoi6gz,target=/tmp \
    --workdir=/ziURtg \
    --read-only=true \
    --user=1000:1000 \
    --rm \
    --cidfile=/tmp/xltuldrb/20210908155358-070807.cid \
    --env=TMPDIR=/tmp \
    --env=HOME=/ziURtg \
    --env=AWS_NO_SIGN_REQUEST=YES \
    --env=AWS_REGION=us-west-2 \
    docker.io/osgeo/gdal \
    /bin/sh \
    run.sh
Input file size is 8121, 8201
0...10...20...30...40...50...60...70...80...90...100 - done.
INFO [job node_gdal_2] Max memory used: 12MiB
INFO [job node_gdal_2] completed success
INFO [step node_gdal] start
INFO [job node_gdal_3] /tmp/san4kbve$ docker \
    run \
    -i \
    --mount=type=bind,source=/tmp/san4kbve,target=/ziURtg \
    --mount=type=bind,source=/tmp/rxdhcudk,target=/tmp \
    --workdir=/ziURtg \
    --read-only=true \
    --user=1000:1000 \
    --rm \
    --cidfile=/tmp/izgoa3x3/20210908155401-198012.cid \
    --env=TMPDIR=/tmp \
    --env=HOME=/ziURtg \
    --env=AWS_NO_SIGN_REQUEST=YES \
    --env=AWS_REGION=us-west-2 \
    docker.io/osgeo/gdal \
    /bin/sh \
    run.sh
Input file size is 8121, 8201
0...10...20...30...40...50...60...70...80...90...100 - done.
INFO [job node_gdal_3] Max memory used: 19MiB
INFO [job node_gdal_3] completed success
INFO [step node_gdal] completed success
INFO [workflow ] completed success
{
    "preview": [
        {
            "location": "file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B4.png",
            "basename": "LC08_L1GT_019022_20170802_20170803_01_RT_B4.png",
            "class": "File",
            "checksum": "sha1$481bffe667120d2c41f5b9346c17db1541e56a28",
            "size": 322,
            "path": "/home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B4.png"
        },
        {
            "location": "file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B3.png",
            "basename": "LC08_L1GT_019022_20170802_20170803_01_RT_B3.png",
            "class": "File",
            "checksum": "sha1$481bffe667120d2c41f5b9346c17db1541e56a28",
            "size": 322,
            "path": "/home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B3.png"
        },
        {
            "location": "file:///home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B2.png",
            "basename": "LC08_L1GT_019022_20170802_20170803_01_RT_B2.png",
            "class": "File",
            "checksum": "sha1$481bffe667120d2c41f5b9346c17db1541e56a28",
            "size": 322,
            "path": "/home/fbrito/work/guide/docs/how-to/cwl-how-to/LC08_L1GT_019022_20170802_20170803_01_RT_B2.png"
        }
    ]
}
INFO Final process status is success
```

## Reference

* [InitialWorkDirRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#InitialWorkDirRequirement)


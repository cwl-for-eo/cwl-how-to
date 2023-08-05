# How to capture JSON stdout and re-use it

## Objective

This how-to aims to demonstrate how to use CWL to execute a command-line tool that produces JSON output, capture that JSON stdout, and reuse the extracted information in subsequent steps of the workflow. By following this tutorial, users will gain insights into efficiently processing JSON data within CWL workflows, particularly in the context of earth observation applications.

## Explanation

**Step 1 - Fetching STAC Item (node_stac)**

In this step, we use the CommandLineTool stac, which leverages the curl command to retrieve the STAC item from the provided URL.
The stac CommandLineTool takes the stac_item input parameter, representing the URL of the STAC item, and uses curl to fetch the data.
The stdout of the stac CommandLineTool will contain the JSON response, which contains information about the assets available in the STAC item.

**Step 2 - Extracting Asset Information**

To reuse the JSON stdout from Step 1, we utilize the CWL `outputEval` feature in the stac CommandLineTool's output definition.
The outputEval expression `(${ return JSON.parse(self[0].contents).assets; })` will parse the JSON stdout and extract the assets information, making it available as the output asset.

**Step 3 - Translating Raster Asset (node_translate)**

In this step, we use the `CommandLineTool` `translate`, which employs the `gdal_translate` command to convert the raster asset into a GeoTIFF file format.
The `translate` `CommandLineTool` takes the asset output from the previous step (the extracted JSON asset information) and the user-provided asset_id input.
It then translates the raster asset into a GeoTIFF file and generates the output tif.


```yaml linenums="1" hl_lines="62 74-79"
--8<--
how-to/cwl-how-to/03-json-stdout/capture-json-stdout.cwl
--8<--
```

```yaml
--8<--
how-to/cwl-how-to/03-json-stdout/capture-json-stdout.yml
--8<--
```

## Final Key Points

CWL workflows can capture JSON stdout from command-line tools using the `stdout` field in the `CommandLineTool` definition.
The `outputEval` feature allows users to extract and manipulate specific information from JSON stdout, making it available for reuse in subsequent steps of the workflow.
This how-to showcases a practical example of integrating JSON data processing within CWL workflows, which can be beneficial for handling complex earth observation data.

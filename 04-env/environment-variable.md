# How to set environment variables

## Objective 

This how-to aims to demonstrate how to set environment variables within a CWL workflow. Environment variables play a crucial role in configuring the execution environment for tools and commands in CWL. By following this tutorial, users will gain an understanding of how to define and utilize environment variables to customize the behavior of tools and enable smooth workflow execution.

## Explanation 

**Setting Environment Variables (EnvVarRequirement)**

CWL workflows can define environment variables for individual tools or globally within the workflow using the `EnvVarRequirement`.
In this tutorial, we use the `EnvVarRequirement` to set the `PROJ_LIB` environment variable, which defines the location of the PROJ library used by GDAL for coordinate transformation.
The `EnvVarRequirement` allows users to specify custom paths or configurations based on the execution environment requirements.

```yaml linenums="1" hl_lines="50-52"
--8<--
how-to/cwl-how-to/04-env/environment-variable.cwl
--8<--
```

## Final Key Points

Environment variables in CWL workflows can be defined using the `EnvVarRequirement` to configure tools' execution environment.
In this how-to, we set the `PROJ_LIB` environment variable to specify the path to the PROJ library for GDAL.
Users can modify the environment variables based on the specific requirements of the tools used in the workflow.
Setting environment variables allows for flexibility in customizing tool behavior and improving the reproducibility of workflows across different environments.

## Reference

* [EnvVarRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#EnvVarRequirement)
* [EnvironmentDef](https://www.commonwl.org/v1.2/CommandLineTool.html#EnvironmentDef)

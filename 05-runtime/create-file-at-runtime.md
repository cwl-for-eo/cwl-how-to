# How to create a file at runtime

## Objective 

This how-to aims to demonstrate how to use CWL to create a file at runtime within a workflow. Creating files at runtime allows users to dynamically generate data or outputs during workflow execution. With this how-to, users will understand how to generate files programmatically, which can be valuable for customizing workflow outputs or producing intermediate results for further analysis.

## Explanation

**Step 1 - File Creation at Runtime**

In CWL workflows, users can use `CommandLineTools` or `ExpressionTools` to create files at runtime.
`CommandLineTools` can execute scripts or commands to generate files during workflow execution.
`ExpressionTools` can use JavaScript expressions to create or manipulate data that can be captured as a file output.

**Step 2 - Using InitialWorkDirRequirement**

If using a `CommandLineTool` to create a file, the `InitialWorkDirRequirement` can be used to specify the location for the file creation.
The `InitialWorkDirRequirement` allows users to define the initial working directory for a tool, where the tool's output files will be stored.

```yaml linenums="1" hl_lines="53-62 67"
--8<--
how-to/cwl-how-to/05-runtime/create-file-at-runtime.cwl
--8<--
```

## Final Key Points

* CWL workflows allow file creation at runtime using CommandLineTools or ExpressionTools.
* CommandLineTools can execute scripts or commands to create files during workflow execution.
* ExpressionTools can use JavaScript expressions to generate data that can be captured as a file output.
* The `InitialWorkDirRequirement` can be used to define the location for file creation in CommandLineTools.
* File creation at runtime is valuable for generating custom outputs or intermediate results during workflow execution.

## Reference

* [InitialWorkDirRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#InitialWorkDirRequirement)


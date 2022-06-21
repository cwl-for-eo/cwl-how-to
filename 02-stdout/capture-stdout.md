# How to capture the stdout

## Questions

- How do I capture the standard output stream of a command?

## Objectives

- Learn how to capture streamed output from a tool.

## CWL

```yaml linenums="1" hl_lines="46 64-69"
--8<--
how-to/cwl-how-to/02-stdout/capture-stdout.cwl
--8<--
```

## Parameters 

```yaml
--8<--
how-to/cwl-how-to/02-stdout/capture-stdout.yml
--8<--
```

## Key points

- Use the `stdout` field to specify a filename to capture streamed output.

- The corresponding output parameter must have type: `stdout`.
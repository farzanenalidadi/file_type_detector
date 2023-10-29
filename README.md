# FileTypeDetector

**FileTypeDetector** is an Elixir module that allows you to detect the type of a file based on its binary content. It supports common file types such as GIF, JPEG, MP4, PNG, and generic text files.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Supported File Types](#supported-file-types)

## Installation

To include FileTypeDetector in your Elixir project, add it to your `mix.exs` dependencies:

```elixir
defp deps do
  [
    {:file_type_detector, github: "your-github-username/file_type_detector"}
  ]
end

````

## Usage

To use the **FileTypeDetector** module, follow these steps:

1. **Installation**: First, make sure you have the module installed in your Elixir project as described in the [Installation](#installation) section.

2. **Detecting File Type**: You can detect the type of a file by calling the `detect/1` function from the `FileTypeDetector` module. Provide the binary content of the file as an argument. The function will return a tuple indicating the detected file type or an error if the type couldn't be determined.

   Here are some example usages:

```elixir

   iex> FileTypeDetector.detect("sample.gif")
   {:ok, :gif}

   iex> FileTypeDetector.detect("sample.jpeg")
   {:ok, :jpeg}

   iex> FileTypeDetector.detect("sample.png")
   {:ok, :png}

   iex> FileTypeDetector.detect("sample.mp4")
   {:ok, :mp4}

   iex> FileTypeDetector.detect("sample.txt")
   {:ok, :text}

   iex> FileTypeDetector.detect("sample.xxx")
   {:error, :unsupported_file_type}

````
## supported-file-types

Supported File Types: FileTypeDetector supports the following file types:

````
:gif: GIF image files
:jpeg: JPEG image files
:mp4: MP4 video files
:png: PNG image files
:text: Generic text files
You can make use of these file types in your Elixir application based on the detection results.
````

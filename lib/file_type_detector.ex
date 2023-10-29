defmodule FileTypeDetector do
  @moduledoc """
  Documentation for FileTypeDetector.
  """

  @files_relative_path "files/"

  @gif_pattern <<0x47, 0x49, 0x46, 0x38>>
  @jpeg_pattern <<0xFF, 0xD8, 0xFF>>
  @mp4_pattern <<0x66, 0x74, 0x79, 0x70, 0x69, 0x73, 0x6F, 0x6D>>
  @png_pattern <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>

  @spec detect(binary) :: {:error, atom} | {:ok, :gif | :jpeg | :mp4 | :png | :text}
  @doc """
  detects file type

  ## TEST
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
      ...> |> case  do
      ...>   {:error,_} -> :error
      ...>   _ -> :ok
      ...> end
      :error


  """
  def detect(file_name) when is_bitstring(file_name) do
    # READ FILE
    File.read(Path.absname(@files_relative_path <> file_name))
    |> case do
      {:ok, content} -> content
      {:error, error} -> {:error, error}
    end
    |> case do
      content when is_binary(content) ->
        {:ok, file_type(content)}

      error ->
        error
    end
  end

  def file_type(<<@gif_pattern, _::bits>>), do: :gif

  def file_type(<<@jpeg_pattern, _::bits>>), do: :jpeg

  def file_type(<<_, _, _, _, @mp4_pattern, _::bits>>), do: :mp4

  def file_type(<<@png_pattern, _::bits>>), do: :png

  def file_type(<<_::bits>>), do: :text
end

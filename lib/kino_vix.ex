defmodule KinoVix do
  @external_resource "README.md"
  @moduledoc @external_resource
             |> File.read!()
             |> String.split("<!-- MDOC !-->")
             |> Enum.fetch!(1)
end

defimpl Kino.Render, for: Vix.Vips.Image do
  @moduledoc """
  Protocol implementation for Vix.Vips.Image

  Renders a %Vix.Vips.Image{} as an image in Livebook.

  The format is derived from the loader used by Vips.
  If you want to override this, e.g. convert a jpg to png,
  you can use a custom function for outputting an image to Livebook.
  An [example is available in the Vix package](https://hexdocs.pm/vix/0.13.0/picture-language.html#install-dependencies)
  """
  alias Vix.Vips.Image

  def to_livebook(image) do
    {:ok, loader} = image |> Vix.Vips.Image.header_value("vips-loader")
    format = loader |> String.replace_suffix("load", "")

    {:ok, image_bin} = Image.write_to_buffer(image, ".#{format}")
    Kino.Output.image(image_bin, "image/#{format}")
  end
end

defmodule KinoVixTest do
  use ExUnit.Case

  test "works with jpg" do
    {:ok, image} = Vix.Vips.Image.new_from_file("test/support/test.jpeg")

    {:image, _data, "image/jpeg"} = Kino.Render.to_livebook(image)
  end

  test "works with png" do
    {:ok, image} = Vix.Vips.Image.new_from_file("test/support/test.png")

    {:image, _data, "image/png"} = Kino.Render.to_livebook(image)
  end

  test "works with webp" do
    {:ok, image} = Vix.Vips.Image.new_from_file("test/support/test.webp")

    {:image, _data, "image/webp"} = Kino.Render.to_livebook(image)
  end

  test "works with gif" do
    {:ok, image} = Vix.Vips.Image.new_from_file("test/support/test.gif")

    {:image, _data, "image/gif"} = Kino.Render.to_livebook(image)
  end
end

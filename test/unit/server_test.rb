require_relative '../test_helper'

class ServerTest < ServerTestCase
  setup do
    10.times { Album.create title: "Hello #{lorem}" }
    client.define(Album, Album.ion.to_hash)
    assert client.ok?
  end

  test "about" do
    about = client.about
    assert_equal "Ion", about.app
    assert_equal Ion.version, about.version
  end

  test "search" do
    search = Album.ion.search {
      text :title, "Hello"
    }

    r_search = client.search(Album, search)
    assert client.ok?
    assert r_search.ids == search.ids
  end

  test "fail" do
    search = Album.ion.search {
      text :title, "Hello"
    }

    r_search = client.search(:NotAlbum, search)

    assert !client.ok?
    assert client.error.message.include?('not defined')
  end
end

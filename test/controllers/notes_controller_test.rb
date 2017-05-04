require "test_helper"

describe NotesController do
  let(:note) { notes :one }

  it "gets index" do
    get notes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_note_url
    value(response).must_be :success?
  end

  it "creates note" do
    expect {
      post notes_url, params: { note: { body: note.body } }
    }.must_change "Note.count"

    must_redirect_to note_path(Note.last)
  end

  it "shows note" do
    get note_url(note)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_note_url(note)
    value(response).must_be :success?
  end

  it "updates note" do
    patch note_url(note), params: { note: { body: note.body } }
    must_redirect_to note_path(note)
  end

  it "destroys note" do
    expect {
      delete note_url(note)
    }.must_change "Note.count", -1

    must_redirect_to notes_path
  end
end

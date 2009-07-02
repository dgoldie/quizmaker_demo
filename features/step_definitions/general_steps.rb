Then %r/the page is valid XHTML/ do
  response_body.should be_xhtml_strict if ENV["VALIDATION"]
end

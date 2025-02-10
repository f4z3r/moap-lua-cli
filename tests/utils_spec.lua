--# selene: allow(undefined_variable, incorrect_standard_library_use)

local utils = require("my-cli.utils")

context("Utils:", function()
  describe("when checking thing, it", function()
    local uuids = {
      "f6b4ab6c-aa36-41fa-8909-b924126825c5",
      "0d23524c-94c2-4e2a-9e1f-a0906583e9f5",
      "A0E61EAB-5328-49F3-BA49-57ABCCC7CCCD",
    }

    it("should do that", function()
      for _ in ipairs(uuids) do
        assert.is_true(true)
      end
    end)
  end)

  describe("when running external commands, it", function()
    local success, out = utils.run("echo -n 'test'")
    it("should correctly return output and success", function()
      assert.is_true(success)
      assert.are.equal("test", out)
    end)
  end)

  describe("when running failing commands, it", function()
    local success, out = utils.run("command nonexistant")
    it("should correctly return output and failure", function()
      assert.is_false(success)
      assert.has.match("command not found", out or "")
    end)
  end)
end)

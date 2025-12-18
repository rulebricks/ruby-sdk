# frozen_string_literal: true

require "test_helper"

describe Rulebricks::Internal::Types::Boolean do
  describe ".coerce" do
    it "coerces true/false" do
      assert Rulebricks::Internal::Types::Boolean.coerce(true)
      refute Rulebricks::Internal::Types::Boolean.coerce(false)
    end

    it "coerces an Integer" do
      assert Rulebricks::Internal::Types::Boolean.coerce(1)
      refute Rulebricks::Internal::Types::Boolean.coerce(0)
    end

    it "coerces a String" do
      assert Rulebricks::Internal::Types::Boolean.coerce("1")
      assert Rulebricks::Internal::Types::Boolean.coerce("true")
      refute Rulebricks::Internal::Types::Boolean.coerce("0")
    end

    it "passes through other values with strictness off" do
      obj = Object.new

      assert_equal obj, Rulebricks::Internal::Types::Boolean.coerce(obj)
    end

    it "raises an error with other values with strictness on" do
      assert_raises Rulebricks::Internal::Errors::TypeError do
        Rulebricks::Internal::Types::Boolean.coerce(Object.new, strict: true)
      end
    end
  end
end
